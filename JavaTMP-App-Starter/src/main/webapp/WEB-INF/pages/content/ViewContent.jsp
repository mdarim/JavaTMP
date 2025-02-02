<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">View And Read Content</h4>
    <hr/>
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header d-flex align-items-center justify-content-between py-1 px-3">
                    <ul class="nav">
                        <li class="nav-item">
                            <a id="show-written-content-id" class="nav-link" href="javascript:void(0);"><i class="far fa-eye-slash fa-fw fa-lg"></i>Show written text</a>
                        </li>
                        <li class="nav-item">
                            <a id="Update-Upload-Content-id" class="nav-link" href="javascript:void(0);"><i class="far fa-edit fa-fw fa-lg"></i>Update & Upload Content</a>
                        </li>
                        <li class="nav-item">
                            <a id="Read-Content-id" class="nav-link" href="javascript:void(0);"><i class="far fa-edit fa-fw fa-lg"></i>Ajax Read Content</a>
                        </li>
                    </ul>
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <form id="Update-Content-Form-Id" method="POST" action="${pageContext.request.contextPath}/cms/UpdateContentController">
                        <div class="form-group">
                            <label for="contentId">Content Id</label>
                            <input readonly="" name="contentId" type="text" class="form-control" id="contentId" value="">
                        </div>
                        <div class="form-group">
                            <label for="contentId">Content Title</label>
                            <input readonly="" name="title" type="text" class="form-control" value="">
                        </div>
                        <div class="form-group">
                            <label for="contentId">Content Body Text</label>
                            <textarea name="contentText" id="summernote" class="form-control"></textarea>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        /*
        Embed CSS styling for current page.
        */
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            var form = $("#Update-Content-Form-Id");
            $('#summernote').summernote({
                direction: javatmp.settings.direction,
                lang: javatmp.user.lang === "ar" ? "ar-AR" : javatmp.user.lang,
                height: 350,
                tabsize: 2,
                dialogsInBody: true,
                toolbar: [
                    ['style', ['fontname', 'fontsize', 'color', 'bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
                    ['Paragraph style', ['style', 'ol', 'ul', 'paragraph', 'height']],
                    ['Insert', ['picture', 'link', 'video', 'table', 'hr']],
                    ['Misc', ['fullscreen', 'codeview', 'undo', 'redo', 'help']],
                    ['mybutton', ['hello']]
                ]
            });
            $("#show-written-content-id").on("click", function (event) {
                var makrup = $('#summernote').summernote('code');
                var modal = BootstrapModalWrapperFactory.createModal({
                    message: makrup,
                    size: "modal-lg"
                });
                modal.show();
            });
            var send;
            $("#Update-Upload-Content-id").on("click", function (event) {
                send = false;
                var modalWrapper = BootstrapModalWrapperFactory.createModal({
                    message: "Are You Sure You Want To Update Content ?",
                    title: "Alert",
                    closable: false,
                    closeByBackdrop: false,
                    buttons: [
                        {
                            id: "update-content-dialog-cancel-id",
                            label: "Cancel",
                            cssClass: "btn btn-secondary",
                            action: function (button, buttonData, originalEvent) {
                                return this.hide();
                            }
                        },
                        {
                            label: "Yes",
                            cssClass: "btn btn-primary",
                            action: function (button, buttonData, originalEvent) {
                                if (send === true) {
                                    return this.hide();
                                }
                                $('#Update-Content-Form-Id').ajaxSubmit({
//                                    contentType: "application/json; charset=utf-8",
                                    url: javatmp.settings.contextPath + '/content/UpdateContent',
                                    beforeSerialize: function ($form, options) {
                                        $("#summernote").summernote('triggerEvent', 'change');
                                    },
                                    beforeSubmit: function (arr, $form, options) {
                                        modalWrapper.updateTitle("Updating ...");
                                        modalWrapper.updateMessage("Updating And Uploading Content ...");
                                        button.prop("disabled", true);
                                        $(button).html("Sending ...");
                                        send = true;
                                        modalWrapper.removeButton("update-content-dialog-cancel-id");
                                    },
                                    beforeSend: function () {},
                                    uploadProgress: function (event, position, total, percentComplete) {},
                                    success: function (response, statusText, xhr, $form) {
                                        modalWrapper.updateTitle("Response Successfully");
                                        modalWrapper.updateMessage(response.message);
                                        button.prop("disabled", false);
                                        $(button).html("OK");
                                    },
                                    complete: function (xhr) {
                                    },
                                    error: function (xhr, status, error, $form) {}
                                });
                            }
                        }
                    ]
                });
                modalWrapper.show();
            });

            $("#Read-Content-id").on("click", function (event) {
                send = false;
                var ajaxModalContainer = BootstrapModalWrapperFactory.createModal({
                    message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                    closable: false,
                    closeByBackdrop: false
                });
                ajaxModalContainer.originalModal.removeClass("fade");
                ajaxModalContainer.originalModal.find(".modal-dialog").css({transition: 'all .3s'});
                ajaxModalContainer.show();

                var passData = {
                    contentId: $("#Update-Content-Form-Id").find("input[name='contentId']").val()
                };

                $.ajax({
                    url: javatmp.settings.contextPath + "/content/readContentController",
                    data: passData,
                    success: function (response, textStatus, jqXHR) {
                        var timeOut = 500;
                        var timer = null;
                        function runWhenDialogOpen() {
//                    console.log("time out [" + Math.round(timeOut / 2) + "], isOpen [" + ajaxModalContainer.isOpen + "], is show [" + ajaxModalContainer.originalModal.hasClass("show") + "]");
                            if (ajaxModalContainer.isOpen) {
                                $('#summernote').summernote('code', response.contentText);
                                ajaxModalContainer.hide();
                            } else {
                                timeOut = timeOut <= 50 ? 50 : Math.round(timeOut / 2);
                                clearTimeout(timer);
                                timer = setTimeout(runWhenDialogOpen, timeOut);
                            }
                        }
                        runWhenDialogOpen();
                    }
                });

            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
                var passData = $(javatmp.settings.defaultOutputSelector).data("passData");
                if (passData && passData.contentId) {
                    window.javatmp.plugins.populateForm(form, passData);
                    form.find("textarea[name='contentText']").summernote('code', passData.contentText);
                    form.find("textarea[name='contentText']").summernote('triggerEvent', 'change');
                }
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
            });
            /**
             * When another sidebar menu item pressed and before container replaced with new ajax content.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * returning false will cancel the new request and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                $('#summernote').summernote("destroy");
                return true;
            });
        });
    </script>
</div>