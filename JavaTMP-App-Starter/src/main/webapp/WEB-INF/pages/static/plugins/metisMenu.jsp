<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">Metis Menu plugin</h4>
    <hr/>
    <div class="row">
        <div class="col">
            <div class="alert alert-info">
                <p>A jQuery menu plugin</p>
                <p>
                    <a target="_blank" class="btn btn-info" href="http://mustache.github.io/mustache.5.html">Demo Site</a>
                    <a target="_blank" class="btn btn-info" href="http://www.javatmp.com">github source code</a>
                </p>
            </div>
        </div>
    </div>
    <div class="form-row">
        <div class="col-4">
            <div class="card">
                <div class="card-header">
                    Vertical Menu Examples
                    <div class="options float-right">
                        <a href="#" class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <nav class="sidebar-nav">
                        <ul class="metismenu" id="menu1">
                            <li>
                                <a class="has-arrow" href="#">
                                    <span class="fab fa-fw fa-github fa-lg"></span>
                                    metisMenu
                                </a>
                                <ul>
                                    <li>
                                        <a href="http://www.javatmp.com">
                                            <span class="fas fa-fw fa-code-branch"></span> link 1
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://www.javatmp.com">
                                            <span class="fa fa-fw fa-star"></span> link 2
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://www.javatmp.com">
                                            <span class="fa fa-fw fa-exclamation-triangle"></span> link 3
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a class="has-arrow" href="#" aria-expanded="false">Menu 0</a>
                                <ul>
                                    <li><a href="#">item 0.1</a></li>
                                    <li><a href="#">item 0.2</a></li>
                                    <li><a href="http://www.javatmp.com">www.javatmp.com</a></li>
                                    <li><a href="#">item 0.4</a></li>
                                </ul>
                            </li>
                            <li id="removable">
                                <a class="has-arrow" href="#" aria-expanded="false">Menu 1</a>
                                <ul>
                                    <li><a href="#">item 1.1</a></li>
                                    <li><a href="#">item 1.2</a></li>
                                    <li class="mm-active">
                                        <a class="has-arrow" href="#" aria-expanded="true">Menu 1.3</a>
                                        <ul>
                                            <li><a href="#">item 1.3.1</a></li>
                                            <li><a href="#">item 1.3.2</a></li>
                                            <li><a href="#">item 1.3.3</a></li>
                                            <li><a href="#">item 1.3.4</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">item 1.4</a></li>
                                    <li>
                                        <a class="has-arrow" href="#" aria-expanded="false">Menu 1.5</a>
                                        <ul>
                                            <li><a href="#">item 1.5.1</a></li>
                                            <li><a href="#">item 1.5.2</a></li>
                                            <li><a href="#">item 1.5.3</a></li>
                                            <li><a href="#">item 1.5.4</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a class="has-arrow" href="#" aria-expanded="false">Menu 2</a>
                                <ul>
                                    <li><a href="#">item 2.1</a></li>
                                    <li><a href="#">item 2.2</a></li>
                                    <li><a href="#">item 2.3</a></li>
                                    <li><a href="#">item 2.4</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <div class="col-4">
            <div class="card">
                <div class="card-header">
                    Vertical Menu Examples
                    <div class="options float-right">
                        <a href="#" class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="row">
                        <div class="col">
                            <nav class="sidebar-nav">
                                <ul class="metismenu" id="menu2">
                                    <li>
                                        <a class="has-arrow" href="#">
                                            <span class="fab fa-fw fa-github fa-lg"></span>
                                            metisMenu
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="http://www.javatmp.com">
                                                    <span class="fas fa-fw fa-code-branch"></span> link 1
                                                </a>
                                            </li>
                                            <li>
                                                <a href="http://www.javatmp.com">
                                                    <span class="fa fa-fw fa-star"></span> link 2
                                                </a>
                                            </li>
                                            <li>
                                                <a href="http://www.javatmp.com">
                                                    <span class="fa fa-fw fa-exclamation-triangle"></span> link 3
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#" aria-expanded="false">Menu 0</a>
                                        <ul>
                                            <li><a href="#">item 0.1</a></li>
                                            <li><a href="#">item 0.2</a></li>
                                            <li><a href="http://www.javatmp.com">www.javatmp.com</a></li>
                                            <li><a href="#">item 0.4</a></li>
                                        </ul>
                                    </li>
                                    <li id="removable">
                                        <a class="has-arrow" href="#" aria-expanded="false">Menu 1</a>
                                        <ul>
                                            <li><a href="#">item 1.1</a></li>
                                            <li><a href="#">item 1.2</a></li>
                                            <li class="mm-active">
                                                <a class="has-arrow" href="#" aria-expanded="true">Menu 1.3</a>
                                                <ul>
                                                    <li><a href="#">item 1.3.1</a></li>
                                                    <li><a href="#">item 1.3.2</a></li>
                                                    <li><a href="#">item 1.3.3</a></li>
                                                    <li><a href="#">item 1.3.4</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">item 1.4</a></li>
                                            <li>
                                                <a class="has-arrow" href="#" aria-expanded="false">Menu 1.5</a>
                                                <ul>
                                                    <li><a href="#">item 1.5.1</a></li>
                                                    <li><a href="#">item 1.5.2</a></li>
                                                    <li><a href="#">item 1.5.3</a></li>
                                                    <li><a href="#">item 1.5.4</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#" aria-expanded="false">Menu 2</a>
                                        <ul>
                                            <li><a href="#">item 2.1</a></li>
                                            <li><a href="#">item 2.2</a></li>
                                            <li><a href="#">item 2.3</a></li>
                                            <li><a href="#">item 2.4</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-4">
            <div class="card">
                <div class="card-header">
                    Vertical Menu Examples
                    <div class="options float-right">
                        <a href="#" class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="row text-right" dir="rtl">
                        <div class="col">
                            <nav class="sidebar-nav">
                                <ul class="metismenu" id="menu3">
                                    <li>
                                        <a class="has-arrow" href="#">
                                            <span class="fab fa-fw fa-github fa-lg"></span>
                                            metisMenu
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="http://www.javatmp.com">
                                                    <span class="fas fa-fw fa-code-branch"></span> link 1
                                                </a>
                                            </li>
                                            <li>
                                                <a href="http://www.javatmp.com">
                                                    <span class="fa fa-fw fa-star"></span> link 2
                                                </a>
                                            </li>
                                            <li>
                                                <a href="http://www.javatmp.com">
                                                    <span class="fa fa-fw fa-exclamation-triangle"></span> link 3
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#" aria-expanded="false">Menu 0</a>
                                        <ul>
                                            <li><a href="#">item 0.1</a></li>
                                            <li><a href="#">item 0.2</a></li>
                                            <li><a href="http://www.javatmp.com">onokumus</a></li>
                                            <li><a href="#">item 0.4</a></li>
                                        </ul>
                                    </li>
                                    <li id="removable">
                                        <a class="has-arrow" href="#" aria-expanded="false">Menu 1</a>
                                        <ul>
                                            <li><a href="#">item 1.1</a></li>
                                            <li><a href="#">item 1.2</a></li>
                                            <li class="mm-active">
                                                <a class="has-arrow" href="#" aria-expanded="true">Menu 1.3</a>
                                                <ul>
                                                    <li><a href="#">item 1.3.1</a></li>
                                                    <li><a href="#">item 1.3.2</a></li>
                                                    <li><a href="#">item 1.3.3</a></li>
                                                    <li><a href="#">item 1.3.4</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">item 1.4</a></li>
                                            <li>
                                                <a class="has-arrow" href="#" aria-expanded="false">Menu 1.5</a>
                                                <ul>
                                                    <li><a href="#">item 1.5.1</a></li>
                                                    <li><a href="#">item 1.5.2</a></li>
                                                    <li><a href="#">item 1.5.3</a></li>
                                                    <li><a href="#">item 1.5.4</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#" aria-expanded="false">Menu 2</a>
                                        <ul>
                                            <li><a href="#">item 2.1</a></li>
                                            <li><a href="#">item 2.2</a></li>
                                            <li><a href="#">item 2.3</a></li>
                                            <li><a href="#">item 2.4</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </nav>
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

                $('#menu1').metisMenu();

                $('#menu2').metisMenu({toggle: false});

                $('#menu3').metisMenu();

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