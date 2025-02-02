<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info mt-3">
                <p>Full-sized drag & drop event calendar (jQuery plugin)</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="https://fullcalendar.io/"><i class="fa fa-external-link-alt fa-fw"></i>Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/fullcalendar/fullcalendar"><i class="fa fa-external-link-alt fa-fw"></i>github.com Page</a>
                    <a class="btn btn-info" target="_blank" href="https://fullcalendar.io/docs/localization"><i class="fa fa-external-link-alt fa-fw"></i>FullCalendar Localization</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    jQuery FullCalendar Year
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
                        <div class="col-lg-4 col-md-3 col-sm-6 p-2 mt-1">
                            <div id='calendar1'></div>
                        </div>
                        <div class="col-lg-4 col-md-3 col-sm-6 p-2 mt-1">
                            <div id='calendar2'></div>
                        </div>
                        <div class="col-lg-4 col-md-3 col-sm-6 p-2 mt-1">
                            <div id='calendar3'></div>
                        </div>
                        <div class="col-lg-4 col-md-3 col-sm-6 p-2 mt-1">
                            <div id='calendar4'></div>
                        </div>
                        <div class="col-lg-4 col-md-3 col-sm-6 p-2 mt-1">
                            <div id='calendar5'></div>
                        </div>
                        <div class="col-lg-4 col-md-3 col-sm-6 p-2 mt-1">
                            <div id='calendar6'></div>
                        </div>
                        <div class="col-lg-4 col-md-3 col-sm-6 p-2 mt-1">
                            <div id='calendar7'></div>
                        </div>
                        <div class="col-lg-4 col-md-3 col-sm-6 p-2 mt-1">
                            <div id='calendar8'></div>
                        </div>
                        <div class="col-lg-4 col-md-3 col-sm-6 p-2 mt-1">
                            <div id='calendar9'></div>
                        </div>
                        <div class="col-lg-4 col-md-3 col-sm-6 p-2 mt-1">
                            <div id='calendar10'></div>
                        </div>
                        <div class="col-lg-4 col-md-3 col-sm-6 p-2 mt-1">
                            <div id='calendar11'></div>
                        </div>
                        <div class="col-lg-4 col-md-3 col-sm-6 p-2 mt-1">
                            <div id='calendar12'></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        .fc-toolbar h2 {
            font-size: 1.4rem;
        }
        .fc-toolbar.fc-header-toolbar {
            margin-bottom: 0.3rem;
        }
    </style>
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

            var date = new Date();
            var y = date.getFullYear();
            var targetHeader = {
                left: 'title',
                right: 'month,agendaDay'
            };
            if (javatmp.settings.isRTL) {
                targetHeader = $.extend(targetHeader, {
                    right: targetHeader.left,
                    left: targetHeader.right
                });
            }
            for (var i = 1; i <= 12; i++) {
                var id = '#calendar' + i;
                $(id).fullCalendar({
                    isRTL: javatmp.settings.isRTL,
                    header: targetHeader,
                    defaultDate: '2018-02-12',
                    navLinks: true, // can click day/week names to navigate views
                    editable: true,
                    eventLimit: true // allow "more" link when too many events
                });
                var date = new Date(y, i - 1, 1);
                $(id).fullCalendar('gotoDate', date);
                var d = date.getDate();
                var m = date.getMonth();
                var y = date.getFullYear();
                var currentMonth = date.getMonth();
                var currentYear = date.getFullYear();
            }




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