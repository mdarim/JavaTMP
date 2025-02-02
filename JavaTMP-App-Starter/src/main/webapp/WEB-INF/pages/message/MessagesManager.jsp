<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div id="table-panel" class="card my-3">
                <div class="card-header">
                    Dynamic Messages List Table
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <table cellspacing="0" class="table table-condensed table-bordered table-hover table-striped display nowrap" id="defalut-dataTables-example">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Message Title</th>
                                <th>Creation Date</th>
                                <th>From User</th>
                                <th>To User</th>
                            </tr>
                            <tr id="filterHeader">
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        #table-panel table.dataTable {
            margin: 0!important;
        }
        table#defalut-dataTables-example {
            table-layout: fixed;
            word-wrap:break-word;
        }
        #filterHeader > th {
            padding: 0;
        }
    </style>

    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.

            $.fn.dataTable.ext.errMode = 'none';
            var table = $('#defalut-dataTables-example').DataTable({
//                responsive: true,
                dom: "<'row'<'col-sm-12'tr>>" +
                        "<'row'<'col-sm-6'i><'col-sm-6 pt-2 text-right'l>>" +
                        "<'row'<'col-sm-12'p>>",
                scrollY: 400,
                scrollX: true,
                "autoWidth": false,
//                fixedColumns: true,
//                "deferLoading": 0, // here
                scrollCollapse: true,
                "searching": true,
                searchDelay: 500,
                orderCellsTop: true, // important to for two row header with filteration below header column names.
                "processing": true,
                "serverSide": true,
                "drawCallback": function (settings) {
//                    alert('DataTables has redrawn the table');
                },
                initComplete: function () {
                    this.api().columns().every(function (index) {
                        var column = this;
                        if (index === 0) {
                            var input = $('<input id="id-search-input-id" class="form-control"/>')
                                    .appendTo($("#filterHeader").find('th').eq(0).empty())
                                    .on('keyup change', function () {
                                        var val = $.fn.dataTable.util.escapeRegex($(this).val());
                                        column.search(val ? val : '', true, false).draw();
                                    });
                        } else {
                            var input = $('<input class="form-control" />')
                                    .appendTo($("#filterHeader").find('th').eq(index).empty())
                                    .on('keyup change', function () {
                                        var val = $.fn.dataTable.util.escapeRegex($(this).val());
                                        column.search(val ? val : '', true, false).draw();
                                    });
                        }

                    });
                },
                "ajax": {
                    "type": "POST",
                    "url": javatmp.settings.contextPath + "/message/ListMessagesController",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    "data": function (currentDate) {
                        currentDate._ajaxGlobalBlockUI = false; // window blocked until data return
                        return JSON.stringify(currentDate);
                    },
                    "dataSrc": function (json) {
                        json["recordsTotal"] = json.data.recordsTotal;
                        json["recordsFiltered"] = json.data.recordsFiltered;
                        return json.data.data;
                    }
                },
                columns: [
                    {data: 'messageId', name: 'messageId'},
                    {data: 'messageTitle', name: 'messageTitle'},
                    {
                        data: 'creationDate',
                        name: 'creationDate',
                        "type": "date",
                        "render": function (data, type, row) {
                            return moment(data, "YYYY-MM-DDTHH:mm:ss.SSSZ").format("DD/MM/YYYY HH:mm");
                        }
                    },
                    {data: 'fromUserId', name: 'fromUserId'},
                    {data: 'toUserId', name: 'toUserId'}
                ]
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
                javatmp.util.waitForFinalEvent(function () {
//                    table.columns.adjust().draw();
                    table.columns.adjust();
                }, 200, "@dynamic-messages-datatables-resize");
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
//                table.columns.adjust().draw();
                table.columns.adjust();
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
//                table.columns.adjust().draw();
                table.columns.adjust();
            });
            /**
             * When another sidebar menu item pressed and before container replaced with new ajax content.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * returning false will cancel the new request and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                // it is important to destroy table before leaving current ajax page
                // so the fixedHeader will not be kept on site pages.
                table.clear();
                table.destroy(true);
                return true;
            });
        }
        );
    </script>
</div>