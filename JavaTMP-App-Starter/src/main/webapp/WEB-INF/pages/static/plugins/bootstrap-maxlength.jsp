<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info mt-3">
                <p>This plugin integrates by default with Twitter bootstrap using badges to display the maximum lenght of the field where the user is inserting text. Uses the HTML5 attribute "maxlength" to work.</p>
                <br/>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://mimo84.github.io/bootstrap-maxlength/">Project Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/mimo84/bootstrap-maxlength/"><i class="fa fa-external-link-alt fa-fw"></i>github.com Page</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Bootstrap Maxlength
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-6 col-lg-offset-3">
                            <form role="form">
                                <div class="form-group">
                                    <label>Default</label>
                                    <input class="form-control default-options" maxlength="20">
                                    <p class="help-block">default input with maxlength equal 20</p>
                                </div>
                                <div class="form-group">
                                    <label>Max Length 20</label>
                                    <input class="form-control threshold-20" maxlength="20">
                                    <p class="help-block">Input with threshold equal 20</p>
                                </div>
                                <div class="form-group">
                                    <label>All Available options</label>
                                    <input class="form-control all-options" maxlength="20">
                                    <p class="help-block">Input with threshold equal 20</p>
                                </div>
                                <div class="form-group">
                                    <label>Maxlength with textarea</label>
                                    <textarea class="form-control textarea-maxlength"
                                              maxlength="40" rows="5"
                                              placeholder="This textarea has a limit of 225 chars."></textarea>
                                    <p class="help-block">Textarea with threshold equal 40</p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.


            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
                $('.default-options').maxlength({
                    warningClass: "badge badge-info",
                    limitReachedClass: "badge badge-warning"
                });
                $('.threshold-20').maxlength({
                    threshold: 20,
                    warningClass: "badge badge-info",
                    limitReachedClass: "badge badge-warning"
                });

                $('input.all-options').maxlength({
                    alwaysShow: true,
                    threshold: 10,
                    warningClass: "badge badge-success",
                    limitReachedClass: "badge badge-danger",
                    separator: ' of ',
                    preText: 'You have ',
                    postText: ' chars remaining.',
                    validate: true
                });
                $('.textarea-maxlength').maxlength({
                    alwaysShow: true,
                    allowOverMax: false,
                    twoCharLinebreak: false,
                    warningClass: "badge badge-info",
                    limitReachedClass: "badge badge-warning"
                });
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
                return true;
            });
        });
        jQuery(document).ready(function () {
            (function ($) {

            }(jQuery));
        });
    </script>
</div>