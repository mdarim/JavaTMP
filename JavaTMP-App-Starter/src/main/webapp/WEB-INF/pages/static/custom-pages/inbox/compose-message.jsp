<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">Compose A Message</h4>
    <hr/>
    <div class="row">
        <div class="col-lg-12">
            <div class="card" id="compose-message-id">
                <div class="card-header d-flex align-items-center py-2">
                    <div class="btn-group d-inline float-left">
                        <button type="button" class="btn btn-sm btn-success">Send</button>
                        <button type="button" class="btn btn-sm btn-danger">Discard</button>
                        <button type="button" class="btn btn-sm btn-default">Draft</button>
                    </div>
                    <div class="options ml-auto">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <form class="form-horizontal" id="fileupload" action="#" method="POST" enctype="multipart/form-data">

                                <div class="form-group row">
                                    <label class="col-lg-1 col-form-label" for="selectbasic">To</label>
                                    <div class="col-lg-11">
                                        <input id="textinput" name="textinput" type="text" placeholder="Recipients Of Your Email" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-1 col-form-label" for="selectbasic">Cc</label>
                                    <div class="col-lg-11">
                                        <input id="textinput" name="textinput" type="text" placeholder="Carbon Copy" class="form-control input-md">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-lg-1 col-form-label" for="selectbasic">Bcc</label>
                                    <div class="col-lg-11">
                                        <input id="textinput" name="textinput" type="text" placeholder="Blind Carbon Copy" class="form-control input-md">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-lg-1 col-form-label" for="selectbasic">Subject</label>
                                    <div class="col-lg-11">
                                        <input id="textinput" name="textinput" type="text" placeholder="Subject of your email" class="form-control input-md">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-lg-12">
                                        <textarea class="form-control" id="email-body" rows="8" name="textarea"></textarea>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        #compose-message-id > .panel-heading {
            padding-top: 3px;
            padding-bottom: 3px;
            padding-left: 3px;
        }
        #compose-message-id > .panel-heading > .options{
            line-height: 34px;
        }
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            $('#email-body').summernote({
                height: 200
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
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
                $('#email-body').summernote("destroy");
                return true;
            });
        });
    </script>
</div>