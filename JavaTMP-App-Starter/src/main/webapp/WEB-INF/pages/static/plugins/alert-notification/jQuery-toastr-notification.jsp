<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info mt-3">
                <p>toastr is a Javascript library for non-blocking notifications. jQuery is required. The goal is to create a simple core library that can be customized and extended</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://codeseven.github.io/toastr/"><i class="fa fa-external-link-alt fa-fw"></i>Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/CodeSeven/toastr"><i class="fa fa-external-link-alt fa-fw"></i>github.com Page</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    jQuery Toastr Notifications
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
                        <div class="col-lg-3 col-md-3">
                            <div class="form-group">
                                <label for="title">Title</label>
                                <input id="title" type="text" class="form-control" placeholder="Enter a title ..." />
                                <label for="message">Message</label>
                                <textarea class="form-control" id="message" rows="3" placeholder="Enter a message ..."></textarea>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label" for="closeButton">
                                    <input id="closeButton" type="checkbox" value="checked" class="form-check-input" />Close Button
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label" for="addBehaviorOnToastClick">
                                    <input id="addBehaviorOnToastClick" type="checkbox" value="checked" class="form-check-input" />Add behavior on toast click
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label" for="addBehaviorOnToastCloseClick">
                                    <input disabled id="addBehaviorOnToastCloseClick" type="checkbox" value="checked" class="form-check-input" />Add behavior on toast close button click
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label" for="debugInfo">
                                    <input id="debugInfo" type="checkbox" value="checked" class="form-check-input" />Debug
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label" for="progressBar">
                                    <input id="progressBar" type="checkbox" value="checked" class="form-check-input" />Progress Bar
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label" for="rtl">
                                    <input id="rtl" type="checkbox" value="checked" class="form-check-input" />Right-To-Left
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label" class="checkbox" for="preventDuplicates">
                                    <input id="preventDuplicates" type="checkbox" value="checked" class="form-check-input" />Prevent Duplicates
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label" for="addClear">
                                    <input id="addClear" type="checkbox" value="checked" class="form-check-input" />Add button to force clearing a toast, ignoring focus
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label" for="newestOnTop">
                                    <input id="newestOnTop" type="checkbox" value="checked" class="form-check-input" />Newest on top
                                </label>
                            </div>

                        </div>

                        <div class="col-lg-3 col-md-3">

                            <div class="form-group" id="toastTypeGroup">
                                <h4 class="card-title">Toast Type</h4>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="toasts" value="success" checked />Success
                                    </label>
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="toasts" value="info" />Info
                                    </label>
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="toasts" value="warning" />Warning
                                    </label>
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="toasts" value="error" />Error
                                    </label>
                                </div>
                            </div>
                            <div class="form-group" id="positionGroup">
                                <h4 class="card-title">Position</h4>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="positions" value="toast-top-right" checked />Top Right
                                    </label>
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="positions" value="toast-bottom-right" />Bottom Right
                                    </label>
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="positions" value="toast-bottom-left" />Bottom Left
                                    </label>
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="positions" value="toast-top-left" />Top Left
                                    </label>
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="positions" value="toast-top-full-width" />Top Full Width
                                    </label>
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="positions" value="toast-bottom-full-width" />Bottom Full Width
                                    </label>
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="positions" value="toast-top-center" />Top Center
                                    </label>
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="positions" value="toast-bottom-center" />Bottom Center
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-3">
                            <div class="form-group">
                                <div class="form-group">
                                    <label for="showEasing">Show Easing</label>
                                    <input id="showEasing" type="text" placeholder="swing, linear" class="form-control" value="swing" />
                                </div>
                                <div class="form-group">
                                    <label for="hideEasing">Hide Easing</label>
                                    <input id="hideEasing" type="text" placeholder="swing, linear" class="form-control" value="linear" />
                                </div>
                                <div class="form-group">
                                    <label for="showMethod">Show Method</label>
                                    <input id="showMethod" type="text" placeholder="show, fadeIn, slideDown" class="form-control" value="fadeIn" />
                                </div>
                                <div class="form-group">
                                    <label for="hideMethod">Hide Method</label>
                                    <input id="hideMethod" type="text" placeholder="hide, fadeOut, slideUp" class="form-control" value="fadeOut" />
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-3">
                            <div class="form-group">
                                <div class="form-group">
                                    <label for="showDuration">Show Duration</label>
                                    <input id="showDuration" type="number" placeholder="ms" class="form-control" value="300"     />
                                </div>
                                <div class="form-group">
                                    <label for="hideDuration">Hide Duration</label>
                                    <input id="hideDuration" type="number" placeholder="ms" class="form-control" value="1000" />
                                </div>
                                <div class="form-group">
                                    <label for="timeOut">Time out</label>
                                    <input id="timeOut" type="number" placeholder="ms" class="form-control" value="5000" />
                                </div>
                                <div class="form-group">
                                    <label for="extendedTimeOut">Extended time out</label>
                                    <input id="extendedTimeOut" type="number" placeholder="ms" class="form-control" value="1000" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <button class="btn btn-primary" id="showtoast">Show Toast</button>
                            <button class="btn btn-danger" id="cleartoasts">Clear Toasts</button>
                            <button class="btn btn-danger" id="clearlasttoast">Clear Last Toast</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {
                var i = -1;
                var toastCount = 0;
                var $toastlast;

                var getMessage = function () {
                    var msgs = ['My name is Inigo Montoya. You killed my father. Prepare to die!',
                        '<div><input class="input-small" value="textbox"/>&nbsp;<a href="http://johnpapa.net" target="_blank">This is a hyperlink</a></div><div><button type="button" id="okBtn" class="btn btn-primary">Close me</button><button type="button" id="surpriseBtn" class="btn" style="margin: 0 8px 0 8px">Surprise me</button></div>',
                        'Are you the six fingered man?',
                        'Inconceivable!',
                        'I do not think that means what you think it means.',
                        'Have fun storming the castle!'
                    ];
                    i++;
                    if (i === msgs.length) {
                        i = 0;
                    }

                    return msgs[i];
                };

                var getMessageWithClearButton = function (msg) {
                    msg = msg ? msg : 'Clear itself?';
                    msg += '<br /><br /><button type="button" class="btn clear">Yes</button>';
                    return msg;
                };

                $('#closeButton').click(function () {
                    if ($(this).is(':checked')) {
                        $('#addBehaviorOnToastCloseClick').prop('disabled', false);
                    } else {
                        $('#addBehaviorOnToastCloseClick').prop('disabled', true);
                        $('#addBehaviorOnToastCloseClick').prop('checked', false);
                    }
                });

                $('#showtoast').click(function () {
                    var shortCutFunction = $("#toastTypeGroup input:radio:checked").val();
                    var msg = $('#message').val();
                    var title = $('#title').val() || '';
                    var $showDuration = $('#showDuration');
                    var $hideDuration = $('#hideDuration');
                    var $timeOut = $('#timeOut');
                    var $extendedTimeOut = $('#extendedTimeOut');
                    var $showEasing = $('#showEasing');
                    var $hideEasing = $('#hideEasing');
                    var $showMethod = $('#showMethod');
                    var $hideMethod = $('#hideMethod');
                    var toastIndex = toastCount++;
                    var addClear = $('#addClear').prop('checked');

                    toastr.options = {
                        closeButton: $('#closeButton').prop('checked'),
                        debug: $('#debugInfo').prop('checked'),
                        newestOnTop: $('#newestOnTop').prop('checked'),
                        progressBar: $('#progressBar').prop('checked'),
                        rtl: $('#rtl').prop('checked'),
                        positionClass: $('#positionGroup input:radio:checked').val() || 'toast-top-right',
                        preventDuplicates: $('#preventDuplicates').prop('checked'),
                        onclick: null
                    };

                    if ($('#addBehaviorOnToastClick').prop('checked')) {
                        toastr.options.onclick = function () {
                            alert('You can perform some custom action after a toast goes away');
                        };
                    }

                    if ($('#addBehaviorOnToastCloseClick').prop('checked')) {
                        toastr.options.onCloseClick = function () {
                            alert('You can perform some custom action when the close button is clicked');
                        };
                    }

                    if ($showDuration.val().length) {
                        toastr.options.showDuration = parseInt($showDuration.val());
                    }

                    if ($hideDuration.val().length) {
                        toastr.options.hideDuration = parseInt($hideDuration.val());
                    }

                    if ($timeOut.val().length) {
                        toastr.options.timeOut = addClear ? 0 : parseInt($timeOut.val());
                    }

                    if ($extendedTimeOut.val().length) {
                        toastr.options.extendedTimeOut = addClear ? 0 : parseInt($extendedTimeOut.val());
                    }

                    if ($showEasing.val().length) {
                        toastr.options.showEasing = $showEasing.val();
                    }

                    if ($hideEasing.val().length) {
                        toastr.options.hideEasing = $hideEasing.val();
                    }

                    if ($showMethod.val().length) {
                        toastr.options.showMethod = $showMethod.val();
                    }

                    if ($hideMethod.val().length) {
                        toastr.options.hideMethod = $hideMethod.val();
                    }

                    if (addClear) {
                        msg = getMessageWithClearButton(msg);
                        toastr.options.tapToDismiss = false;
                    }
                    if (!msg) {
                        msg = getMessage();
                    }

                    $('#toastrOptions').text('Command: toastr["'
                            + shortCutFunction
                            + '"]("'
                            + msg
                            + (title ? '", "' + title : '')
                            + '")\n\ntoastr.options = '
                            + JSON.stringify(toastr.options, null, 2)
                            );

                    var $toast = toastr[shortCutFunction](msg, title); // Wire up an event handler to a button in the toast, if it exists
                    $toastlast = $toast;

                    if (typeof $toast === 'undefined') {
                        return;
                    }

                    if ($toast.find('#okBtn').length) {
                        $toast.delegate('#okBtn', 'click', function () {
                            alert('you clicked me. i was toast #' + toastIndex + '. goodbye!');
                            $toast.remove();
                        });
                    }
                    if ($toast.find('#surpriseBtn').length) {
                        $toast.delegate('#surpriseBtn', 'click', function () {
                            alert('Surprise! you clicked me. i was toast #' + toastIndex + '. You could perform an action here.');
                        });
                    }
                    if ($toast.find('.clear').length) {
                        $toast.delegate('.clear', 'click', function () {
                            toastr.clear($toast, {force: true});
                        });
                    }
                });

                function getLastToast() {
                    return $toastlast;
                }
                $('#clearlasttoast').click(function () {
                    toastr.clear(getLastToast());
                });
                $('#cleartoasts').click(function () {
                    toastr.clear();
                });
            }(jQuery));
        });
    </script>
</div>