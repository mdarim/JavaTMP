<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <form autocomplete="off" method="post" novalidate="novalidate"
                  class="form addNewContentForm" action="${pageContext.request.contextPath}/content/CreateNewContent">
                <div class="form-row">
                    <div class="col-lg-12">
                        <div class="form-row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="control-label">title</label>
                                    <input class="form-control" type="text" placeholder="title"
                                           name="title"
                                           data-rule-required="true">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="control-label">summaryText</label>
                                    <textarea rows="5" class="form-control forceValidate" placeholder="summaryText" name="summaryText"
                                              data-rule-required="true"
                                              data-rule-maxlength="1000"></textarea>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="control-label">contentText</label>
                                    <textarea rows="5" class="form-control forceValidate" placeholder="" name="contentText"
                                              data-rule-summernoteRequired="true"
                                              data-rule-maxlength="5000"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!--<link href="components/" rel="stylesheet">-->
    <style type="text/css">

    </style>
</style>
<script type="text/javascript">
    jQuery(function ($) {
        // here we can reference the container bootstrap modal by its id
        // passed as parameter to request by name "ajaxModalId"
        // or for demo purposese ONLY we can get a reference top modal
        // in current open managed instances in BootstrapModalWrapperFactory
        var currentParentModal = BootstrapModalWrapperFactory.globalModals[BootstrapModalWrapperFactory.globalModals.length - 1];
//            console.log(currentParentModal.options.id);
        $("#" + currentParentModal.options.id).on(javatmp.settings.javaTmpAjaxContainerReady, function (event, modal) {
            // fire AFTER all transition done and your ajax content is shown to user.

            var form = $('.addNewContentForm', $("#" + currentParentModal.options.id));
            var validator = null;

            modal.updateTitle("Create New Content");
            modal.updateClosable(true);
            modal.updateSize("modal-lg");
            modal.addButton({
                label: "${labels['global.cancel']}",
                cssClass: "btn btn-danger mr-auto",
                action: function (button, buttonData, originalEvent) {
                    return this.hide();
                }
            });
            modal.addButton({
                label: "Create Content",
                cssClass: "btn btn-primary",
                action: function (button, buttonData, originalEvent) {
                    form.trigger("submit");
                }
            });
            var callbackData = {success: false, cancel: true};
            modal.originalModal.on('hidden.bs.modal', function (e) {
                // here we run passing function name as a remote callback
                javatmp.util.waitForFinalEvent(function () {
                    if ($.isFunction(modal.options.ajax.passData.callback)) {
                        modal.options.ajax.passData.callback.call(null, callbackData);
                    } else if ($.type(modal.options.ajax.passData.callback) === "string") {
                        javatmp.util.executeFunctionByName(modal.options.ajax.passData.callback, window, callbackData);
                    }
                }, 50, "@addNewContentPopup");
            });
            modal.setOnDestroy(function (modalInstance) {
                BootstrapModalWrapperFactory.createModal({
                    title: "${labels['dialog.confirmClosing.title']}",
                    message: "${labels['dialog.confirmClosing.msg']}",
                    closable: false,
                    closeByBackdrop: false,
                    buttons: [
                        {
                            label: "${labels['dialog.confirmClosing.noBtn']}",
                            cssClass: "btn btn-secondary",
                            action: function (button, buttonData, originalEvent) {
                                return this.hide();
                            }
                        },
                        {
                            label: "${labels['dialog.confirmClosing.yesBtn']}",
                            cssClass: "btn btn-primary",
                            action: function (button, buttonData, originalEvent) {
                                modalInstance.setOnDestroy(null);
                                modalInstance.hide();
                                return this.hide();
                            }
                        }
                    ]
                }).show();
                return false;
            });
            modal.originalModal.find(".modal-footer").addClass("justify-content-start");

            form.ajaxForm({
                clearForm: false, // clear all form fields after successful submit
                resetForm: false, // reset the form after successful submit
                beforeSerialize: function ($form, options) {
                    $("#summernote").summernote('triggerEvent', 'change');
                    if (!$form.valid()) {
                        return false;
                    }
                },
                beforeSubmit: function (formData, jqForm, options) {
                },
                success: function (response, statusText, xhr, $form) {
                    callbackData.cancel = false;
                    callbackData.success = true;
                    BootstrapModalWrapperFactory.createModal({
                        title: "${labels['global.response']}",
                        message: response.message
                    }).show();
                },
                error: function (xhr, status, error, $form) {
                    callbackData.cancel = true;
                    callbackData.success = false;
                    var errorMsg = xhr.responseText;
                    try {
                        var jsonData = $.parseJSON(errorMsg);
                        errorMsg = jsonData.message;
                    } catch (error) {
                    }
                    BootstrapModalWrapperFactory.createModal({
                        title: "${labels['global.error']}" + " : " + xhr.status,
                        message: errorMsg
                    }).show();
                }
            });
            // pre-submit callback

            // initialize jQuery Validation plugin using global data.
            validator = form.validate();

            var addressEditor = javatmp.plugins.summernoteWrapper(form.find("textarea[name='contentText']"));
        });
    });
</script>
</div>