<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2019/5/24
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">

    <!-- Libs CSS -->
    <link rel="stylesheet" href="assets/fonts/feather/feather.min.css">
    <link rel="stylesheet" href="assets/libs/highlight.js/styles/vs2015.css">
    <link rel="stylesheet" href="assets/libs/quill/dist/quill.core.css">
    <link rel="stylesheet" href="assets/libs/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="assets/libs/flatpickr/dist/flatpickr.min.css">

    <!-- Theme CSS -->

    <link rel="stylesheet" href="assets/css/theme.min.css" id="stylesheetLight">

    <link rel="stylesheet" href="assets/css/theme-dark.min.css" id="stylesheetDark">

    <style>body { display: none; }</style>


    <title>文件</title>
</head>
<body>
























    <!-- CONTENT -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">

                <!-- Files -->
                <div class="card" data-toggle="lists" data-lists-values='["name"]'>
                    <div class="card-header">
                        <div class="row align-items-center">
                            <div class="col">

                                <!-- Title -->
                                <h4 class="card-header-title">
                                    Files
                                </h4>

                            </div>
                            <div class="col-auto">

                                <!-- Dropdown -->
                                <div class="dropdown">

                                    <!-- Toggle -->
                                    <a href="#!" class="small text-muted dropdown-toggle" data-toggle="dropdown">
                                        Sort order
                                    </a>

                                    <!-- Menu -->
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item sort" data-sort="name" href="#!">
                                            Asc
                                        </a>
                                        <a class="dropdown-item sort" data-sort="name" href="#!">
                                            Desc
                                        </a>
                                    </div>

                                </div>

                            </div>
                            <div class="col-auto">

                                <!-- Button -->
                                <a href="#!" class="btn btn-sm btn-primary">
                                    Upload
                                </a>

                            </div>
                        </div> <!-- / .row -->
                    </div>
                    <div class="card-header">
                        <div class="row">
                            <div class="col-12">

                                <!-- Form -->
                                <form>
                                    <div class="input-group input-group-flush input-group-merge">
                                        <input type="search" class="form-control form-control-prepended search" placeholder="Search">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <span class="fe fe-search"></span>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div> <!-- / .row -->
                    </div>
                    <div class="card-body">

                        <!-- List -->
                        <ul class="list-group list-group-lg list-group-flush list my--4">
                            <li class="list-group-item px-0">

                                <div class="row align-items-center">
                                    <div class="col-auto">

                                        <!-- Avatar -->
                                        <a href="#!" class="avatar avatar-lg">
                                            <img src="assets/img/files/file-1.jpg" alt="..." class="avatar-img rounded">
                                        </a>

                                    </div>
                                    <div class="col ml--2">

                                        <!-- Title -->
                                        <h4 class="card-title mb-1 name">
                                            <a href="#!">Launchday Logo</a>
                                        </h4>

                                        <!-- Text -->
                                        <p class="card-text small text-muted mb-1">
                                            2.5kb SVG
                                        </p>

                                        <!-- Time -->
                                        <p class="card-text small text-muted">
                                            Uploaded by Dianna Smiley on <time datetime="2018-01-03">Jan 3, 2018</time>
                                        </p>

                                    </div>
                                    <div class="col-auto">

                                        <!-- Button -->
                                        <a href="#!" class="btn btn-sm btn-white d-none d-md-inline-block">
                                            Download
                                        </a>

                                    </div>
                                    <div class="col-auto">

                                        <!-- Dropdown -->
                                        <div class="dropdown">
                                            <a href="#!" class="dropdown-ellipses dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fe fe-more-vertical"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a href="#!" class="dropdown-item">
                                                    Action
                                                </a>
                                                <a href="#!" class="dropdown-item">
                                                    Another action
                                                </a>
                                                <a href="#!" class="dropdown-item">
                                                    Something else here
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                </div> <!-- / .row -->

                            </li>
                            <li class="list-group-item px-0">

                                <div class="row align-items-center">
                                    <div class="col-auto">

                                        <!-- Avatar -->
                                        <a href="#!" class="avatar avatar-lg">
                                            <img src="assets/img/files/file-2.jpg" alt="..." class="avatar-img rounded">
                                        </a>

                                    </div>
                                    <div class="col ml--2">

                                        <!-- Title -->
                                        <h4 class="card-title mb-1 name">
                                            <a href="#!">Example Grid</a>
                                        </h4>

                                        <!-- Text -->
                                        <p class="card-text small text-muted mb-1">
                                            1.5mb PNG
                                        </p>

                                        <!-- Time -->
                                        <p class="card-text small text-muted">
                                            Uploaded by Dianna Smiley on <time datetime="2018-01-03">Jan 3, 2018</time>
                                        </p>

                                    </div>
                                    <div class="col-auto">

                                        <!-- Button -->
                                        <a href="#!" class="btn btn-sm btn-white d-none d-md-inline-block">
                                            Download
                                        </a>

                                    </div>
                                    <div class="col-auto">

                                        <!-- Dropdown -->
                                        <div class="dropdown">
                                            <a href="#!" class="dropdown-ellipses dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fe fe-more-vertical"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a href="#!" class="dropdown-item">
                                                    Action
                                                </a>
                                                <a href="#!" class="dropdown-item">
                                                    Another action
                                                </a>
                                                <a href="#!" class="dropdown-item">
                                                    Something else here
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                </div> <!-- / .row -->

                            </li>
                            <li class="list-group-item px-0">

                                <div class="row align-items-center">
                                    <div class="col-auto">

                                        <!-- Avatar -->
                                        <a href="#!" class="avatar avatar-lg">
                          <span class="avatar-title rounded bg-white text-secondary">
                            <span class="fe fe-folder"></span>
                          </span>
                                        </a>

                                    </div>
                                    <div class="col ml--2">

                                        <!-- Title -->
                                        <h4 class="card-title mb-1 name">
                                            <a href="#!">Screenshot Collection</a>
                                        </h4>

                                        <!-- Text -->
                                        <p class="card-text small text-muted mb-1">
                                            6.9mb directory
                                        </p>

                                        <!-- Time -->
                                        <p class="card-text small text-muted">
                                            Uploaded by Dianna Smiley on <time datetime="2018-01-03">Jan 3, 2018</time>
                                        </p>

                                    </div>
                                    <div class="col-auto">

                                        <!-- Button -->
                                        <a href="#!" class="btn btn-sm btn-white d-none d-md-inline-block">
                                            Download
                                        </a>

                                    </div>
                                    <div class="col-auto">

                                        <!-- Dropdown -->
                                        <div class="dropdown">
                                            <a href="#!" class="dropdown-ellipses dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fe fe-more-vertical"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a href="#!" class="dropdown-item">
                                                    Action
                                                </a>
                                                <a href="#!" class="dropdown-item">
                                                    Another action
                                                </a>
                                                <a href="#!" class="dropdown-item">
                                                    Something else here
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                </div> <!-- / .row -->

                            </li>
                            <li class="list-group-item px-0">

                                <div class="row align-items-center">
                                    <div class="col-auto">

                                        <!-- Avatar -->
                                        <a href="#!" class="avatar avatar-lg">
                          <span class="avatar-title rounded bg-white text-secondary">
                            <span class="fe fe-package"></span>
                          </span>
                                        </a>

                                    </div>
                                    <div class="col ml--2">

                                        <!-- Title -->
                                        <h4 class="card-title mb-1 name">
                                            <a href="#!">Database migration (compressed)</a>
                                        </h4>

                                        <!-- Text -->
                                        <p class="card-text small text-muted mb-1">
                                            5.9mb ZIP
                                        </p>

                                        <!-- Time -->
                                        <p class="card-text small text-muted">
                                            Uploaded by Dianna Smiley on <time datetime="2018-01-03">Jan 3, 2018</time>
                                        </p>

                                    </div>
                                    <div class="col-auto">

                                        <!-- Button -->
                                        <a href="#!" class="btn btn-sm btn-white d-none d-md-inline-block">
                                            Download
                                        </a>

                                    </div>
                                    <div class="col-auto">

                                        <!-- Dropdown -->
                                        <div class="dropdown">
                                            <a href="#!" class="dropdown-ellipses dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fe fe-more-vertical"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a href="#!" class="dropdown-item">
                                                    Action
                                                </a>
                                                <a href="#!" class="dropdown-item">
                                                    Another action
                                                </a>
                                                <a href="#!" class="dropdown-item">
                                                    Something else here
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                </div> <!-- / .row -->

                            </li>
                            <li class="list-group-item px-0">

                                <div class="row align-items-center">
                                    <div class="col-auto">

                                        <!-- Avatar -->
                                        <a href="#!" class="avatar avatar-lg">
                                            <img src="assets/img/files/file-3.jpg" alt="..." class="avatar-img rounded">
                                        </a>

                                    </div>
                                    <div class="col ml--2">

                                        <!-- Title -->
                                        <h4 class="card-title mb-1 name">
                                            <a href="#!">Launchday Cover</a>
                                        </h4>

                                        <!-- Text -->
                                        <p class="card-text small text-muted mb-1">
                                            750kb JPG
                                        </p>

                                        <!-- Time -->
                                        <p class="card-text small text-muted">
                                            Uploaded by Dianna Smiley on <time datetime="2018-01-03">Jan 3, 2018</time>
                                        </p>

                                    </div>
                                    <div class="col-auto">

                                        <!-- Button -->
                                        <a href="#!" class="btn btn-sm btn-white d-none d-md-inline-block">
                                            Download
                                        </a>

                                    </div>
                                    <div class="col-auto">

                                        <!-- Dropdown -->
                                        <div class="dropdown">
                                            <a href="#!" class="dropdown-ellipses dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fe fe-more-vertical"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a href="#!" class="dropdown-item">
                                                    Action
                                                </a>
                                                <a href="#!" class="dropdown-item">
                                                    Another action
                                                </a>
                                                <a href="#!" class="dropdown-item">
                                                    Something else here
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                </div> <!-- / .row -->

                            </li>
                            <li class="list-group-item px-0">

                                <div class="row align-items-center">
                                    <div class="col-auto">

                                        <!-- Avatar -->
                                        <a href="#!" class="avatar avatar-lg">
                          <span class="avatar-title rounded bg-white text-secondary">
                            <span class="fe fe-film"></span>
                          </span>
                                        </a>

                                    </div>
                                    <div class="col ml--2">

                                        <!-- Title -->
                                        <h4 class="card-title mb-1 name">
                                            <a href="#!">Prototype Screencap</a>
                                        </h4>

                                        <!-- Text -->
                                        <p class="card-text small text-muted mb-1">
                                            23.5mb MOV
                                        </p>

                                        <!-- Time -->
                                        <p class="card-text small text-muted">
                                            Uploaded by Dianna Smiley on <time datetime="2018-01-03">Jan 3, 2018</time>
                                        </p>

                                    </div>
                                    <div class="col-auto">

                                        <!-- Button -->
                                        <a href="#!" class="btn btn-sm btn-white d-none d-md-inline-block">
                                            Download
                                        </a>

                                    </div>
                                    <div class="col-auto">

                                        <!-- Dropdown -->
                                        <div class="dropdown">
                                            <a href="#!" class="dropdown-ellipses dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fe fe-more-vertical"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a href="#!" class="dropdown-item">
                                                    Action
                                                </a>
                                                <a href="#!" class="dropdown-item">
                                                    Another action
                                                </a>
                                                <a href="#!" class="dropdown-item">
                                                    Something else here
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                </div> <!-- / .row -->

                            </li>
                            <li class="list-group-item px-0">

                                <div class="row align-items-center">
                                    <div class="col-auto">

                                        <!-- Avatar -->
                                        <a href="#!" class="avatar avatar-lg">
                                            <img src="assets/img/files/file-4.jpg" alt="..." class="avatar-img rounded">
                                        </a>

                                    </div>
                                    <div class="col ml--2">

                                        <!-- Title -->
                                        <h4 class="card-title mb-1 name">
                                            <a href="#!">Header block example</a>
                                        </h4>

                                        <!-- Text -->
                                        <p class="card-text small text-muted mb-1">
                                            1.2mb PNG
                                        </p>

                                        <!-- Time -->
                                        <p class="card-text small text-muted">
                                            Uploaded by Dianna Smiley on <time datetime="2018-01-03">Jan 3, 2018</time>
                                        </p>

                                    </div>
                                    <div class="col-auto">

                                        <!-- Button -->
                                        <a href="#!" class="btn btn-sm btn-white d-none d-md-inline-block">
                                            Download
                                        </a>

                                    </div>
                                    <div class="col-auto">

                                        <!-- Dropdown -->
                                        <div class="dropdown">
                                            <a href="#!" class="dropdown-ellipses dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fe fe-more-vertical"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a href="#!" class="dropdown-item">
                                                    Action
                                                </a>
                                                <a href="#!" class="dropdown-item">
                                                    Another action
                                                </a>
                                                <a href="#!" class="dropdown-item">
                                                    Something else here
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                </div> <!-- / .row -->

                            </li>
                            <li class="list-group-item px-0">

                                <div class="row align-items-center">
                                    <div class="col-auto">

                                        <!-- Avatar -->
                                        <a href="#!" class="avatar avatar-lg">
                          <span class="avatar-title rounded bg-white text-secondary">
                            <span class="fe fe-pie-chart"></span>
                          </span>
                                        </a>

                                    </div>
                                    <div class="col ml--2">

                                        <!-- Title -->
                                        <h4 class="card-title mb-1 name">
                                            <a href="#!">User test results slides</a>
                                        </h4>

                                        <!-- Text -->
                                        <p class="card-text small text-muted mb-1">
                                            1.1mb PPTX
                                        </p>

                                        <!-- Time -->
                                        <p class="card-text small text-muted">
                                            Uploaded by Dianna Smiley on <time datetime="2018-01-03">Jan 3, 2018</time>
                                        </p>

                                    </div>
                                    <div class="col-auto">

                                        <!-- Button -->
                                        <a href="#!" class="btn btn-sm btn-white d-none d-md-inline-block">
                                            Download
                                        </a>

                                    </div>
                                    <div class="col-auto">

                                        <!-- Dropdown -->
                                        <div class="dropdown">
                                            <a href="#!" class="dropdown-ellipses dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fe fe-more-vertical"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a href="#!" class="dropdown-item">
                                                    Action
                                                </a>
                                                <a href="#!" class="dropdown-item">
                                                    Another action
                                                </a>
                                                <a href="#!" class="dropdown-item">
                                                    Something else here
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                </div> <!-- / .row -->

                            </li>
                        </ul>

                    </div>
                </div>

            </div>
        </div> <!-- / .row -->
    </div>

</div> <!-- / .main-content -->

<!-- JAVASCRIPT
================================================== -->
<!-- Libs JS -->
<script src="assets/libs/jquery/dist/jquery.min.js"></script>
<script src="assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="assets/libs/chart.js/dist/Chart.min.js"></script>
<script src="assets/libs/chart.js/Chart.extension.min.js"></script>
<script src="assets/libs/highlightjs/highlight.pack.min.js"></script>
<script src="assets/libs/flatpickr/dist/flatpickr.min.js"></script>
<script src="assets/libs/jquery-mask-plugin/dist/jquery.mask.min.js"></script>
<script src="assets/libs/list.js/dist/list.min.js"></script>
<script src="assets/libs/quill/dist/quill.min.js"></script>
<script src="assets/libs/dropzone/dist/min/dropzone.min.js"></script>
<script src="assets/libs/select2/dist/js/select2.min.js"></script>

<!-- Theme JS -->
<script src="assets/js/theme.min.js"></script>

</body>
</html>