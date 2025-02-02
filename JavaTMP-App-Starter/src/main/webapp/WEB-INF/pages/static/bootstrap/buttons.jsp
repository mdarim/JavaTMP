<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col">
            <div class="card my-3">
                <div class="card-header">
                    Bootstrap Buttons
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <h4 class="card-title text-primary">Default Buttons:</h4>
                    <button type="button" class="btn btn-primary">Primary</button>
                    <button type="button" class="btn btn-secondary">Secondary</button>
                    <button type="button" class="btn btn-success">Success</button>
                    <button type="button" class="btn btn-danger">Danger</button>
                    <button type="button" class="btn btn-warning">Warning</button>
                    <button type="button" class="btn btn-info">Info</button>
                    <button type="button" class="btn btn-light">Light</button>
                    <button type="button" class="btn btn-dark">Dark</button>
                    <button type="button" class="btn btn-link">Link</button>
                    <h4 class="card-title text-primary">Button tags</h4>
                    <a class="btn btn-primary" href="#" role="button">Link</a>
                    <button class="btn btn-primary" type="submit">Button</button>
                    <input class="btn btn-primary" type="button" value="Input">
                    <input class="btn btn-primary" type="submit" value="Submit">
                    <input class="btn btn-primary" type="reset" value="Reset">
                    <h4 class="card-title text-primary">Outline buttons</h4>
                    <button type="button" class="btn btn-outline-primary">Primary</button>
                    <button type="button" class="btn btn-outline-secondary">Secondary</button>
                    <button type="button" class="btn btn-outline-success">Success</button>
                    <button type="button" class="btn btn-outline-danger">Danger</button>
                    <button type="button" class="btn btn-outline-warning">Warning</button>
                    <button type="button" class="btn btn-outline-info">Info</button>
                    <button type="button" class="btn btn-outline-light">Light</button>
                    <button type="button" class="btn btn-outline-dark">Dark</button>
                    <h4 class="card-title text-primary">Sizes</h4>
                    <button type="button" class="btn btn-primary btn-lg">Primary</button>
                    <button type="button" class="btn btn-secondary btn-lg">Secondary</button>
                    <button type="button" class="btn btn-success btn-lg">Success</button>
                    <button type="button" class="btn btn-danger btn-lg">Danger</button>
                    <button type="button" class="btn btn-warning btn-lg">Warning</button>
                    <button type="button" class="btn btn-info btn-lg">Info</button>
                    <button type="button" class="btn btn-light btn-lg">Light</button>
                    <button type="button" class="btn btn-dark btn-lg">Dark</button>
                    <button type="button" class="btn btn-link btn-lg">Link</button>
                    <br/><br/>
                    <button type="button" class="btn btn-primary btn-sm">Primary</button>
                    <button type="button" class="btn btn-secondary btn-sm">Secondary</button>
                    <button type="button" class="btn btn-success btn-sm">Success</button>
                    <button type="button" class="btn btn-danger btn-sm">Danger</button>
                    <button type="button" class="btn btn-warning btn-sm">Warning</button>
                    <button type="button" class="btn btn-info btn-sm">Info</button>
                    <button type="button" class="btn btn-light btn-sm">Light</button>
                    <button type="button" class="btn btn-dark btn-sm">Dark</button>
                    <button type="button" class="btn btn-link btn-sm">Link</button>
                    <h4 class="card-title text-primary">block level buttons</h4>
                    <button type="button" class="btn btn-primary btn-block">Primary</button>
                    <button type="button" class="btn btn-secondary btn-block">Secondary</button>
                    <button type="button" class="btn btn-success btn-block">Success</button>
                    <button type="button" class="btn btn-danger btn-block">Danger</button>
                    <button type="button" class="btn btn-warning btn-block">Warning</button>
                    <button type="button" class="btn btn-info btn-block">Info</button>
                    <button type="button" class="btn btn-light btn-block">Light</button>
                    <button type="button" class="btn btn-dark btn-block">Dark</button>
                    <button type="button" class="btn btn-link btn-block">Link</button>
                    <h4 class="card-title text-primary">Active state</h4>
                    <button type="button" class="btn btn-primary active">Primary</button>
                    <button type="button" class="btn btn-secondary active">Secondary</button>
                    <button type="button" class="btn btn-success active">Success</button>
                    <button type="button" class="btn btn-danger active">Danger</button>
                    <button type="button" class="btn btn-warning active">Warning</button>
                    <button type="button" class="btn btn-info active">Info</button>
                    <button type="button" class="btn btn-light active">Light</button>
                    <button type="button" class="btn btn-dark active">Dark</button>
                    <button type="button" class="btn btn-link active">Link</button>
                    <h4 class="card-title text-primary">Disabled state</h4>
                    <button type="button" class="btn btn-primary" disabled="disabled">Primary</button>
                    <button type="button" class="btn btn-secondary" disabled="disabled">Secondary</button>
                    <button type="button" class="btn btn-success" disabled="disabled">Success</button>
                    <button type="button" class="btn btn-danger" disabled="disabled">Danger</button>
                    <button type="button" class="btn btn-warning" disabled="disabled">Warning</button>
                    <button type="button" class="btn btn-info" disabled="disabled">Info</button>
                    <button type="button" class="btn btn-light" disabled="disabled">Light</button>
                    <button type="button" class="btn btn-dark" disabled="disabled">Dark</button>
                    <button type="button" class="btn btn-link disabled" disabled="disabled">Link</button>
                    <h4 class="card-title text-primary">Disabled link state</h4>
                    <a href="#" class="btn btn-primary disabled" role="button" aria-disabled="true">Primary link</a>
                    <a href="#" class="btn btn-secondary disabled" role="button" aria-disabled="true">Link</a>
                    <h4 class="card-title text-primary">Checkbox and radio buttons</h4>
                    <div class="btn-group" data-toggle="buttons">
                        <label class="btn btn-secondary active">
                            <input type="checkbox" checked autocomplete="off"> Checkbox 1 (pre-checked)
                        </label>
                        <label class="btn btn-secondary">
                            <input type="checkbox" autocomplete="off"> Checkbox 2
                        </label>
                        <label class="btn btn-secondary">
                            <input type="checkbox" autocomplete="off"> Checkbox 3
                        </label>
                    </div>
                    <br/><br/>
                    <div class="btn-group" data-toggle="buttons">
                        <label class="btn btn-secondary active">
                            <input type="radio" name="options" id="option1" autocomplete="off" checked> Radio 1 (preselected)
                        </label>
                        <label class="btn btn-secondary">
                            <input type="radio" name="options" id="option2" autocomplete="off"> Radio 2
                        </label>
                        <label class="btn btn-secondary">
                            <input type="radio" name="options" id="option3" autocomplete="off"> Radio 3
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        .dynamic-ajax-content > .row > .col > .card > .card-body .card-title {
            margin-top: .75rem;
            margin-bottom: .5rem;
        }
        .dynamic-ajax-content > .row > .col > .card > .card-body .card-title:first-child {
            margin-top: auto;
            margin-bottom: .5rem;
        }
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
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