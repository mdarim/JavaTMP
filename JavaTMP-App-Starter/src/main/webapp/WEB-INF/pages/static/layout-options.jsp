<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col">
            <div class="card my-2">
                <div class="card-header">
                    Template Layout Options
                    <div class="options float-right">
                        <a href="#" class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <h4 class="mt-3 card-title text-primary">Support Standard Main Theme Colors for body</h4>
                    <p class="card-text">
                        Add one of <code>.bg-primary,.bg-secondary,.bg-success,.bg-info,
                            .bg-warning,.bg-danger,.bg-light,.bg-dark</code> class to body
                        to apply standard theme colors. examples:
                    </p>
                    <button id="body-add-theme-without-button" class="btn btn-primary m-1" type="button">Remove .bg-*</button>
                    <button id="body-add-theme-primary-button" class="btn btn-primary m-1" type="button">Add .bg-primary</button>
                    <button id="body-add-theme-secondary-button" class="btn btn-secondary m-1" type="button">Add .bg-secondary</button>
                    <button id="body-add-theme-success-button" class="btn btn-success m-1" type="button">Add .bg-success</button>
                    <button id="body-add-theme-info-button" class="btn btn-info m-1" type="button">Add .bg-info</button>
                    <button id="body-add-theme-warning-button" class="btn btn-warning m-1" type="button">Add .bg-warning</button>
                    <button id="body-add-theme-danger-button" class="btn btn-danger m-1" type="button">Add .bg-danger</button>
                    <button id="body-add-theme-light-button" class="btn btn-light m-1" type="button">Add .bg-light</button>
                    <button id="body-add-theme-dark-button" class="btn btn-dark m-1" type="button">Add .bg-dark</button>
                    <h4 class="mt-3 card-title text-primary">Support Standard Main Theme Colors for Navbar</h4>
                    <p class="card-text">
                        Add one of <code>.bg-primary,.bg-secondary,.bg-success,.bg-info,.bg-warning,.bg-danger,.bg-light,.bg-dark</code> class to navbar.main-javatmp-navbar to apply standard theme colors. examples:
                    </p>
                    <button id="navbar-add-theme-without-button" class="btn btn-primary m-1" type="button">Remove .bg-*</button>
                    <button id="navbar-add-theme-primary-button" class="btn btn-primary m-1" type="button">Add .bg-primary</button>
                    <button id="navbar-add-theme-secondary-button" class="btn btn-secondary m-1" type="button">Add .bg-secondary</button>
                    <button id="navbar-add-theme-success-button" class="btn btn-success m-1" type="button">Add .bg-success</button>
                    <button id="navbar-add-theme-info-button" class="btn btn-info m-1" type="button">Add .bg-info</button>
                    <button id="navbar-add-theme-warning-button" class="btn btn-warning m-1" type="button">Add .bg-warning</button>
                    <button id="navbar-add-theme-danger-button" class="btn btn-danger m-1" type="button">Add .bg-danger</button>
                    <button id="navbar-add-theme-light-button" class="btn btn-light m-1" type="button">Add .bg-light</button>
                    <button id="navbar-add-theme-dark-button" class="btn btn-dark m-1" type="button">Add .bg-dark</button>
                    <h4 class="mt-3 card-title text-primary">Navbar</h4>
                    <p class="card-text">
                        Add <code>.navbar-expand-lg/md</code> class to navbar to hide toggler-button on large and desktop devices
                        or remove it to show the button on all devices and screen sizes. examples:
                    </p>
                    <button id="navbar-add-expand-lg-button" class="btn btn-primary m-1" type="button">Add .navbar-expand-lg</button>
                    <button id="navbar-remove-expand-lg-button" class="btn btn-primary m-1" type="button">Remove .navbar-expand-lg</button>
                    <p class="card-text">
                        Add <code>.bs-dd-caret-off</code> class to dropdown-toggle element to remove the caret shape from it. examples:
                    </p>
                    <button id="navbar-add-caretoff-button" class="btn btn-primary m-1" type="button">Add .bs-dd-caret-off</button>
                    <button id="navbar-remove-caretoff-button" class="btn btn-primary m-1" type="button">Remove .bs-dd-caret-off</button>
                    <button id="navbar-remove-next-border-button" class="btn btn-primary m-1" type="button">Remove Next Border</button>
                    <h4 class="mt-3 card-title text-primary">Support Standard Main Theme Colors for Sidebar</h4>
                    <p class="card-text">
                        Add one of <code>.bg-primary,.bg-secondary,.bg-success,.bg-info,.bg-warning,.bg-danger,.bg-light,.bg-dark</code> class
                        to .sidebar to apply standard theme colors. examples:
                    </p>
                    <button id="sidebar-add-theme-without-button" class="btn btn-primary m-1" type="button">Remove .bg-*</button>
                    <button id="sidebar-add-theme-primary-button" class="btn btn-primary m-1" type="button">Add .bg-primary</button>
                    <button id="sidebar-add-theme-secondary-button" class="btn btn-secondary m-1" type="button">Add .bg-secondary</button>
                    <button id="sidebar-add-theme-success-button" class="btn btn-success m-1" type="button">Add .bg-success</button>
                    <button id="sidebar-add-theme-info-button" class="btn btn-info m-1" type="button">Add .bg-info</button>
                    <button id="sidebar-add-theme-warning-button" class="btn btn-warning m-1" type="button">Add .bg-warning</button>
                    <button id="sidebar-add-theme-danger-button" class="btn btn-danger m-1" type="button">Add .bg-danger</button>
                    <button id="sidebar-add-theme-light-button" class="btn btn-light m-1" type="button">Add .bg-light</button>
                    <button id="sidebar-add-theme-dark-button" class="btn btn-dark m-1" type="button">Add .bg-dark</button>
                    <h4 class="mt-3 card-title text-primary">Hide/Show Sidebar</h4>
                    <p class="card-text">
                        Use <code>javatmp.sidebar.show();</code> to show hidden sidebar
                        and <code>javatmp.sidebar.hide();</code> to hide shown sidebar. examples:
                    </p>
                    <button id="sidebar-hide-button" class="btn btn-primary m-1" type="button">Hide Sidebar</button>
                    <button id="sidebar-show-button" class="btn btn-primary m-1" type="button">Show Sidebar</button>
                    <button id="sidebar-toggle-button" class="btn btn-primary m-1" type="button">Toggle Sidebar Status</button>
                    <h4 class="mt-3 card-title text-primary">Auto Hide/Show Sidebar On Mouse Move</h4>
                    <p class="card-text">
                        Use <code>javatmp.sidebar.activateAutoShowHide();</code> to Activate Auto Show/hide sidebar on main canvas
                        and <code>javatmp.sidebar.deactivateAutoShowHide();</code> to Deactivate Auto Show/hide sidebar on main canvas. examples:
                    </p>
                    <button id="sidebar-activateAutoShowHide-button" class="btn btn-primary m-1" type="button">activate AutoShowHide</button>
                    <button id="sidebar-deactivateAutoShowHide-button" class="btn btn-primary m-1" type="button">deactivate AutoShowHide</button>
                    <h4 class="mt-3 card-title text-primary">long-sidebar over wide navbar</h4>
                    <p class="card-text">
                        Use <code>body.longer-sidebar</code> to make sidebar longer on all height
                        or remove class <code>.longer-sidebar</code> from body tag to keep navbar wider on all width of the screen. examples:
                    </p>
                    <button id="sidebar-longer-button" class="btn btn-primary m-1" type="button">Add .longer-sidebar to body tag</button>
                    <button id="sidebar-removelonger-button" class="btn btn-primary m-1" type="button">Remove .longer-sidebar to body tag</button>
                    <h4 class="mt-3 card-title text-primary">Support Standard Main Theme Colors for breadcrumb element</h4>
                    <p class="card-text">
                        Add one of <code>.bg-primary,.bg-secondary,.bg-success,.bg-info,.bg-warning,.bg-danger,.bg-light,.bg-dark</code> class
                        to .main-breadcrumb-bar to apply standard theme colors. examples:
                    </p>
                    <button id="breadcrumb-add-theme-without-button" class="btn btn-primary m-1" type="button">Remove .bg-*</button>
                    <button id="breadcrumb-add-theme-primary-button" class="btn btn-primary m-1" type="button">Add .bg-primary</button>
                    <button id="breadcrumb-add-theme-secondary-button" class="btn btn-secondary m-1" type="button">Add .bg-secondary</button>
                    <button id="breadcrumb-add-theme-success-button" class="btn btn-success m-1" type="button">Add .bg-success</button>
                    <button id="breadcrumb-add-theme-info-button" class="btn btn-info m-1" type="button">Add .bg-info</button>
                    <button id="breadcrumb-add-theme-warning-button" class="btn btn-warning m-1" type="button">Add .bg-warning</button>
                    <button id="breadcrumb-add-theme-danger-button" class="btn btn-danger m-1" type="button">Add .bg-danger</button>
                    <button id="breadcrumb-add-theme-light-button" class="btn btn-light m-1" type="button">Add .bg-light</button>
                    <button id="breadcrumb-add-theme-dark-button" class="btn btn-dark m-1" type="button">Add .bg-dark</button>
                    <h4 class="mt-3 card-title text-primary">Support Standard Main Theme Colors for .main-footer-bar element</h4>
                    <p class="card-text">
                        Add one of <code>.bg-primary,.bg-secondary,.bg-success,.bg-info,.bg-warning,.bg-danger,.bg-light,.bg-dark</code> class
                        to .main-footer-bar to apply standard theme colors. examples:
                    </p>
                    <button id="footer-add-theme-without-button" class="btn btn-primary m-1" type="button">Remove .bg-*</button>
                    <button id="footer-add-theme-primary-button" class="btn btn-primary m-1" type="button">Add .bg-primary</button>
                    <button id="footer-add-theme-secondary-button" class="btn btn-secondary m-1" type="button">Add .bg-secondary</button>
                    <button id="footer-add-theme-success-button" class="btn btn-success m-1" type="button">Add .bg-success</button>
                    <button id="footer-add-theme-info-button" class="btn btn-info m-1" type="button">Add .bg-info</button>
                    <button id="footer-add-theme-warning-button" class="btn btn-warning m-1" type="button">Add .bg-warning</button>
                    <button id="footer-add-theme-danger-button" class="btn btn-danger m-1" type="button">Add .bg-danger</button>
                    <button id="footer-add-theme-light-button" class="btn btn-light m-1" type="button">Add .bg-light</button>
                    <button id="footer-add-theme-dark-button" class="btn btn-dark m-1" type="button">Add .bg-dark</button>
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

                $("#body-add-theme-without-button").on("click", function () {
                    $("body").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark");
                });

                $("#body-add-theme-primary-button").on("click", function () {
                    $("body").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-primary");
                });
                $("#body-add-theme-secondary-button").on("click", function () {
                    $("body").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-secondary");
                });
                $("#body-add-theme-success-button").on("click", function () {
                    $("body").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-success");
                });
                $("#body-add-theme-info-button").on("click", function () {
                    $("body").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-info");
                });
                $("#body-add-theme-warning-button").on("click", function () {
                    $("body").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-warning");
                });
                $("#body-add-theme-danger-button").on("click", function () {
                    $("body").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-danger");
                });
                $("#body-add-theme-light-button").on("click", function () {
                    $("body").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-light");
                });
                $("#body-add-theme-dark-button").on("click", function () {
                    $("body").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-dark");
                });

                //-----------------------------------

                $("#navbar-add-theme-without-button").on("click", function () {
                    $("nav.main-javatmp-navbar.navbar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark");
                });

                $("#navbar-add-theme-primary-button").on("click", function () {
                    $("nav.main-javatmp-navbar.navbar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-primary");
                });
                $("#navbar-add-theme-secondary-button").on("click", function () {
                    $("nav.main-javatmp-navbar.navbar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-secondary");
                });
                $("#navbar-add-theme-success-button").on("click", function () {
                    $("nav.main-javatmp-navbar.navbar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-success");
                });
                $("#navbar-add-theme-info-button").on("click", function () {
                    $("nav.main-javatmp-navbar.navbar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-info");
                });
                $("#navbar-add-theme-warning-button").on("click", function () {
                    $("nav.main-javatmp-navbar.navbar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-warning");
                });
                $("#navbar-add-theme-danger-button").on("click", function () {
                    $("nav.main-javatmp-navbar.navbar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-danger");
                });
                $("#navbar-add-theme-light-button").on("click", function () {
                    $("nav.main-javatmp-navbar.navbar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-light");
                });
                $("#navbar-add-theme-dark-button").on("click", function () {
                    $("nav.main-javatmp-navbar.navbar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-dark");
                });

                //-----------------
                $("#navbar-add-expand-lg-button").on("click", function () {
                    $("nav.main-javatmp-navbar.navbar").addClass("navbar-expand-lg");
                });
                $("#navbar-remove-expand-lg-button").on("click", function () {
                    $("nav.main-javatmp-navbar.navbar").removeClass("navbar-expand-lg");
                });

                $("#navbar-add-caretoff-button").on("click", function () {
                    $(".dropdown-toggle", "nav.main-javatmp-navbar.navbar").addClass("bs-dd-caret-off");
                });
                $("#navbar-remove-caretoff-button").on("click", function () {
                    $(".dropdown-toggle", "nav.main-javatmp-navbar.navbar").removeClass("bs-dd-caret-off");
                });
                $("#navbar-remove-next-border-button").on("click", function () {
                    if (javatmp.settings.isRTL) {
                        $(".nav-item", "nav.main-javatmp-navbar.navbar").css({"border-right": "none"});
                    } else {
                        $(".nav-item", "nav.main-javatmp-navbar.navbar").css({"border-left": "none"});
                    }
                });

//----------------------------------

                $("#sidebar-add-theme-without-button").on("click", function () {
                    $("div.sidebar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark");
                });

                $("#sidebar-add-theme-primary-button").on("click", function () {
                    $("div.sidebar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-primary");
                });
                $("#sidebar-add-theme-secondary-button").on("click", function () {
                    $("div.sidebar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-secondary");
                });
                $("#sidebar-add-theme-success-button").on("click", function () {
                    $("div.sidebar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-success");
                });
                $("#sidebar-add-theme-info-button").on("click", function () {
                    $("div.sidebar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-info");
                });
                $("#sidebar-add-theme-warning-button").on("click", function () {
                    $("div.sidebar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-warning");
                });
                $("#sidebar-add-theme-danger-button").on("click", function () {
                    $("div.sidebar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-danger");
                });
                $("#sidebar-add-theme-light-button").on("click", function () {
                    $("div.sidebar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-light");
                });
                $("#sidebar-add-theme-dark-button").on("click", function () {
                    $("div.sidebar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-dark");
                });

                $("#sidebar-show-button").on("click", function () {
                    javatmp.sidebar.show();
                });
                $("#sidebar-hide-button").on("click", function () {
                    javatmp.sidebar.hide();
                });
                $("#sidebar-toggle-button").on("click", function () {
                    javatmp.sidebar.toggleStatus();
                });
                $("#sidebar-activateAutoShowHide-button").on("click", function () {
                    javatmp.sidebar.activateAutoShowHide();
                });
                $("#sidebar-deactivateAutoShowHide-button").on("click", function () {
                    javatmp.sidebar.deactivateAutoShowHide();
                });
                $("#sidebar-longer-button").on("click", function () {
                    $("body").addClass("longer-sidebar");
                });
                $("#sidebar-removelonger-button").on("click", function () {
                    $("body").removeClass("longer-sidebar");
                });

//----------------------------------

                $("#breadcrumb-add-theme-without-button").on("click", function () {
                    $("div.main-breadcrumb-bar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark");
                });
                $("#breadcrumb-add-theme-primary-button").on("click", function () {
                    $("div.main-breadcrumb-bar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-primary");
                });
                $("#breadcrumb-add-theme-secondary-button").on("click", function () {
                    $("div.main-breadcrumb-bar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-secondary");
                });
                $("#breadcrumb-add-theme-success-button").on("click", function () {
                    $("div.main-breadcrumb-bar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-success");
                });
                $("#breadcrumb-add-theme-info-button").on("click", function () {
                    $("div.main-breadcrumb-bar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-info");
                });
                $("#breadcrumb-add-theme-warning-button").on("click", function () {
                    $("div.main-breadcrumb-bar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-warning");
                });
                $("#breadcrumb-add-theme-danger-button").on("click", function () {
                    $("div.main-breadcrumb-bar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-danger");
                });
                $("#breadcrumb-add-theme-light-button").on("click", function () {
                    $("div.main-breadcrumb-bar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-light");
                });
                $("#breadcrumb-add-theme-dark-button").on("click", function () {
                    $("div.main-breadcrumb-bar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-dark");
                });

                //----------------------------------

                $("#footer-add-theme-without-button").on("click", function () {
                    $("div.main-footer-bar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark");
                });
                $("#footer-add-theme-primary-button").on("click", function () {
                    $("div.main-footer-bar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-primary");
                });
                $("#footer-add-theme-secondary-button").on("click", function () {
                    $("div.main-footer-bar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-secondary");
                });
                $("#footer-add-theme-success-button").on("click", function () {
                    $("div.main-footer-bar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-success");
                });
                $("#footer-add-theme-info-button").on("click", function () {
                    $("div.main-footer-bar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-info");
                });
                $("#footer-add-theme-warning-button").on("click", function () {
                    $("div.main-footer-bar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-warning");
                });
                $("#footer-add-theme-danger-button").on("click", function () {
                    $("div.main-footer-bar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-danger");
                });
                $("#footer-add-theme-light-button").on("click", function () {
                    $("div.main-footer-bar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-light");
                });
                $("#footer-add-theme-dark-button").on("click", function () {
                    $("div.main-footer-bar").removeClass("bg-primary bg-secondary bg-success bg-info bg-warning bg-danger bg-light bg-dark").addClass("bg-dark");
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