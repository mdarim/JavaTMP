<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col">
            <div class="card my-3">
                <div class="card-header">
                    Bootstrap ContextMenu Plugin
                    <div class="options float-right">
                        <a href="#" class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <table id="contextmenu-table-demo-1" class="table table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Username</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
                            </tr>
                        </tbody>
                    </table>
                    <div id="contextMenu" class="dropdown-menu" role="menu" style="display:none;position: fixed;" >
                        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Add-New-User-Action">
                            <i class="fa fa-fw fa-user text-primary"></i>
                            Add New User
                        </a>
                        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Add-New-User-Popup-Action">
                            <i class="fa fa-external-link-alt fa-fw text-primary"></i>
                            Add New User Popup
                        </a>
                        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Update-Complete-User-Action">
                            <i class="fa fa-user-edit fa-fw text-primary"></i>
                            Update Complete User
                        </a>
                        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Activate-User-Action">
                            <i class="fa fa-user-check fa-fw text-success"></i>
                            Activate User
                        </a>
                        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Deactivate-User-Action">
                            <i class="fa fa-user-slash fa-fw text-warning"></i>
                            Deactivate User
                        </a>
                        <div class="dropdown-divider"></div>
                        <a tabindex="-1" class="dropdown-item" href="javascript:;" actionType="action-ref" action-ref-by-name="Delete-User-Action">
                            <i class="fa fa-user-times fa-fw text-danger"></i>
                            Delete User
                        </a>
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

            // https://stackoverflow.com/questions/18666601/use-bootstrap-3-dropdown-menu-as-context-menu
            var $table = $("#contextmenu-table-demo-1");
            var $contextMenu = $("#contextMenu");
            function getMenuPosition($contextMenu, mouse, direction, scrollDir, isRTL) {
                var win = $(window)[direction]();
                var scroll = $(window)[scrollDir]();
                var menu = $($contextMenu)[direction]();
//                var position = mouse + scroll;
                var position = mouse + 0;
                if (direction === "width" && (position - $($contextMenu)[direction]() > 0) && isRTL) {
                    position = position - $($contextMenu)[direction]();
                } else {
                    // opening menu would pass the side of the page
                    if (mouse + menu > win && menu < mouse)
                        position -= menu;
                }
                return position;
            }

            $('tbody', $table).on('contextmenu', 'tr', function (e) {
                if (e.ctrlKey)
                    return;

                $contextMenu.css({
                    display: "block",
//                        left: e.pageX,
//                        top: e.pageY
                    left: getMenuPosition($contextMenu, e.clientX, 'width', 'scrollLeft', javatmp.settings.isRTL),
                    right: "auto",
                    top: getMenuPosition($contextMenu, e.clientY, 'height', 'scrollTop', javatmp.settings.isRTL)
                });

                return false;
            });
            $contextMenu.on("click", "a", function () {
                $contextMenu.hide();
            });
            $('body,html').on("click", function () {
                $contextMenu.hide();
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
             * When another sidebar menu item pressed and before container issues new ajax request.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * return false or event.preventDefault() will cancel ajax and stay you in the current page and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                // off contextmenu
                $(javatmp.settings.defaultOutputSelector).off("contextmenu");
                return true;
            });
        });
    </script>
</div>