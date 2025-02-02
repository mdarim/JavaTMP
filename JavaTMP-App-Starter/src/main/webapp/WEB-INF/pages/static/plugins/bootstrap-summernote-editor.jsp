<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info mt-3">
                <p>Summernote is a JavaScript library that helps you create WYSIWYG editors online.</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://summernote.org/"><i class="fa fa-external-link-alt fa-fw"></i>Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/summernote/summernote/"><i class="fa fa-external-link-alt fa-fw"></i>github.com Page</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Bootstrap Summernote Editor
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <form>
                        <div class="form-group">
                            <label for="exampleInputEmail1">All Summernote Buttons</label>
                            <textarea id="summernote" class="form-control">
                                <p>Hello World</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                            </textarea>
                            <small class="form-text text-muted">All Buttons.</small>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-10">
                                <button class="show-written-content btn btn-primary">Show written text</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">airMode Summernote Plugin</label>
                            <textarea id="summernote-airMode" class="form-control">
                                <p>Hello World</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                            </textarea>
                            <small class="form-text text-muted">airMode options.</small>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <button class="show-airMode-content btn btn-primary">Show written text</button>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <button id="edit" class="btn btn-primary edit" type="button">Edit 1</button>
                                <button id="save" class="btn btn-primary save" type="button">Save 2</button>
                                <br/><br/>
                                <div class="click2edit">click2edit</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="hint2basic">hint for words options</label>
                            <textarea id="hint2basic" class="form-control">
                                <p>Hello World</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                            </textarea>
                            <small class="form-text text-muted">hint for words options.</small>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <button class="show-hint2basic-content btn btn-primary">Show written text</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="hint2emoji">Hint for emoji - use <code>https://api.github.com/emojis</code></label>
                            <textarea id="hint2emoji" class="form-control">
                                <p>Hello World</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                                <p>scroll text...</p>
                            </textarea>
                            <small class="form-text text-muted">Hint for emoji options.</small>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <button class="show-hint2emoji-content btn btn-primary">Show written text</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="hint2mention">Hint for mentions For Mentions: [jayden, sam, alvin, david]</label>
                            <textarea id="hint2mention" class="form-control"></textarea>
                            <small class="form-text text-muted">For Mentions: [jayden, sam, alvin, david].</small>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <button class="show-hint2mention-content btn btn-primary">Show written text</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        /*
        Embed CSS styling for current page.
        */
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.

            var HelloButton = function (context) {
                var ui = $.summernote.ui;

                // create button
                var button = ui.button({
                    contents: '<i class="fa fa-child"/> Hello',
//                    tooltip: 'hello',
                    click: function () {
                        // invoke insertText method with 'hello' on editor module.
                        context.invoke('editor.insertText', 'hello');
                    }
                });

                return button.render();   // return button as jquery object
            };

            $('#summernote').summernote({
                height: 350,
                tabsize: 2,
                dialogsInBody: true,
                toolbar: [
                    ['style', ['fontname', 'fontsize', 'color', 'bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
                    ['Paragraph style', ['style', 'ol', 'ul', 'paragraph', 'height']],
                    ['Insert', ['picture', 'link', 'video', 'table', 'hr']],
                    ['Misc', ['fullscreen', 'codeview', 'undo', 'redo', 'help']],
                    ['mybutton', ['hello']]
                ],
                buttons: {
                    hello: HelloButton
                }
            });

            $('#summernote-airMode').summernote({
                airMode: true
            });

            $(".show-written-content").on("click", function (event) {
                event.preventDefault();
                var makrup = $('#summernote').summernote('code');
                BootstrapModalWrapperFactory.alert(makrup);
            });
            $(".show-airMode-content").on("click", function (event) {
                event.preventDefault();
                var makrup = $('#summernote-airMode').summernote('code');
                BootstrapModalWrapperFactory.alert(makrup);
            });

            $(".edit").on("click", function (event) {
                $('.click2edit').summernote({focus: true});
            });
            $(".save").on("click", function (event) {
                var markup = $('.click2edit').summernote('code');
                BootstrapModalWrapperFactory.alert(markup);
                $('.click2edit').summernote('destroy');
            });

            $("#hint2basic").summernote({
                height: 200,
                toolbar: false,
                placeholder: 'type with apple, orange, watermelon and lemon',
                hint: {
                    words: ['apple', 'apply', 'able', 'orange', 'watermelon', 'lemon'],
                    match: /\b(\w{1,})$/,
                    search: function (keyword, callback) {
                        callback($.grep(this.words, function (item) {
                            return item.indexOf(keyword) === 0;
                        }));
                    }
                }
            });
            $(".show-hint2basic-content").on("click", function (event) {
                event.preventDefault();
                var makrup = $('#hint2basic').summernote('code');
                BootstrapModalWrapperFactory.alert(makrup);
            });

            $.ajax({
                url: 'https://api.github.com/emojis',
                async: false
            }).then(function (data) {
                window.emojis = Object.keys(data);
                window.emojiUrls = data;
            });

            $("#hint2emoji").summernote({
                height: 100,
                toolbar: false,
                placeholder: 'type starting with : and any alphabet',
                hint: {
                    match: /:([\-+\w]+)$/,
                    search: function (keyword, callback) {
                        callback($.grep(emojis, function (item) {
                            return item.indexOf(keyword) === 0;
                        }));
                    },
                    template: function (item) {
                        var content = emojiUrls[item];
                        return '<img src="' + content + '" width="20" /> :' + item + ':';
                    },
                    content: function (item) {
                        var url = emojiUrls[item];
                        if (url) {
                            return $('<img />').attr('src', url).css('width', 20)[0];
                        }
                        return '';
                    }
                }
            });
            $(".show-hint2emoji-content").on("click", function (event) {
                event.preventDefault();
                var makrup = $('#hint2emoji').summernote('code');
                BootstrapModalWrapperFactory.alert(makrup);
            });

            $("#hint2mention").summernote({
                height: 100,
                toolbar: false,
                hint: {
                    mentions: ['jayden', 'sam', 'alvin', 'david'],
                    match: /\B@(\w*)$/,
                    search: function (keyword, callback) {
                        callback($.grep(this.mentions, function (item) {
                            return item.indexOf(keyword) == 0;
                        }));
                    },
                    content: function (item) {
                        return '@' + item;
                    }
                }
            });
            $(".show-hint2mention-content").on("click", function (event) {
                event.preventDefault();
                var makrup = $('#hint2mention').summernote('code');
                BootstrapModalWrapperFactory.alert(makrup);
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
                $('#summernote').summernote("destroy");
                $('#summernote-airMode').summernote("destroy");
                $("#hint2basic").summernote("destroy");
                $("#hint2emoji").summernote("destroy");
                $("#hint2mention").summernote("destroy");
                return true;
            });
        });
    </script>
</div>