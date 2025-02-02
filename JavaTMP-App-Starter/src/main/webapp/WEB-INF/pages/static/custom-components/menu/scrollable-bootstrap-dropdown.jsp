<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col">
            <div class="card my-3">
                <div class="card-header">
                    Scrollable Bootstrap Dropdown
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <h4 class="card-title text-primary">Default Bootstrap Dropdown behavior:</h4>
                    <div class="dropdown m-1">
                        <a class="btn btn-primary dropdown-toggle" href="javascript:;" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Dropdown link
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                        </div>
                    </div>
                    <br/>
                    <h4 class="card-title text-primary">Scrollable Bootstrap Dropdown Using Default Browser Scrollbar:</h4>
                    <div class="dropdown m-1">
                        <a class="btn btn-primary dropdown-toggle" href="javascript:;" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Dropdown link
                        </a>
                        <div class="dropdown-menu default-scrollable-dropdown-menu">
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                        </div>
                    </div>
                    <br/>
                    <h4 class="card-title text-primary">Scrollable Bootstrap Dropdown Using jQuery malihu custom scrollbar plugin :</h4>
                    <div class="dropdown m-1">
                        <a class="btn btn-primary dropdown-toggle" href="javascript:;" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Dropdown link
                        </a>
                        <div class="dropdown-menu  dropdown-menu-extender">
                            <div class="dropdown-menu-content scroll-content">
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            </div>
                        </div>
                    </div>
                    <br/>
                    <h4 class="card-title text-primary">Scrollable Bootstrap Dropdown Using jQuery malihu custom scrollbar plugin With Header And Footer:</h4>
                    <div class="dropdown m-1">
                        <a class="btn btn-primary dropdown-toggle" href="javascript:;" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Dropdown link
                        </a>
                        <div class="dropdown-menu  dropdown-menu-extender">
                            <div class="dropdown-menu-header">
                                Kindly Select:
                            </div>
                            <div class="dropdown-menu-content scroll-content">
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            </div>
                            <div class="dropdown-menu-footer">
                                <a class="" href="#" alt="Header">
                                    <strong>Add New Item</strong>
                                </a>
                            </div>
                        </div>
                    </div>
                    <br/>
                    <h4 class="card-title text-primary">Scrollable Bootstrap Dropdown Using Default Browser Scrollbar with Header And Footer:</h4>
                    <div class="dropdown m-1">
                        <a class="btn btn-primary dropdown-toggle" href="javascript:;" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Dropdown link
                        </a>
                        <div class="dropdown-menu  dropdown-menu-extender">
                            <div class="dropdown-menu-header">
                                Kindly Select:
                            </div>
                            <div class="default-scrollable-dropdown-menu">
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action Name Here</a>
                            </div>
                            <div class="dropdown-menu-footer">
                                <a class="" href="#" alt="Header">
                                    <strong>Add New Item</strong>
                                </a>
                            </div>
                        </div>
                    </div>
                    <br/>
                    <h4 class="card-title text-primary">Scrollable Bootstrap Dropdown Using Default Browser Scrollbar With update dropdown-toggle after select:</h4>
                    <div class="dropdown m-1">
                        <a class="btn btn-primary dropdown-toggle" href="javascript:;" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Dropdown link
                        </a>
                        <div class="dropdown-menu  dropdown-menu-extender update-item-after-select">
                            <div class="dropdown-menu-header">
                                Kindly Select:
                            </div>
                            <div class="default-scrollable-dropdown-menu">
                                <a class="dropdown-item" href="javascript:;">Action 1 Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action 2 Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action 3 Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action 4 Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action 5 Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action 6 Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action 7 Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action 8 Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action 9 Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action 10 Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action 11 Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action 12 Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action 13 Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action 14 Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action 15 Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action 16 Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action 17 Name Here</a>
                                <a class="dropdown-item" href="javascript:;">Action 18 Name Here</a>
                            </div>
                        </div>
                    </div>
                    <br/>
                    <h4 class="card-title text-primary">Scrollable Bootstrap Dropdown Using Default Browser Scrollbar With update text field after select:</h4>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control demo-textfield-focusin-event" aria-label="Text input with dropdown button">
                        <div class="input-group-append">
                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-extender update-textfield-after-select">
                                <div class="dropdown-menu-header">
                                    Kindly Select:
                                </div>
                                <div class="default-scrollable-dropdown-menu">
                                    <a class="dropdown-item" href="javascript:;">Action 1 Name Here</a>
                                    <a class="dropdown-item" href="javascript:;">Action 2 Name Here</a>
                                    <a class="dropdown-item" href="javascript:;">Action 3 Name Here</a>
                                    <a class="dropdown-item" href="javascript:;">Action 4 Name Here</a>
                                    <a class="dropdown-item" href="javascript:;">Action 5 Name Here</a>
                                    <a class="dropdown-item" href="javascript:;">Action 6 Name Here</a>
                                    <a class="dropdown-item" href="javascript:;">Action 7 Name Here</a>
                                    <a class="dropdown-item" href="javascript:;">Action 8 Name Here</a>
                                    <a class="dropdown-item" href="javascript:;">Action 9 Name Here</a>
                                    <a class="dropdown-item" href="javascript:;">Action 10 Name Here</a>
                                    <a class="dropdown-item" href="javascript:;">Action 11 Name Here</a>
                                    <a class="dropdown-item" href="javascript:;">Action 12 Name Here</a>
                                    <a class="dropdown-item" href="javascript:;">Action 13 Name Here</a>
                                    <a class="dropdown-item" href="javascript:;">Action 14 Name Here</a>
                                    <a class="dropdown-item" href="javascript:;">Action 15 Name Here</a>
                                    <a class="dropdown-item" href="javascript:;">Action 16 Name Here</a>
                                    <a class="dropdown-item" href="javascript:;">Action 17 Name Here</a>
                                    <a class="dropdown-item" href="javascript:;">Action 18 Name Here</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        .default-scrollable-dropdown-menu {
            height: auto;
            max-height: 200px;
            overflow-x: hidden;
        }
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.


            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.

                $(javatmp.settings.defaultOutputSelector).find('.scroll-content').mCustomScrollbar(javatmp.settings.mCustomScrollbarOptions);

                $(".dropdown-menu.update-item-after-select a.dropdown-item").click(function () {
                    $(".dropdown-menu.update-item-after-select a.dropdown-item").removeClass('active');
                    $(this).addClass('active');
                    var selText = $(this).text();
                    $(this).parents('.dropdown').find('.dropdown-toggle').html(selText);
                });
                $(".demo-textfield-focusin-event").on("click", function (event) {
                    event.stopPropagation();
                    if (!$(this).parent(".input-group").find(".input-group-btn").hasClass("show")) {
                        $(this).parent(".input-group").find(".dropdown-toggle").dropdown("toggle"); // or .click();
                        $(this).focus();
                    }
                });
                $(".dropdown-menu.update-textfield-after-select a.dropdown-item").click(function () {
                    $(".dropdown-menu.update-textfield-after-select a.dropdown-item").removeClass('active');
                    $(this).addClass('active');
                    var selText = $(this).text();
                    $(this).parents('.input-group').find('input').val(selText);
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
                $(javatmp.settings.defaultOutputSelector).find('.dropdown, .btn-group').off("click", ".dropdown-menu");
                return true;
            });
        });
    </script>
</div>