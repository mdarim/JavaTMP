<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">Font Awesome Animation Icons Set</h4>
    <hr/>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>Simple animations using FontAwesome and some CSS3</p>
                <br/>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://l-lin.github.io/font-awesome-animation/">
                        <i class="fa fa-external-link-alt fa-fw"></i>
                        Demo Page
                    </a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/l-lin/font-awesome-animation">
                        <i class="fa fa-external-link-alt fa-fw"></i>github.com Page
                    </a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    All available icons (font-awesome)
                    <div class="float-right w-25">
                        <input id="ex6" type="text"
                               data-slider-min="14"
                               data-slider-max="128"
                               data-slider-step="1"
                               data-slider-value="14"/>
                    </div>
                </div>
                <div class="card-body" id="font-awsome-animation-icons-panel-body-id">
                    <div class="row">
                        <div class="col-12">
                            <p>
                                Add the desired CSS class to the icon (or any element of your DOM).
                            </p>
                            <p>
                                For parent hover, add the CSS class <code>faa-parent</code> and <code>animated-hover</code> on the parent.
                            </p>
                            <p>
                                You can regulate the speed of the animation by adding the CSS class <code>faa-fast</code> or <code>faa-slow</code>.
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <h3>
                                On DOM load
                            </h3>
                        </div>
                        <div class="col-md-4">
                            <h3>
                                On hover
                            </h3>
                        </div>
                        <div class="col-md-4">
                            <h3>
                                On parent hover
                            </h3>
                        </div>


                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-wrench faa-wrench animated"></i>
                                &nbsp;faa-wrench animated
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-wrench faa-wrench animated-hover"></i>
                                &nbsp;faa-wrench animated-hover
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#" class="faa-parent animated-hover">
                                <i class="fa fa-wrench faa-wrench"></i>
                                &nbsp;faa-wrench
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-bell faa-ring animated"></i>
                                &nbsp;faa-ring animated
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-bell faa-ring animated-hover"></i>
                                &nbsp;faa-ring animated-hover
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#" class="faa-parent animated-hover">
                                <i class="fa fa-bell faa-ring"></i>
                                &nbsp;faa-ring
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-envelope faa-horizontal animated"></i>
                                &nbsp;faa-horizontal animated
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-envelope faa-horizontal animated-hover"></i>
                                &nbsp;faa-horizontal animated-hover
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#" class="faa-parent animated-hover">
                                <i class="fa fa-envelope faa-horizontal"></i>
                                &nbsp;faa-horizontal
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-thumbs-up faa-vertical animated"></i>
                                &nbsp;faa-vertical animated
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-thumbs-up faa-vertical animated-hover"></i>
                                &nbsp;faa-vertical animated-hover
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#" class="faa-parent animated-hover">
                                <i class="fa fa-thumbs-up faa-vertical"></i>
                                &nbsp;faa-vertical
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-exclamation-triangle faa-flash animated"></i>
                                &nbsp;faa-flash animated
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-exclamation-triangle faa-flash animated-hover"></i>
                                &nbsp;faa-flash animated-hover
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#" class="faa-parent animated-hover">
                                <i class="fa fa-exclamation-triangle faa-flash"></i>
                                &nbsp;faa-flash
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-thumbs-up faa-bounce animated"></i>
                                &nbsp;faa-bounce animated
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-thumbs-up faa-bounce animated-hover"></i>
                                &nbsp;faa-bounce animated-hover
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#" class="faa-parent animated-hover">
                                <i class="fa fa-thumbs-up faa-bounce"></i>
                                &nbsp;faa-bounce
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-spinner faa-spin animated"></i>
                                &nbsp;faa-spin animated
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-spinner faa-spin animated-hover"></i>
                                &nbsp;faa-spin animated-hover
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#" class="faa-parent animated-hover">
                                <i class="fa fa-spinner faa-spin"></i>
                                &nbsp;faa-spin
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-plane faa-float animated"></i>
                                &nbsp;faa-float animated
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-plane faa-float animated-hover"></i>
                                &nbsp;faa-float animated-hover
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#" class="faa-parent animated-hover">
                                <i class="fa fa-plane faa-float"></i>
                                &nbsp;faa-float
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-heart faa-pulse animated"></i>
                                &nbsp;faa-pulse animated
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-heart faa-pulse animated-hover"></i>
                                &nbsp;faa-pulse animated-hover
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#" class="faa-parent animated-hover">
                                <i class="fa fa-heart faa-pulse"></i>
                                &nbsp;faa-pulse
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-envelope faa-shake animated"></i>
                                &nbsp;faa-shake animated
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-envelope faa-shake animated-hover"></i>
                                &nbsp;faa-shake animated-hover
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#" class="faa-parent animated-hover">
                                <i class="fa fa-envelope faa-shake"></i>
                                &nbsp;faa-shake
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-trophy faa-tada animated"></i>
                                &nbsp;faa-tada animated
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-trophy faa-tada animated-hover"></i>
                                &nbsp;faa-tada animated-hover
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#" class="faa-parent animated-hover">
                                <i class="fa fa-trophy faa-tada"></i>
                                &nbsp;faa-tada
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-space-shuttle faa-passing animated"></i>
                                &nbsp;faa-passing animated
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-space-shuttle faa-passing animated-hover"></i>
                                &nbsp;faa-passing animated-hover
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#" class="faa-parent animated-hover">
                                <i class="fa fa-space-shuttle faa-passing"></i>
                                &nbsp;faa-passing
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-space-shuttle faa-passing-reverse animated"></i>
                                &nbsp;faa-passing-reverse animated
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="fa fa-space-shuttle faa-passing-reverse animated-hover"></i>
                                &nbsp;faa-passing-reverse animated-hover
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#" class="faa-parent animated-hover">
                                <i class="fa fa-space-shuttle faa-passing-reverse"></i>
                                &nbsp;faa-passing-reverse
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="far fa-circle faa-burst animated"></i>
                                &nbsp;faa-burst animated
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="far fa-circle faa-burst animated-hover"></i>
                                &nbsp;faa-burst animated-hover
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#" class="faa-parent animated-hover">
                                <i class="far fa-circle faa-burst"></i>
                                &nbsp;faa-burst
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="far fa-star faa-falling animated"></i>
                                &nbsp;faa-falling animated
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#">
                                <i class="far fa-star faa-falling animated-hover"></i>
                                &nbsp;faa-falling animated-hover
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="#" class="faa-parent animated-hover">
                                <i class="far fa-star faa-falling"></i>
                                &nbsp;faa-falling
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <style type="text/css">
            #font-awsome-animation-icons-panel-body-id div[class^='col-md-'] {
                margin-bottom: 25px;
            }
        </style>
        <script type="text/javascript">
            jQuery(document).ready(function () {
                (function ($) {
                    $("#ex6").bootstrapSlider();
                    $("#ex6").on("slide", function (slideEvt) {
//                        $("#ex6SliderVal").text(slideEvt.value);
                        $("#font-awsome-animation-icons-panel-body-id .col-md-4 i").css('font-size', slideEvt.value);
                    });
                }(jQuery));
            });
        </script>
    </div>
