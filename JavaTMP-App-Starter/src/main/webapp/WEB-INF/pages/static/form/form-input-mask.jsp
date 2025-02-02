<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info mt-3">
                <p>
                    Inputmask is a javascript library which creates an input mask.
                    Inputmask can run against vanilla javascript, jQuery and jqlite.
                    An inputmask helps the user with the input by ensuring a predefined format.
                    This can be useful for dates, numerics, phone numbers
                </p>
                <p>
                    <a class="btn btn-info" target="_blank" href="https://github.com/RobinHerbots/Inputmask">Plugin Home</a>
                    <a class="btn btn-info" target="_blank" href="http://robinherbots.github.io/Inputmask/">Github Plugin Page</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Form Input Mask
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
                            <form role="form">
                                <div class="form-group">
                                    <label>Date Input</label>
                                    <input
                                        class="form-control"
                                        data-inputmask="'alias': 'datetime', 'inputformat' : 'dd/mm/yyyy'"
                                        data-inputmask-clearmaskonlostfocus="false" />
                                    <p class="help-block">Date Input Mask.</p>
                                </div>
                                <div class="form-group">
                                    <label>Custom Phone Input</label>
                                    <input
                                        class="form-control"
                                        data-inputmask="'mask': '( 999 ) - 9999999'"
                                        data-inputmask-clearmaskonlostfocus="false" />
                                    <p class="help-block">Custom Phone Input Mask.</p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">

    </style>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {
//                $("#test-date-mask-id").inputmask({"alias": "date"});
            }(jQuery));
        });
    </script>
</div>