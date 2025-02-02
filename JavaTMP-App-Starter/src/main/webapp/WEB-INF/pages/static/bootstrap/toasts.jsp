<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col">
            <div class="card my-3">
                <div class="card-header">
                    Bootstrap Toasts
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <h4 class="card-title text-primary">Basic Example</h4>
                    <p class="">Toasts are as flexible as you need and have very little required markup.
                        At a minimum, we require a single element to contain your âtoastedâ content
                        and strongly encourage a dismiss button.
                    </p>
                    <div class="toast ShowBasicExampleToast" data-autohide="false" role="alert" aria-live="assertive" aria-atomic="true">
                        <div class="toast-header">
                            <strong class="mr-auto">Bootstrap</strong>
                            <small>11 mins ago</small>
                            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="toast-body">
                            Hello, world! This is a toast message.
                        </div>
                    </div>
                    <h4 class="card-title text-primary">Stacking Example</h4>
                    <p class="">When you have multiple toasts, we default to vertically stacking them in a readable manner.</p>
                    <div class="toast ShowBasicExampleToast" data-autohide="false" role="alert" aria-live="assertive" aria-atomic="true">
                        <div class="toast-header">
                            <strong class="mr-auto">Bootstrap</strong>
                            <small class="text-muted">just now</small>
                            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="toast-body">
                            See? Just like this.
                        </div>
                    </div>
                    <div class="toast ShowBasicExampleToast" data-autohide="false" role="alert" aria-live="assertive" aria-atomic="true">
                        <div class="toast-header">
                            <strong class="mr-auto">Bootstrap</strong>
                            <small class="text-muted">2 seconds ago</small>
                            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="toast-body">
                            Heads up, toasts will stack automatically
                        </div>
                    </div>
                    <h4 class="card-title text-primary">Placement Example</h4>
                    <p class="">Place toasts with custom CSS as you need them. The top right is often used for notifications, as is the top middle. If youâre only ever going to show one toast at a time, put the positioning styles right on the .toast.</p>
                    <div class="bg-dark" aria-live="polite" aria-atomic="true" style="position: relative; min-height: 200px;">
                        <div class="toast ShowBasicExampleToast" data-autohide="false" style="position: absolute; top: 0; right: 0;">
                            <div class="toast-header">
                                <strong class="mr-auto">Bootstrap</strong>
                                <small>11 mins ago</small>
                                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="toast-body">
                                Hello, world! This is a toast message.
                            </div>
                        </div>
                    </div>
                    <p class="">For systems that generate more notifications, consider using a wrapping element so they can easily stack.</p>
                    <div class="bg-dark" aria-live="polite" aria-atomic="true" style="position: relative; min-height: 200px;">
                        <!-- Position it -->
                        <div style="position: absolute; top: 0; right: 0;">
                            <!-- Then put toasts within -->
                            <div class="toast ShowBasicExampleToast" data-autohide="false" role="alert" aria-live="assertive" aria-atomic="true">
                                <div class="toast-header">
                                    <strong class="mr-auto">Bootstrap</strong>
                                    <small class="text-muted">just now</small>
                                    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="toast-body">
                                    See? Just like this.
                                </div>
                            </div>
                            <div class="toast ShowBasicExampleToast" data-autohide="false" role="alert" aria-live="assertive" aria-atomic="true">
                                <div class="toast-header">
                                    <strong class="mr-auto">Bootstrap</strong>
                                    <small class="text-muted">2 seconds ago</small>
                                    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="toast-body">
                                    Heads up, toasts will stack automatically
                                </div>
                            </div>
                        </div>
                    </div>
                    <p class="">You can also get fancy with flexbox utilities to align toasts horizontally and/or vertically.</p>
                    <!-- Flexbox container for aligning the toasts -->
                    <div aria-live="polite" aria-atomic="true" class="bg-dark d-flex justify-content-center align-items-center" style="min-height: 200px;">
                        <!-- Then put toasts within -->
                        <div class="toast ShowBasicExampleToast" data-autohide="false" aria-atomic="true" role="alert" aria-live="assertive" aria-atomic="true">
                            <div class="toast-header">
                                <strong class="mr-auto">Bootstrap</strong>
                                <small>11 mins ago</small>
                                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="toast-body">
                                Hello, world! This is a toast message.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">

    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                $('.ShowBasicExampleToast').toast('show');
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {

            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
            });
            // before container replaced with new ajax content.
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                return true;
            });

        });
    </script>
</div>