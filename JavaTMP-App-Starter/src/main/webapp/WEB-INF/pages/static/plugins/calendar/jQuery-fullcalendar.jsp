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
                    jQuery FullCalendar
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
                        <div class="col-lg-2">
                            <div id='external-events'>
                                <h4>Draggable Events</h4>
                                <div class='fc-event'>My Event 1</div>
                                <div class='fc-event'>My Event 2</div>
                                <div class='fc-event'>My Event 3</div>
                                <div class='fc-event'>My Event 4</div>
                                <div class='fc-event'>My Event 5</div>
                                <div class="fc-event">
                                    <i class="fa fa-arrows"></i>
                                    My Event 6
                                </div>
                                <p>
                                    <input type='checkbox' id='drop-remove' />
                                    <label for='drop-remove'>remove after drop</label>
                                </p>
                            </div>
                        </div>
                        <div class="col-lg-10">
                            <div id='calendar'></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        #external-events {
            /*                float: left;
                            width: 150px;*/
            padding: 0 10px;
            border: 1px solid #ccc;
            background: #eee;
            text-align: left;
        }

        #external-events h4 {
            font-size: 16px;
            margin-top: 0;
            padding-top: 1em;
        }

        #external-events .fc-event {
            margin: 10px 0;
            cursor: pointer;
        }

        #external-events p {
            margin: 1.5em 0;
            font-size: 11px;
            color: #666;
        }

        #external-events p input {
            margin: 0;
            vertical-align: middle;
        }

        /*            #calendar {
                        float: right;
                        width: 900px;
                    }*/
    </style>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {
                /* initialize the external events
                 -----------------------------------------------------------------*/
                var fakeId = 0;
                $('#external-events .fc-event').each(function () {

                    // store data so the calendar knows to render an event upon drop
                    $(this).data('event', {
                        title: $.trim($(this).text()), // use the element's text as the event title
                        stick: true // maintain when user navigates (see docs on the renderEvent method)
                        , id: ++fakeId
                    });

                    // make the event draggable using jQuery UI
                    $(this).draggable({
                        zIndex: 999,
                        revert: true, // will cause the event to go back to its
                        revertDuration: 0  //  original position after the drag
                    });

                });


                /* initialize the calendar
                 -----------------------------------------------------------------*/
                var targetHeader = {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                };
                if (javatmp.settings.isRTL) {
                    targetHeader = $.extend(targetHeader, {
                        right: targetHeader.left,
                        left: targetHeader.right
                    });
                }
                $('#calendar').fullCalendar({
                    isRTL: javatmp.settings.isRTL,
                    header: targetHeader,
//                    theme: "bootstrap4",
                    editable: true,
                    droppable: true, // this allows things to be dropped onto the calendar
                    drop: function () {
                        // is the "remove after drop" checkbox checked?
                        if ($('#drop-remove').is(':checked')) {
                            // if so, remove the element from the "Draggable Events" list
                            $(this).remove();
                        }
                    },
                    eventClick: function (calEvent, jsEvent, view) {
                        BootstrapModalWrapperFactory.showMessage("Event Name : " + calEvent.title,
                                "You can fetch or show to user anything you want<br/><b>Event Id : </b>" + calEvent.id);
                    }
                });

            }(jQuery));
        });
    </script>
</div>