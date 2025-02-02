<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info mt-3">
                <p>Implementing a simple Bootstrap Dual Select feature by moving items between two select lists using javascript</p>
            </div>
            <div class="card my-3">
                <div class="card-header">
                    Bootstrap Dual Select
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
                        <div class="col-md-5">
                            <select multiple="multiple" id="lstCarList" class="form-control">
                                <option value="volvo">Volvo</option>
                                <option value="saab">Saab</option>
                                <option value="opel">Opel</option>
                                <option value="audi">Audi</option>
                                <option value="Toyota">Toyota</option>
                                <option value="Perodua">Perodua</option>
                                <option value="Honda">Honda</option>
                                <option value="Nissan">Nissan</option>
                                <option value="BMW">BMW</option>
                                <option value="Volkswagen">Volkswagen</option>
                                <option value="Ford">Ford</option>
                                <option value="Mazda">Mazda</option>
                            </select>
                        </div>
                        <div class="col-md-2 text-center">
                            <a href="javascript:void(0)" onclick="javascript:fnMoveItems('lstCarList', 'lstAddedCarList');"
                               class="btn btn-primary btn-block">
                                <span class="fa fa-fw fa-chevron-next"></span>
                            </a>
                            <a href="javascript:void(0)" onclick="javascript:fnMoveAllItems('lstCarList', 'lstAddedCarList');"
                               class="btn btn-primary btn-block">
                                <span class="fa fa-fw fa-forward-next"></span>
                            </a>
                            <a href="javascript:void(0)" onclick="javascript:fnMoveItems('lstAddedCarList', 'lstCarList');"
                               class="btn btn-warning btn-block">
                                <span class="fa fa-fw fa-chevron-prev"></span>
                            </a>
                            <a href="javascript:void(0)" onclick="javascript:fnMoveAllItems('lstAddedCarList', 'lstCarList');"
                               class="btn btn-warning btn-block">
                                <span class="fa fa-fw fa-backward-prev"></span>
                            </a>
                        </div>
                        <div class="col-md-5">
                            <select multiple="multiple" id="lstAddedCarList" class="form-control"></select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--<link href="components/" rel="stylesheet">-->
    <style type="text/css">
        select[multiple]{
            height: 200px;
        }
    </style>
    <!--<script src="components/"></script>-->
    <script type="text/javascript">
        function fnMoveItems(lstbxFrom, lstbxTo) {
            var varFromBox = document.getElementById(lstbxFrom);
            var varToBox = document.getElementById(lstbxTo);
            if ((varFromBox !== null) && (varToBox !== null)) {
                if (varFromBox.length < 1) {
                    return false;
                }
                if (varFromBox.options.selectedIndex === -1) {
                    return false;
                }
                while (varFromBox.options.selectedIndex >= 0) {
                    var newOption = new Option(); // Create a new instance of ListItem
                    newOption.text = varFromBox.options[varFromBox.options.selectedIndex].text;
                    newOption.value = varFromBox.options[varFromBox.options.selectedIndex].value;
                    varToBox.options[varToBox.length] = newOption; //Append the item in Target Listbox
                    varFromBox.remove(varFromBox.options.selectedIndex); //Remove the item from Source Listbox
                }
            }
            return false;
        }

        function fnMoveAllItems(lstbxFrom, lstbxTo) {
            var varFromBox = document.getElementById(lstbxFrom);
            var varToBox = document.getElementById(lstbxTo);
            if ((varFromBox !== null) && (varToBox !== null)) {
                if (varFromBox.length < 1) {
                    return false;
                }
                for (var i = 0; i < varFromBox.length; i++) {
                    var newOption = new Option(); // Create a new instance of ListItem
                    newOption.text = varFromBox.options[i].text;
                    newOption.value = varFromBox.options[i].value;
                    varToBox.options[varToBox.length] = newOption; //Append the item in Target Listbox
                }
                while (varFromBox.length > 0) {
                    varFromBox.remove(0); //Remove the item from Source Listbox
                }
            }
            return false;
        }

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