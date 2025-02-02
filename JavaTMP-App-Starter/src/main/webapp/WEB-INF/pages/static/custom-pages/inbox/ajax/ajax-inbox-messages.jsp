<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">Inbox Messages</h4>
    <hr/>
    <div class="row">
        <div class="col-lg-12">
            <div class="row">
                <div class="col-lg-3">
                    <form role="form">
                        <div class="form-group">
                            <button
                                type="button"
                                actionType="ajax-model"
                                href="pages/custom-pages/inbox/ajax/ajax-compose-message.html"
                                class="btn btn-danger btn-block actionable">Compose</button>
                        </div>
                    </form>
                    <div class="list-group zero-margin">
                        <a href="javascript:;" class="list-group-item list-group-item-action active">Inbox
                            <span class="badge badge-primary float-right">1098</span>
                        </a>
                        <a href="javascript:;" class="list-group-item list-group-item-action">Favourite
                            <span class="badge badge-primary float-right">57</span>
                        </a>
                        <a href="javascript:;" class="list-group-item list-group-item-action">Sent Mail
                            <span class="badge badge-primary float-right">329</span>
                        </a>
                        <a href="javascript:;" class="list-group-item list-group-item-action">Draft
                            <span class="badge badge-primary float-right">17</span>
                        </a>
                        <a href="javascript:;" class="list-group-item list-group-item-action">Spam
                            <span class="badge badge-primary float-right">16</span>
                        </a>
                        <a href="javascript:;" class="list-group-item list-group-item-action">Deleted
                            <span class="badge badge-primary float-right">521</span>
                        </a>
                    </div>
                </div>
                <div class="col-lg-9">

                    <table class="table table-striped inbox-table table-hover border">
                        <thead>
                            <tr>
                                <th colspan="3">
                                    <label class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-indicator"></span>
                                    </label>
                                    <div class="btn-group input-actions">
                                        <a class="btn btn-sm btn-success dropdown-toggle" href="javascript:;" data-toggle="dropdown" aria-expanded="false">
                                            Actions
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a class="dropdown-item" href="javascript:;">
                                                    <i class="fa fa-fw fa-pencil-alt"></i>Mark as Read</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="javascript:;">
                                                    <i class="fa fa-fw fa-ban"></i>Move</a>
                                            </li>
                                            <li class="divider"> </li>
                                            <li>
                                                <a class="dropdown-item" href="javascript:;">
                                                    <i class="fa fa-fw fa-trash"></i>Delete</a>
                                            </li>
                                        </ul>
                                    </div>
                                </th>
                                <th colspan="3">
                                    <div class="float-right">
                                        <span class="pagination-info"> 1 - 5 of 1098 </span>
                                        <button class="btn btn-sm btn-primary">
                                            <i class="fa fa-angle-left fa-fw"></i>
                                        </button>
                                        <button class="btn btn-sm btn-primary">
                                            <i class="fa fa-angle-right fa-fw"></i>
                                        </button>
                                    </div>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <label class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-indicator"></span>
                                    </label>
                                </td>
                                <td>
                                    <i class="fa fa-star"></i>
                                </td>
                                <td class="">
                                    <a actionType="ajax-model"
                                       href="pages/custom-pages/inbox/ajax/ajax-view-message.html"
                                       alt="" href="">
                                        Customer Support
                                    </a>
                                </td>
                                <td>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</td>
                                <td>
                                    <i class="fa fa-paperclip"></i>
                                </td>
                                <td class="view-message text-right"> 16:30 PM </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-indicator"></span>
                                    </label>
                                </td>
                                <td>
                                    <i class="fa fa-star"></i>
                                </td>
                                <td class="">
                                    <a actionType="ajax-model"
                                       href="pages/custom-pages/inbox/ajax/ajax-view-message.html"
                                       alt="" href="">
                                        Customer Support
                                    </a>
                                </td>
                                <td>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</td>
                                <td>
                                    <i class="fa fa-paperclip"></i>
                                </td>
                                <td class="view-message text-right"> 16:30 PM </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-indicator"></span>
                                    </label>
                                </td>
                                <td>
                                    <i class="fa fa-star"></i>
                                </td>
                                <td class="">
                                    <a actionType="ajax-model"
                                       href="pages/custom-pages/inbox/ajax/ajax-view-message.html"
                                       alt="" href="">
                                        Customer Support
                                    </a>
                                </td>
                                <td>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</td>
                                <td>
                                    <i class="fa fa-paperclip"></i>
                                </td>
                                <td class="view-message text-right"> 16:30 PM </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-indicator"></span>
                                    </label>
                                </td>
                                <td>
                                    <i class="fa fa-star"></i>
                                </td>
                                <td class="">
                                    <a actionType="ajax-model"
                                       href="pages/custom-pages/inbox/ajax/ajax-view-message.html"
                                       alt="" href="">
                                        Customer Support
                                    </a>
                                </td>
                                <td>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</td>
                                <td>
                                    <i class="fa fa-paperclip"></i>
                                </td>
                                <td class="view-message text-right"> 16:30 PM </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-indicator"></span>
                                    </label>
                                </td>
                                <td>
                                    <i class="fa fa-star"></i>
                                </td>
                                <td class="">
                                    <a actionType="ajax-model"
                                       href="pages/custom-pages/inbox/ajax/ajax-view-message.html"
                                       alt="" href="">
                                        Customer Support
                                    </a>
                                </td>
                                <td>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</td>
                                <td>
                                    <i class="fa fa-paperclip"></i>
                                </td>
                                <td class="view-message text-right"> 16:30 PM </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        .inbox-table tr {
            cursor: pointer;
        }
    </style>
    <!--<script src="components/"></script>-->
    <script type="text/javascript">
        jQuery(function ($) {

            // here we can reference the container bootstrap modal by its id
            // passed as parameter to request by name "ajaxModalId"
            // or for demo purposese ONLY we can get a reference top modal
            // in current open managed instances in BootstrapModalWrapperFactory
            var currentParentModal = BootstrapModalWrapperFactory.globalModals[BootstrapModalWrapperFactory.globalModals.length - 1];

            $("#" + currentParentModal.options.id).on(javatmp.settings.javaTmpAjaxContainerReady, function (event, modal) {
                // fire AFTER all transition done and your ajax content is shown to user.
                modal.updateSize("modal-xl");
//                modal.updateTitle("Inbox Messages");
//                modal.updateClosable(true);
                modal.addButton({
                    label: "Close",
                    cssClass: "btn btn-primary",
                    action: function (button, buttonData, originalEvent) {
                        return this.hide();
                    }
                });
            });
        });
    </script>
</div>