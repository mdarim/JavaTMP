<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info mt-3">
                <p>A colorselector for Twitter Bootstrap which lets you select a color from a predefined set of colors only.</p>
                <p>In contrast to many other colorpickers found on Github this one is reduced to a predefined set of colors. This is why it is called "colorselector" rather than "colorpicker".</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://bootstrap-colorselector.flaute.com/">Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/flaute/bootstrap-colorselector">github.com Project Link</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Bootstrap Color Selector
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
                            <div class="form-group">
                                <label>Select Color</label>
                                <select id="colorselector_1" class="form-control">
                                    <option value="106" data-color="#A0522D">sienna</option>
                                    <option value="47" data-color="#CD5C5C" selected="selected">indianred</option>
                                    <option value="87" data-color="#FF4500">orangered</option>
                                    <option value="17" data-color="#008B8B">darkcyan</option>
                                    <option value="18" data-color="#B8860B">darkgoldenrod</option>
                                    <option value="68" data-color="#32CD32">limegreen</option>
                                    <option value="42" data-color="#FFD700">gold</option>
                                    <option value="77" data-color="#48D1CC">mediumturquoise</option>
                                    <option value="107" data-color="#87CEEB">skyblue</option>
                                    <option value="46" data-color="#FF69B4">hotpink</option>
                                    <option value="64" data-color="#87CEFA">lightskyblue</option>
                                    <option value="13" data-color="#6495ED">cornflowerblue</option>
                                    <option value="15" data-color="#DC143C">crimson</option>
                                    <option value="24" data-color="#FF8C00">darkorange</option>
                                    <option value="78" data-color="#C71585">mediumvioletred</option>
                                    <option value="123" data-color="#000000">black</option>
                                </select>
                            </div>
                            <h3>Second Example</h3>
                            <p>Set a color by its hex-value or value and define a callback-function.</p>
                            <div class="bs-docs-example">
                                <select id="colorselector_2">
                                    <option value="106" data-color="#A0522D">sienna</option>
                                    <option value="47" data-color="#CD5C5C" selected="selected">indianred</option>
                                    <option value="87" data-color="#FF4500">orangered</option>
                                    <option value="17" data-color="#008B8B">darkcyan</option>
                                    <option value="18" data-color="#B8860B">darkgoldenrod</option>
                                    <option value="68" data-color="#32CD32">limegreen</option>
                                    <option value="42" data-color="#FFD700">gold</option>
                                    <option value="77" data-color="#48D1CC">mediumturquoise</option>
                                    <option value="107" data-color="#87CEEB">skyblue</option>
                                    <option value="46" data-color="#FF69B4">hotpink</option>
                                    <option value="64" data-color="#87CEFA">lightskyblue</option>
                                    <option value="13" data-color="#6495ED">cornflowerblue</option>
                                    <option value="15" data-color="#DC143C">crimson</option>
                                    <option value="24" data-color="#FF8C00">darkorange</option>
                                    <option value="78" data-color="#C71585">mediumvioletred</option>
                                    <option value="123" data-color="#000000">black</option>
                                </select>
                                <br/>
                                <form class="form-inline">
                                    <div class="btn-group">
                                        <button class="btn btn-success" type="button" id="setColor">set by color (#008B8B)</button>
                                        <button class="btn btn-success" type="button" id="setValue">set by value (18)</button>
                                    </div>
                                    <div class="form-group">
                                        <label for="" class="control-label">value:</label>
                                        <input id="colorValue" size="3" type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="" class="control-label">Color Code:</label>
                                        <input id="colorColor" size="8" type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="" class="control-label">Color Name:</label>
                                        <input id="colorTitle" size="15" type="text" class="form-control">
                                    </div>

                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        jQuery(function ($) {
            $('#colorselector_1').colorselector();
            $('#colorselector_2').colorselector({
                callback: function (value, color, title) {
                    $("#colorValue").val(value);
                    $("#colorColor").val(color);
                    $("#colorTitle").val(title);
                }
            });

            $("#setColor").click(function (e) {
                $("#colorselector_2").colorselector("setColor", "#008B8B");
            });

            $("#setValue").click(function (e) {
                $("#colorselector_2").colorselector("setValue", 18);
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {

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