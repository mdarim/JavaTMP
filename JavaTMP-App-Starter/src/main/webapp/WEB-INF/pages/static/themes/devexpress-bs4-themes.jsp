<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">Free Bootstrap 4 Themes by DevExpress</h4>
    <hr/>
    <div class="form-row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>This repository contains free and open source Bootstrap 4 themes.
                    Each folder under the /dist/ folder contains a theme, and includes css files you may distribute
                    (bootstrap.css and bootstrap.min.css) and the theme source scss files.</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="https://devexpress.github.io/bootstrap-themes/index.html">Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/DevExpress/bootstrap-themes">github.com Project Link</a>
                </p>
            </div>
        </div>
    </div>
    <div class="form-row">
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="office-white"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/office-white.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="purple"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/purple.png" alt=""/>
            </a>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-2 col-xl-2 text-center">
            <a class="applyTheme" themeName="blazing-berry"  href="javascript:void(0);">
                <img class="img-thumbnail" src="${pageContext.request.contextPath}/assets/img/themes/blazing-berry.png" alt=""/>
            </a>
        </div>
    </div>
    <style type="text/css">
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
                $(".applyTheme").on("click", function () {
                    var themeName = $(this).attr("themeName");
                    var styleId = "#themeStyleSheet";
                    var newUrl = javatmp.settings.contextPath + "/assets/dist/css/javatmp-" + themeName;
                    if (javatmp.settings.isRTL === true) {
                        newUrl += "-rtl";
                    }
                    newUrl += ".min.css";
                    $(styleId).attr("href", newUrl);
                });
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
            });

            /**
             * When another sidebar menu item pressed and before container replaced with new ajax content.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * returning false will cancel the new request and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                return true;
            });
        });
    </script>
</div>