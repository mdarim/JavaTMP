<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-12">
            <div class="card my-3">
                <div class="card-header">
                    Up Tabbed Slider Carousel
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <nav class="nav nav-pills nav-justified mb-1">
                            <a data-target="#myCarousel" data-slide-to="0" class="nav-item nav-link active" href="#">About<small>Lorem ipsum dolor sit</small></a>
                            <a data-target="#myCarousel" data-slide-to="1" class="nav-item nav-link" href="#">Projects<small>Lorem ipsum dolor sit</small></a>
                            <a data-target="#myCarousel" data-slide-to="2" class="nav-item nav-link" href="#">Portfolio<small>Lorem ipsum dolor sit</small></a>
                            <a data-target="#myCarousel" data-slide-to="3" class="nav-item nav-link" href="#">Services<small>Lorem ipsum dolor sit</small></a>
                        </nav>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="assets/img/1200x400.png" class="img-fluid" style="width: 100%;">
                                <div class="carousel-caption">
                                    <h3>Headline</h3>
                                    <p>Lorem ipsum dolor sit amet</p>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="assets/img/1200x400.png" class="img-fluid" style="width: 100%;">
                                <div class="carousel-caption">
                                    <h3>Headline</h3>
                                    <p>Lorem ipsum dolor sit amet</p>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="assets/img/1200x400.png" class="img-fluid" style="width: 100%;">
                                <div class="carousel-caption">
                                    <h3>Headline</h3>
                                    <p>Lorem ipsum dolor sit amet</p>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="assets/img/1200x400.png" class="img-fluid" style="width: 100%;">
                                <div class="carousel-caption">
                                    <h3>Headline</h3>
                                    <p>Lorem ipsum dolor sit amet</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--<link href="components/" rel="stylesheet">-->
    <style type="text/css">
        #myCarousel .nav a small {
            display:block;
        }
    </style>
    <!--<script src="components/"></script>-->
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            $('#myCarousel').carousel({
                interval: 2000,
                wrap: true
            });

            var clickEvent = false;
            $('#myCarousel').on('click', '.nav a', function () {
                clickEvent = true;
                $('#myCarousel .nav a').removeClass('active');
                $(this).addClass('active');
            }).on('slid.bs.carousel', function (e) {
                if (!clickEvent) {
                    var count = $('#myCarousel .nav').children().length - 1;
                    var current = $('#myCarousel .nav a.active');
//                    alert("current [" + $(current).attr("data-target"));
                    var id = parseInt(current.data('slide-to'));
                    console.log("current.data('slide-to') " + current.data('slide-to'));
                    current.removeClass('active');
                    console.log("count [" + count + "], id [" + id + "]");
                    if (count === id) {
                        $('[data-slide-to="' + 0 + '"]').addClass('active');
                    } else {
                        current.next().addClass("active");

                    }
                }
                clickEvent = false;
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
                return true;
            });
        });
    </script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {

            }(jQuery));
        });
    </script>
</div>