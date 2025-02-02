package com.javatmp.fw.data.jpa.util;

import com.javatmp.fw.domain.table.Order;
import com.javatmp.fw.domain.table.*;
import lombok.extern.slf4j.Slf4j;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.criteria.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@Slf4j
public class JpaUtil {

    public static <T> Path<T> convertStringToPath(Root<T> from, String strPathName) {
//        System.out.println("handling str [" + strPathName + "]");
        String[] attributes = strPathName.split("\\.");
        Path<T> retPath = from.get(attributes[0]);
        if (attributes.length > 1) {
            System.out.println("Try to get Alias :");
            Join<?, ?> join = null;
            for (Join j : from.getJoins()) {
                if (j.getAttribute().getName().equals(attributes[0])) {
                    join = j;
                    break;
                }
            }
            if (join == null) {
                System.out.println("join root with [" + attributes[0] + "]");
                join = from.join(attributes[0], JoinType.LEFT);
            }
            for (int i = 1; i < attributes.length; i++) {
                System.out.println("attr [" + attributes[i] + "] i [" + i + "] len [" + attributes.length + "]");
                retPath = retPath.get(attributes[i]);
                if (i < (attributes.length - 1)) {
                    boolean find = false;
                    for (Join j : join.getJoins()) {
                        System.out.println("is att [" + j.getAttribute().getName() + "] e [" + attributes[i] + "]");
                        if (j.getAttribute().getName().equals(attributes[i])) {
                            join = j;
                            System.out.println("find [" + attributes[i] + "] with [" + j.getAttribute().getName() + "]");
                            find = true;
                            break;
                        }
                    }
                    if (find == false) {
                        System.out.println("join [" + attributes[i - 1] + "] with [" + attributes[i] + "]");
                        join = join.join(attributes[i], JoinType.LEFT);
                    }
//                    join.getJoins().stream().forEach(ele -> {
//                        System.out.println("getAlias [" + ele.getAttribute().getName() + "]");
//                    });

                }
            }
        }
        return retPath;
    }

    public static <T> List<Selection<?>> convertArrToPaths(Root<T> from, String[] selectList) {
        List<Selection<?>> retLists = new LinkedList<Selection<?>>();
        for (String select : selectList) {
            retLists.add(JpaUtil.convertStringToPath(from, select));
        }
        return retLists;
    }

    public static <T> Predicate applyAdvanedSearchQuery(RuleOrGroup ruleOrGroup, CriteriaBuilder cb, Root<T> from) throws ParseException {
        Predicate retPredicate = null;
        String condition = ruleOrGroup.getCondition();
        if (condition != null) {
            // Group node:
//            System.out.println("Condition [" + condition + "] rule node of [" + ruleOrGroup.getRules().size() + "]");
            if (condition.equals("AND")) {
                retPredicate = cb.conjunction();
                System.out.print("(");
                for (int i = 0; i < ruleOrGroup.getRules().size(); i++) {
                    RuleOrGroup child = ruleOrGroup.getRules().get(i);
                    retPredicate = cb.and(retPredicate, applyAdvanedSearchQuery(child, cb, from));
                    if (i < (ruleOrGroup.getRules().size() - 1)) {
                        System.out.print(" AND ");
                    }
                }
                System.out.print(")");
            } else if (condition.equals("OR")) {
                retPredicate = cb.disjunction();
                System.out.print("(");
                for (int i = 0; i < ruleOrGroup.getRules().size(); i++) {
                    RuleOrGroup child = ruleOrGroup.getRules().get(i);
                    retPredicate = cb.or(retPredicate, applyAdvanedSearchQuery(child, cb, from));
                    if (i < (ruleOrGroup.getRules().size() - 1)) {
                        System.out.print(" OR ");
                    }
                }
                System.out.print(")");
            }
        } else {
            // leaf rule node:
//            System.out.println("rule node [" + (ruleOrGroup));
            System.out.print("(");
            System.out.print(ruleOrGroup.getField() + " " + ruleOrGroup.getOperator() + " " + ruleOrGroup.getValue());
            System.out.print(")");
            String opt = ruleOrGroup.getOperator();
            Object value = ruleOrGroup.getValue();
            String type = ruleOrGroup.getType();

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat dateTimeFormatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            String oldValue = null;
            if (type.equals("date") && !opt.equals("between") && !opt.equals("not_between") && !opt.equals("is_null") && !opt.equals("is_not_null")) {
                oldValue = value.toString();
                value = sdf.parse(value.toString());
            }
            if (type.equals("datetime") && !opt.equals("between") && !opt.equals("not_between") && !opt.equals("is_null") && !opt.equals("is_not_null")) {
                oldValue = value.toString();
                value = dateTimeFormatter.parse(value.toString());
            }
            log.debug("old value {}, new value {}", oldValue, value);
            if (opt.equals("equal")) {
                retPredicate = cb.equal(convertStringToPath(from, ruleOrGroup.getField()), value);
            } else if (opt.equals("not_equal")) {
                retPredicate = cb.notEqual(convertStringToPath(from, ruleOrGroup.getField()), value);
            } else if (opt.equals("less")) {
                retPredicate = cb.lessThan((Expression<Comparable>) convertStringToPath(from, ruleOrGroup.getField()), (Comparable) value);
            } else if (opt.equals("less_or_equal")) {
                retPredicate = cb.lessThanOrEqualTo((Expression<Comparable>) convertStringToPath(from, ruleOrGroup.getField()), (Comparable) value);
            } else if (opt.equals("greater")) {
                retPredicate = cb.greaterThan((Expression<Comparable>) convertStringToPath(from, ruleOrGroup.getField()), (Comparable) value);
            } else if (opt.equals("greater_or_equal")) {
                retPredicate = cb.greaterThanOrEqualTo((Expression<Comparable>) convertStringToPath(from, ruleOrGroup.getField()), (Comparable) value);
            } else if (opt.equals("is_null")) {
                retPredicate = cb.isNull(convertStringToPath(from, ruleOrGroup.getField()));
            } else if (opt.equals("is_not_null")) {
                retPredicate = cb.isNotNull(convertStringToPath(from, ruleOrGroup.getField()));
            } else if (opt.equals("begins_with")) {
                retPredicate = cb.like((Expression<String>) convertStringToPath(from, ruleOrGroup.getField()), (String) value + "%");
            } else if (opt.equals("ends_with")) {
                retPredicate = cb.like((Expression<String>) convertStringToPath(from, ruleOrGroup.getField()), "%" + (String) value);
            } else if (opt.equals("contains")) {
                retPredicate = cb.like((Expression<String>) convertStringToPath(from, ruleOrGroup.getField()), "%" + (String) value + "%");
            } else if (opt.equals("not_begins_with")) {
                retPredicate = cb.notLike((Expression<String>) convertStringToPath(from, ruleOrGroup.getField()), (String) value + "%");
            } else if (opt.equals("not_ends_with")) {
                retPredicate = cb.notLike((Expression<String>) convertStringToPath(from, ruleOrGroup.getField()), "%" + (String) value);
            } else if (opt.equals("not_contains")) {
                retPredicate = cb.notLike((Expression<String>) convertStringToPath(from, ruleOrGroup.getField()), "%" + (String) value + "%");
            } else if (opt.equals("in")) {
                // we should split value for list of proper type
                retPredicate = cb.equal(convertStringToPath(from, ruleOrGroup.getField()), value);
            } else if (opt.equals("not_in")) {
                // we should split value for list of proper type
                retPredicate = cb.not(cb.equal(convertStringToPath(from, ruleOrGroup.getField()), value));
            } else if (opt.equals("between")) {
                // we should split value for list of proper type
                if (type.equals("date")) {
                    List temp = (List) value;
                    List<Date> valueList = new LinkedList<>();
                    for (Object t : temp) {
                        valueList.add(sdf.parse(t.toString()));
                    }
                    retPredicate = cb.between((Expression<Date>) convertStringToPath(from, ruleOrGroup.getField()), valueList.get(0), valueList.get(1));
                } else if (type.equals("datetime")) {
                    List temp = (List) value;
                    List<Date> valueList = new LinkedList<>();
                    for (Object t : temp) {
                        valueList.add(dateTimeFormatter.parse(t.toString()));
                    }
                    retPredicate = cb.between((Expression<Date>) convertStringToPath(from, ruleOrGroup.getField()), valueList.get(0), valueList.get(1));
                } else {
                    List<Double> valueList = (List) value;
                    retPredicate = cb.between((Expression<Double>) convertStringToPath(from, ruleOrGroup.getField()), valueList.get(0), valueList.get(1));
                }
            } else if (opt.equals("not_between")) {
                if (type.equals("date")) {
                    List temp = (List) value;
                    List<Date> valueList = new LinkedList<>();
                    for (Object t : temp) {
                        valueList.add(sdf.parse(t.toString()));
                    }
                    retPredicate = cb.not(cb.between((Expression<Date>) convertStringToPath(from, ruleOrGroup.getField()), valueList.get(0), valueList.get(1)));
                } else if (type.equals("datetime")) {
                    List temp = (List) value;
                    List<Date> valueList = new LinkedList<>();
                    for (Object t : temp) {
                        valueList.add(dateTimeFormatter.parse(t.toString()));
                    }
                    retPredicate = cb.not(cb.between((Expression<Date>) convertStringToPath(from, ruleOrGroup.getField()), valueList.get(0), valueList.get(1)));
                } else {
                    List<Double> valueList = (List) value;
                    retPredicate = cb.not(cb.between((Expression<Double>) convertStringToPath(from, ruleOrGroup.getField()), valueList.get(0), valueList.get(1)));
                }
            } else {
                retPredicate = cb.equal(convertStringToPath(from, ruleOrGroup.getField()), value);
            }
        }
        return retPredicate;
    }

    public static <T> DataTableResults<T> retrievePageRequestDetails(EntityManager em, DataTableRequest<T> page) throws ParseException {

        log.debug("datatable request is {}", page);
        List retList = null;
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<T> cq = cb.createQuery(page.getClassType());
        Root<T> from = cq.from(page.getClassType());

        if (page.getSelects() == null || page.getSelects().length == 0) {
            cq.select(from);
        } else {
            cq.multiselect(JpaUtil.convertArrToPaths(from, page.getSelects()));
            for (String pathStr : page.getSelects()) {
                String[] attributes = pathStr.split("\\.");
                if (attributes != null && attributes.length > 1) {
                    from.join(attributes[0], JoinType.LEFT);
                }
            }
        }

        List<Order> orders = page.getOrder();
        if (orders != null) {
            for (Order order : orders) {
                Integer columnIndex = order.getColumn();
                DataTableColumn orderColumn = page.getColumns().get(columnIndex);

                Path<?> sortPath = JpaUtil.convertStringToPath(from, orderColumn.getData());
                if (order.getDir().value().equals("desc")) {
                    cq.orderBy(cb.desc(sortPath));
                } else {
                    cq.orderBy(cb.asc(sortPath));
                }
            }
        }

        Predicate predicate = cb.conjunction();

        if (page.getColumns() != null) {
            for (DataTableColumn column : page.getColumns()) {
                if (column.getSearch() != null && column.getSearch().getValue() != null
                        && !column.getSearch().getValue().trim().equals("")) {
                    log.debug("Try to create a predicate for column : {}, value : {}, operator : {}",
                            column.getName(), column.getSearch().getValue(), column.getSearch().getOperatorType());
                    if ("olderThan".equals(column.getSearch().getOperatorType())) {
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
                        Date searchDate = sdf.parse(column.getSearch().getValue());
                        predicate = cb.and(predicate, cb.lessThan(from.get(column.getName()), (Comparable) searchDate));
                    } else if ("newerThan".equals(column.getSearch().getOperatorType())) {
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
                        Date searchDate = sdf.parse(column.getSearch().getValue());
                        predicate = cb.and(predicate, cb.greaterThan(from.get(column.getName()), (Comparable) searchDate));
                    } else if ("equalThan".equals(column.getSearch().getOperatorType())) {
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
                        Date searchDate = sdf.parse(column.getSearch().getValue());
                        predicate = cb.and(predicate, cb.equal(from.get(column.getName()), (Comparable) searchDate));
                    } else {
                        if(column.getSearch().getValueObject() != null) {
                            predicate = cb.and(predicate, cb.equal(from.get(column.getName()), column.getSearch().getValueObject()));
                        } else {
                            predicate = cb.and(predicate, cb.equal(from.get(column.getName()), column.getSearch().getValue()));
                        }
                    }
                }
            }
        }

        // apply advanced filtration using RuleOrGroup object:
        System.err.println("tableRequest.getAdvancedSearchQuery() [" + page.getAdvancedSearchQuery() + "]");
        if (page.getAdvancedSearchQuery() != null) {
            predicate = cb.and(predicate, JpaUtil.applyAdvanedSearchQuery(page.getAdvancedSearchQuery(), cb, from));
            System.out.println();
        }

        cq.where(predicate);

        Query query = em.createQuery(cq);

        query.setFirstResult(page.getStart());
        query.setMaxResults(page.getLength());
        retList = query.getResultList();

        DataTableResults<T> dataTableResult = new DataTableResults<>();
        dataTableResult.setData(retList);

        CriteriaQuery<Long> cqLong = cb.createQuery(Long.class);
        Root<T> entity_ = cqLong.from(cq.getResultType());
        cqLong.select(cb.count(entity_));
        if (page.getSelects() != null && page.getSelects().length > 0) {
            for (String pathStr : page.getSelects()) {
                String[] attributes = pathStr.split("\\.");
                if (attributes != null && attributes.length > 1) {
                    entity_.join(attributes[0], JoinType.LEFT);
                }
            }

        }
        Predicate restriction = cq.getRestriction();
        if (restriction != null) {
            cqLong.where(restriction); // Copy restrictions
        }

        Long allCount = em.createQuery(cqLong).getSingleResult();

        dataTableResult.setRecordsTotal(allCount);
        dataTableResult.setRecordsFiltered(allCount);
        dataTableResult.setDraw(page.getDraw());

        return (DataTableResults<T>) dataTableResult;

    }

    public static <T> Long retrievePageRequestCount(EntityManager em, DataTableRequest<T> page) throws ParseException {

        log.debug("datatable request is {}", page);
        CriteriaBuilder cb = em.getCriteriaBuilder();

        CriteriaQuery<Long> cqLong = cb.createQuery(Long.class);
        Root<T> entity_ = cqLong.from(page.getClassType());
        cqLong.select(cb.count(entity_));
        if (page.getSelects() != null && page.getSelects().length > 0) {
            for (String pathStr : page.getSelects()) {
                String[] attributes = pathStr.split("\\.");
                if (attributes != null && attributes.length > 1) {
                    entity_.join(attributes[0], JoinType.LEFT);
                }
            }

        }

        Predicate predicate = cb.conjunction();

        if (page.getColumns() != null) {
            for (DataTableColumn column : page.getColumns()) {
                if (column.getSearch() != null && column.getSearch().getValue() != null
                        && !column.getSearch().getValue().trim().equals("")) {
                    if ("olderThan".equals(column.getSearch().getOperatorType())) {
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
                        Date searchDate = sdf.parse(column.getSearch().getValue());
                        predicate = cb.and(predicate, cb.lessThan(entity_.get(column.getName()), (Comparable) searchDate));
                    } else if ("newerThan".equals(column.getSearch().getOperatorType())) {
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
                        Date searchDate = sdf.parse(column.getSearch().getValue());
                        predicate = cb.and(predicate, cb.greaterThan(entity_.get(column.getName()), (Comparable) searchDate));
                    } else if ("equalThan".equals(column.getSearch().getOperatorType())) {
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
                        Date searchDate = sdf.parse(column.getSearch().getValue());
                        predicate = cb.and(predicate, cb.equal(entity_.get(column.getName()), (Comparable) searchDate));
                    } else {
                        predicate = cb.and(predicate, cb.equal(entity_.get(column.getName()), column.getSearch().getValue()));
                    }
                }
            }
        }

        // apply advanced filtration using RuleOrGroup object:
        System.err.println("tableRequest.getAdvancedSearchQuery() [" + page.getAdvancedSearchQuery() + "]");
        if (page.getAdvancedSearchQuery() != null) {
            predicate = cb.and(predicate, JpaUtil.applyAdvanedSearchQuery(page.getAdvancedSearchQuery(), cb, entity_));
            System.out.println();
        }

        cqLong.where(predicate);
        Long allCount = em.createQuery(cqLong).getSingleResult();

        return allCount;

    }


}
