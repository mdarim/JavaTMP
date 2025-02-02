<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="card my-3">
                <div class="card-header">
                    Bootstrap Multilevel Dropdown Hover
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
                        <div class="col-lg-12">
                            <div class="btn-group">
                                <a id="dLabel" role="button" data-toggle="dropdown" class="btn btn-primary dropdown-toggle"
                                   href="">Dropdown</a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                                    <li><a class="dropdown-item" href="#">level 1</a></li>
                                    <li><a class="dropdown-item" href="#">level 1</a></li>
                                    <li class="dropdown-divider"></li>
                                    <li class="dropdown-submenu">
                                        <a class="dropdown-item" tabindex="-1" href="#">
                                            level 1
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" tabindex="-1" href="#">level 2</a></li>
                                            <li class="dropdown-submenu">
                                                <a class="dropdown-item" href="#">
                                                    level 2
                                                </a>
                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item" href="#">3rd level</a></li>
                                                    <li><a class="dropdown-item" href="#">3rd level</a></li>
                                                </ul>
                                            </li>
                                            <li><a class="dropdown-item" href="#">level 2</a></li>
                                            <li><a class="dropdown-item" href="#">level 2</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--<link href="components/" rel="stylesheet">-->
        <style type="text/css">

            .dropdown-submenu {
                position: relative;
            }
            .dropdown-submenu > .dropdown-menu {
                top: 0;
                left: 100%;
                margin-top: 0px;
                margin-left: 0px;
            }
            .dropdown-submenu:hover > .dropdown-menu {
                display: block;
            }

            .dropdown-submenu:after {
                position: absolute;
                top: 50%;
                right: .5em;
                z-index: 1;
                width: 0;
                height: 0;
                content: '';
                border-color: transparent transparent transparent #2f2f2f;
                border-style: solid;
                border-width: .25em 0 .25em .25em;
                -webkit-transform: translateY(-50%);
                -ms-transform: translateY(-50%);
                -o-transform: translateY(-50%);
                transform: translateY(-50%);
            }
            .dropdown-submenu > .dropdown-item:focus {
                background: transparent;
                cursor: pointer;
            }
            /* rtl */
            [dir=rtl] .dropdown-submenu > .dropdown-menu {
                left: auto;
                right: 100%;
                margin-left: auto;
                margin-right: 0px;
            }
            [dir=rtl] .dropdown-submenu:after {
                right: auto;
                left: .5em;
                border-color: transparent #2f2f2f transparent transparent;
                border-width: .25em .25em .25em 0;
            }
        </style>
        <script type="text/javascript">
            jQuery(function ($) {
                // any code put here will be run after content attach to ajax output container and before
                // controll return to main javascript file.

                var timers = [];

                $(javatmp.settings.defaultOutputSelector).find(".dropdown-submenu > .dropdown-item").on('click', function (event) {
                    event.stopPropagation();
                    event.preventDefault();
                    return false;
                });
                $(javatmp.settings.defaultOutputSelector).find(".dropdown-toggle").on("mouseenter", function () {
                    // we could here clear all timers in array.
                    var timer;
                    $(this).parent(".btn-group, .dropdown").off("mouseleave");
                    // make sure it is not show:
                    if (!$(this).parent().hasClass("show")) {
                        $(this).click();
                    }
                    $(this).parent(".btn-group, .dropdown").on("mouseleave", function () {
                        for (var i = 0; i < timers.length; i++) {
                            clearTimeout(timers[i]);
                        }
                        var that = $(this);
                        timer = setTimeout(function () {
                            // make sure it is not show:
                            if (that.hasClass("show") && !that.is(":hover")) {
                                that.children('.dropdown-toggle').first().click();
                            }
                        }, 300);
                        timers.push(timer);
                    });
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
                    $(javatmp.settings.defaultOutputSelector).find(".btn-group, .dropdown").unbind('mouseenter mouseleave');
                    $(javatmp.settings.defaultOutputSelector).find(".dropdown-submenu > .dropdown-item").off('click');
                    return true;
                });
            });
        </script>
    </div>
</div>