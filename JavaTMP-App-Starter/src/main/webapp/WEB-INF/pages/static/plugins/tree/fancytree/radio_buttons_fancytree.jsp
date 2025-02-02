<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info mt-3">
                <p>Fancytree is a jQuery tree view / tree grid plugin with support for keyboard, inline editing, filtering, checkboxes, drag'n'drop, and lazy loading</p>
                <p>
                    <a target="_blank" class="btn btn-info" href="http://wwwendt.de/tech/fancytree/demo/">Demo Site</a>
                    <a target="_blank" class="btn btn-info" href="https://github.com/mar10/fancytree">github source code</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Radio Buttons Fancytree
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div id="Checkboxes_Fancytree_id"></div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {
                glyph_opts = {
                    preset: "awesome5",
                    map: {
                        doc: "far fa-file",
                        docOpen: "fa fa-file",
                        checkbox: "far fa-circle",
                        checkboxSelected: "far fa-dot-circle",
                        checkboxUnknown: "fa fa-minus-square",
                        dragHelper: "fa fa-arrows",
                        dropMarker: "fa fa-arrow-right",
                        error: "fa fa-exclamation-triangle",
                        expanderClosed: "fa fa-chevron-right",
                        expanderLazy: "fa fa-chevron-right",
                        expanderOpen: "fa fa-chevron-down",
                        folder: "fa fa-folder",
                        folderOpen: "fa fa-folder-open",
                        loading: "fa fa-sync fa-spin"
                    }
                };
                if (javatmp.settings.isRTL === true) {
                    $.extend(true, glyph_opts, {
                        map: {
                            dropMarker: "fa fa-arrow-left",
                            expanderClosed: "fa fa-chevron-left",
                            expanderLazy: "fa fa-chevron-left"
                        }
                    });
                }
                $("#Checkboxes_Fancytree_id").fancytree({
                    rtl: javatmp.settings.isRTL,
                    extensions: ["glyph"],
                    checkbox: 1,
                    selectMode: 1,
                    glyph: glyph_opts,
                    // tooltip: true,
                    // tooltip: function(event, data) { return data.node.title + "!"},
                    source: [
                        {title: "n1 (checkbox: false)", expanded: true, checkbox: false, children: [
                                {title: "n1.1"},
                                {title: "n1.2 (selected)", selected: true},
                                {title: "n1.3"}
                            ]},
                        {title: "n2", expanded: true, checkbox: false, children: [
                                {title: "n2.1"},
                                {title: "n2.2"},
                                {title: "n2.3"}
                            ]}
                    ],
                    init: function (event, data) {
                        // Set key from first part of title (just for this demo output)
                        data.tree.visit(function (n) {
                            n.key = n.title.split(" ")[0];
                        });
                    },
                    activate: function (event, data) {
                        data.node.setSelected(true);
                    },
                    select: function (event, data) {
                    },
                    keydown: function (event, data) {
                        if (event.which === 32) {
                            data.node.toggleSelected();
                            return false;
                        }
                        if (javatmp.settings.isRTL === true) {
                            var KC = $.ui.keyCode;
                            var oe = event.originalEvent;
                            // Swap LEFT/RIGHT keys
                            switch (event.which) {
                                case KC.LEFT:
                                    oe.keyCode = KC.RIGHT;
                                    oe.which = KC.RIGHT;
                                    break;
                                case KC.RIGHT:
                                    oe.keyCode = KC.LEFT;
                                    oe.which = KC.LEFT;
                                    break;
                            }
                        }
                    }
                });

            }(jQuery));
        });
    </script>
</div>