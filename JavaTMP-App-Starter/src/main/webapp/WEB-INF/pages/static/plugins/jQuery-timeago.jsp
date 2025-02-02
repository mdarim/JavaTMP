<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info mt-3">
                <p>
                    Timeago is a jQuery plugin that makes it easy to support automatically updating fuzzy timestamps
                    (e.g. "4 minutes ago" or "about 1 day ago") from ISO 8601 formatted dates and times embedded
                    in your HTML or dynamically using javascript.
                </p>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://timeago.yarp.com/">Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/rmm5t/jquery-timeago">github.com Project Link</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    jQuery timeago plugin
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
                            <p>
                                You opened this page
                                <time class="timeago text-danger" id="populate-when-load"></time>.
                                <span class="help">(This will update every minute. Wait for it.)</span>
                            </p>
                            <p>
                                JavaTMp was born <time class="timeago text-danger" datetime="2017-10-01T00:00:00Z">Oct 01, 2017</time>.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        jQuery(function ($) {
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                $("#populate-when-load").html(new Date().toISOString());
                $("#populate-when-load").attr("datetime", new Date().toISOString());
                $("time.timeago").timeago();
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