<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h4 class="my-3">jQuery Bootstrap Pagination</h4>
    <hr/>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info">
                <p>jQuery pagination plugin. It simplifies the usage of Bootstrap Pagintion Component.</p>
                <p>
                    <a class="btn btn-info" target="_blank" href="http://josecebe.github.io/twbs-pagination/">Demo Page</a>
                    <a class="btn btn-info" target="_blank" href="https://github.com/josecebe/twbs-pagination">github.com Project Link</a>
                </p>
            </div>
            <div class="card my-3">
                <div class="card-body text-center">
                    <h4 class="card-text">Default Options</h4>
                    <div id="paginationResult1" class="p-5 bg-primary text-white"></div>
                    <ul id="pagination1" class="pagination d-flex justify-content-center my-2 mb-0"></ul>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-body text-center">
                    <h4 class="card-text">Mini Buttons</h4>
                    <div id="paginationResult2" class="p-5 bg-primary text-white"></div>
                    <ul id="pagination2" class="pagination d-flex justify-content-center my-2 mb-0"></ul>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-body text-center">
                    <h4 class="card-text">Synchronized pagination elements</h4>
                    <ul class="pagination3 pagination d-flex justify-content-center my-2 mb-0"></ul>
                    <div id="paginationResult3" class="p-5 bg-primary text-white"></div>
                    <ul class="pagination3 pagination d-flex justify-content-center my-2 mb-0"></ul>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-body text-center">
                    <h4 class="card-text">Alternative style pagination for start and end page numbers</h4>
                    <div id="paginationResult4" class="p-5 bg-primary text-white"></div>
                    <ul id="pagination4" class="pagination d-flex justify-content-center my-2 mb-0"></ul>
                </div>
            </div>
            <div class="card my-3">
                <div class="card-body text-center">
                    <h4 class="card-text">Update Pagination after show Page</h4>
                    <a class="btn btn-success update_pagination5"  href="javascript:;">Add more 2 Pages</a>
                    <a class="btn btn-danger remove_pagination5"  href="javascript:;">Remove 2 Pages</a>

                    <hr class="mx-5"/>
                    <div id="paginationResult5" class="p-5 bg-primary text-white"></div>
                    <ul id="pagination5" class="pagination d-flex justify-content-center my-2 mb-0"></ul>
                </div>
            </div>
        </div>
    </div>
    <!--
    Reference Your external Stylesheet file here
    if your feature or plugins could not support to run globally.
    <link href="components/" rel="stylesheet">
    -->
    <style type="text/css" media="screen">

    </style>
    <style type="text/css">
        /*
        Embed CSS styling for current page.
        */
    </style>

    <!--
    Reference Your external Javascript file here
    if your feature or plugins could not support to run globally.
    <script src="components/"></script>
    -->
    <script type="text/javascript">
        // You could write safely Javascript code here too as our template
        // should load mandatory libraries and plugins before.
        // <--- HERE --->
        //
        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            // <--- HERE --->
            //
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.

                $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                    // fire when user resize browser window or sidebar hide / show
                });

                /**
                 * When another sidebar menu item pressed and before container issues new ajax request.
                 * You can cancel, destroy, or remove any thing here before replace main output ajax container.
                 * return false or event.preventDefault() will cancel ajax and stay you in the current page and do nothing.
                 **/
                $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                    var newLink = $(event._newTarget);
                    return true;
                });

                // custom code run once all transition done and your ajax content is shown to user.
                $('#pagination1').twbsPagination({
                    totalPages: 35,
                    visiblePages: 7,
                    onPageClick: function (event, page) {
                        $('#paginationResult1').text('Page ' + page);
                    }
                });
                $('#pagination2').twbsPagination({
                    totalPages: 35,
                    visiblePages: 0,
                    onPageClick: function (event, page) {
                        $('#paginationResult2').text('Page ' + page);
                    }
                });
                $('.pagination3').twbsPagination({
                    totalPages: 35,
                    onPageClick: function (event, page) {
                        $('#paginationResult3').text('Page ' + page);
                    }
                });
                $('#pagination4').twbsPagination({
                    totalPages: 35,
                    currentPage: 1,
                    cssStyle: '',
                    first: '',
                    prev: '<span aria-hidden="true">&laquo;</span>',
                    next: '<span aria-hidden="true">&raquo;</span>',
                    last: '',
                    onInit: function () {
                        // fire first page loading
                    },
                    onPageClick: function (event, page) {
                        $('#paginationResult4').text('Page ' + page);
                    }
                });

                var $pagination = $('#pagination5');
                var defaultOpts = {
                    currentPage: 1,
                    totalPages: 3,
                    visiblePages: 100,
                    onPageClick: function (event, page) {
                        $('#paginationResult5').text('Page ' + (page));
                    }
                };

                $pagination.twbsPagination(defaultOpts);

                $(".update_pagination5").on("click", function () {
                    var totalPages = $pagination.twbsPagination('getTotalPages') + 2;
                    var currentPage = $pagination.twbsPagination('getCurrentPage');
                    $pagination.twbsPagination('destroy');
                    $pagination.twbsPagination($.extend({}, defaultOpts, {
                        startPage: currentPage,
                        totalPages: totalPages
                    }));
                });
                $(".remove_pagination5").on("click", function () {
                    var totalPages = $pagination.twbsPagination('getTotalPages') - 2;
                    var currentPage = $pagination.twbsPagination('getCurrentPage');
                    if (totalPages > 1) {
                        $pagination.twbsPagination('destroy');
                        $pagination.twbsPagination($.extend({}, defaultOpts, {
                            startPage: currentPage,
                            totalPages: totalPages
                        }));
                    }
                });
            });
        });
    </script>
</div>