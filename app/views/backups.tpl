<!DOCTYPE html>
<html lang="en">

% include('header2.tpl', title='Backups')

<body class="fix-header card-no-border fix-sidebar">
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="loader">
            <div class="loader__figure"></div>
            <p class="loader__label">Coconut</p>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">
                        <!-- Logo icon --><b>
                            <img src="../static/assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                        </b>
                        <!--End Logo icon -->
                        <span>
                            <img src="../static/assets/images/logo-text.png" alt="homepage" class="dark-logo" />
                        </span>
                    </a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav mr-auto">
                        <!-- This is  -->
                        <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a> </li>
                    </ul>
                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav my-lg-0">
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ==============================================================
                        <li class="nav-item hidden-xs-down search-box"> <a class="nav-link hidden-sm-down waves-effect waves-dark" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <form class="app-search">
                                <input type="text" class="form-control" placeholder="Search & enter"> <a class="srh-btn"><i class="ti-close"></i></a>
                            </form>
                        </li>
                        -->
                        <!-- ============================================================== -->
                        <!-- Profile -->
                        <!-- ============================================================== -->
                        <li class="nav-item">
                            <a class="nav-link waves-effect waves-dark" href="#"><img src="{{user_urlimage}}" alt="user" class="profile-pic" /></a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        % include('sidebar.tpl')
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h3 class="text-themecolor">Backups Done</h3>
                    </div>
                    <!--
                    <div class="col-md-7 align-self-center">
                        <a href="https://wrappixel.com/templates/adminpro/" class="btn waves-effect waves-light btn-danger pull-right hidden-sm-down"> Upgrade to Pro</a>
                    </div>
                  -->
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- column -->
                    <div class="col-lg-12">
                      <div class="col-lg-12">
                        <!-- Sarch by Host -->
                        <form action="#" class="form-inline">
                          <!-- Host -->
                          <label class="mr-sm-2 mb-0" for="first_name">Host</label>
                          <input type="text" class="form-control mr-sm-2 mb-2 mb-sm-0" id="first_name" name="first_name">
                          <!-- From -->
                          <label class="mr-sm-2 mb-0" for="date1">From: </label>
                          <input class="form-control mr-sm-2 mb-2 mb-sm-0" type="date" value="2017-12-20" id="date1" name="date1">
                          <!-- To -->
                          <label class="mr-sm-2 mb-0" for="date2">To: </label>
                          <input class="form-control mr-sm-2 mb-2 mb-sm-0" type="date" value="2017-12-20" id="date2" name="date2">
                          <!-- Button -->
                          <button type="submit" class="btn btn-default mt-2 mt-sm-0">Search</button>
                        </form>
                      </div>
                        <!-- Show Hosts -->
                        <div class="card">
                            <div class="card-body">
                              <!--
                                <h4 class="card-title">Basic Table</h4>
                                <h6 class="card-subtitle">Add class <code>.table</code></h6>
                              -->
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class="thead-inverse">
                                            <tr>
                                                <th>Host</th>
                                                <th>Label</th>
                                                <th>Description</th>
                                                <th>Mode</th>
                                                <th>Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                              % for b in backups:
                                              <tr>
                                                <td> {{b[0]}} </td>
                                                <td> {{b[1]}} </td>
                                                <td class="little"> {{b[2]}} </td>
                                                % if b[3] == 'Automatica':
                                                  <td class="table-success"> {{b[3]}} </td>
                                                % elif b[3] == 'Manual':
                                                  <td class="table-warning"> {{b[3]}} </td>
                                                % else:
                                                  <td> {{b[3]}} </td>
                                                % end
                                                <td> {{b[4]}} </td>
                                            </tr>
                                            % end
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            % include('footer.tpl')
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    % include('jquery2.tpl')
</body>

</html>
