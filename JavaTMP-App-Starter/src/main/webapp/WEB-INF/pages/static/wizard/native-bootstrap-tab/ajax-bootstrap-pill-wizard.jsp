<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col">
            <div class="card my-3">
                <div class="card-header">
                    AJAX Bootstrap Pill Wizard
                    <div class="options float-right">
                        <a href="#" class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row bootstrap-pill-wizard">
                        <div class="col-3">
                            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                <a data-url="pages/wizard/ajax/ajax-step-content.html"  class="disabled nav-item nav-link" id="step1-" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Step 1</a>
                                <a data-url="pages/wizard/ajax/ajax-step-content-1.html" class="disabled nav-item nav-link" id="step2-" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-profile" aria-selected="false">Step 2</a>
                                <a data-url="pages/wizard/ajax/ajax-step-content-2.html" class="disabled nav-item nav-link" id="step3-" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-messages" aria-selected="false">Step 3</a>
                                <a data-url="pages/wizard/ajax/ajax-step-content.html" class="disabled nav-item nav-link" id="step4-" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-settings" aria-selected="false">Step 4</a>
                            </div>
                        </div>
                        <div class="col-9">
                            <div class="tab-content" id="v-pills-tabContent">
                                <div class="tab-pane fade" id="v-pills-home" role="tabpanel" aria-labelledby="step1-">
                                </div>
                            </div>
                        </div>
                        <div class="col-12 justify-content-end d-flex">
                            <button type="button" class="mr-1 btn btn-primary previous-button disabled" disabled="">Previous</button>
                            <button type="button" class="btn btn-primary next-button disabled" disabled="">Next</button>
                        </div>
                    </div>
                    <div class="mt-3 row bootstrap-pill-wizard">
                        <div class="col-12">
                            <div class="nav nav-pills nav-justified" id="v-pills-tab1" role="tablist" aria-orientation="vertical">
                                <a data-url="pages/wizard/ajax/ajax-step-content.html" class="disabled nav-item nav-link" id="step1-1" data-toggle="pill" href="#v-pills-home1" role="tab" aria-controls="v-pills-home" aria-selected="true">Step 1</a>
                                <a data-url="pages/wizard/ajax/ajax-step-content-1.html" class="disabled nav-item nav-link" id="step2-1" data-toggle="pill" href="#v-pills-home1" role="tab" aria-controls="v-pills-profile" aria-selected="false">Step 2</a>
                                <a data-url="pages/wizard/ajax/ajax-step-content-2.html" class="disabled nav-item nav-link" id="step3-1" data-toggle="pill" href="#v-pills-home1" role="tab" aria-controls="v-pills-messages" aria-selected="false">Step 3</a>
                                <a data-url="pages/wizard/ajax/ajax-step-content.html" class="disabled nav-item nav-link" id="step4-1" data-toggle="pill" href="#v-pills-home1" role="tab" aria-controls="v-pills-settings" aria-selected="false">Step 4</a>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="tab-content" id="v-pills-tabContent1">
                                <div class="tab-pane fade" id="v-pills-home1" role="tabpanel" aria-labelledby="step1-">
                                </div>
                            </div>
                        </div>
                        <div class="col-12 justify-content-end d-flex">
                            <button type="button" class="mr-1 btn btn-primary previous-button disabled" disabled="">Previous</button>
                            <button type="button" class="btn btn-primary next-button disabled" disabled="">Next</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--
    Reference Your external Stylesheet file here
    if your feature or plugins could not support to run globally.
    <link href="components/" rel="stylesheet">
    -->
    <style type="text/css">
        /*
        Embed CSS styling for current page.
        */
    </style>

    <!--
    Reference Your external Javascript file here
    if your feature or plugins could not support to run globally.
    <script src="components/"></script>
    -->
    <script type="text/javascript">
        // You could write safely Javascript code here too as our template
        // should load mandatory libraries and plugins before.
        // <--- HERE --->
        //

        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            // <--- HERE --->
            //

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
                $(".bootstrap-pill-wizard").each(function () {
                    console.log("show first tab");
                    var firstTab = $(".nav .nav-link:first", $(this));
                    var targetPanelId = $(firstTab).attr("href");
                    $(firstTab).removeClass("disabled");
                    $(targetPanelId).addClass("active show");
                    console.log("id of target = " + $(targetPanelId).attr("id"));
                    $(firstTab).tab('show');
                });
                $(".previous-button").on("click", function () {
                    var wizardElement = $(this).parents(".bootstrap-pill-wizard").first();
                    var currentActiveElement = $(".nav .nav-link.active", wizardElement);
                    var previousElement = $(currentActiveElement).prev();
                    console.log("prev-button current[" + $(currentActiveElement).attr("id") + "], next [" + $(previousElement).attr("id") + "]");
                    if ($(previousElement).length > 0) {
                        $(previousElement).tab('show');
                    } else {
                        $(".nav .nav-link:last", wizardElement).tab('show');
                    }
                });
                $(".next-button").on("click", function () {
                    var wizardElement = $(this).parents(".bootstrap-pill-wizard").first();
                    var currentActiveElement = $(".nav .nav-link.active", wizardElement);
                    var nextActiveElement = $(currentActiveElement).next();
                    console.log("next-button current[" + $(currentActiveElement).attr("id") + "], next [" + $(nextActiveElement).attr("id") + "]");
                    if ($(nextActiveElement).length > 0) {
                        $(nextActiveElement).removeClass("disabled");
                        $(nextActiveElement).tab('show');
                    } else {
                        $(".nav .nav-link:first", wizardElement).tab('show');
                    }
                });
                $('[data-toggle="pill"]').on('show.bs.tab', function (e) {
                    console.log("show.bs.tab = " + $(e.target).attr("id")); // newly activated tab
                    console.log("show.bs.tab = " + $(e.relatedTarget).attr("id")); // previous active tab
//                    e.preventDefault();
                });
                $('[data-toggle="pill"]').on('shown.bs.tab', function (e) {
                    var wizardElement = $(this).parents(".bootstrap-pill-wizard").first();
                    console.log("shown.bs.tab = " + $(e.target).attr("id")); // newly activated tab
                    console.log("shown.bs.tab = " + $(e.relatedTarget).attr("id")); // previous active tab
                    var currentShownElement = $(e.target);
                    if ($(currentShownElement).prev().length > 0) {
                        $(".previous-button", wizardElement).prop("disabled", false);
                        $(".previous-button", wizardElement).removeClass("disabled");
                    } else {
                        $(".previous-button", wizardElement).prop("disabled", true);
                        $(".previous-button", wizardElement).addClass("disabled");
                    }
                    if ($(currentShownElement).next().length > 0) {
                        $(".next-button", wizardElement).prop("disabled", false);
                        $(".next-button", wizardElement).removeClass("disabled");
                    } else {
                        $(".next-button", wizardElement).prop("disabled", true);
                        $(".next-button", wizardElement).addClass("disabled");
                    }
                    var ajaxUrl = $(this).data("url");
                    var target = $(this).attr("href");
                    if (ajaxUrl) {
                        console.log("target[" + target + "], ajax Url [" + ajaxUrl + "]");
                        $.ajax({
                            url: ajaxUrl,
                            type: "GET",
                            data: {},
                            success: function (data) {
                                $(target).html(data);
                            }
                        });
                    }
                });
                $('[data-toggle="pill"]').on('hidden.bs.tab', function (e) {
                    console.log("hidden.bs.tab = " + $(e.target).attr("id")); // newly activated tab
                    console.log("hidden.bs.tab = " + $(e.relatedTarget).attr("id")); // previous active tab
//                    e.preventDefault();
                    var target = $(this).attr("href");
                    $(target).html();
                });
                $('[data-toggle="pill"]').on('hide.bs.tab', function (e) {
                    console.log("hide.bs.tab = " + $(e.target).attr("id")); // newly activated tab
                    console.log("hide.bs.tab = " + $(e.relatedTarget).attr("id")); // previous active tab
//                    e.preventDefault();
//                    return false;
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
             * When another sidebar menu item pressed and before container issues new ajax request.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * return false or event.preventDefault() will cancel ajax and stay you in the current page and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                return true;
            });
        });
    </script>
</div>