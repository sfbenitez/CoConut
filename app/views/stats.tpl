<!DOCTYPE html>
<html lang="en">

% include('header2.tpl', title='Stats')

<body class="fix-header fix-sidebar card-no-border">
  <div>
    <div class="preloader">
        <div class="loader">
            <div class="loader__figure"></div>
            <p class="loader__label">Coconut</p>
        </div>
    </div>
    <div id="main-wrapper">
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">
                        <b>
                            <img src="static/assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                        </b>
                        <span>
                            <img src="static/assets/images/logo-text.png" alt="homepage" class="dark-logo" />
                        </span>
                    </a>
                </div>
                <div class="navbar-collapse">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a> </li>
                    </ul>
                    <ul class="navbar-nav my-lg-0">
                        <li class="nav-item">
                            <a class="nav-link waves-effect waves-dark" href="#"><img src="{{user_urlimage}}" alt="user" class="profile-pic" /></a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        % include('sidebar.tpl')
        <div class="page-wrapper">
            <div class="container-fluid">
                    <!-- contact -->
                    <div class="col-lg-6 col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex">
                                    <h4 class="card-title"><span class="lstick"></span>Numero de Backups Por Host - Total:{{total}}</h4>
                                </div>
                                <div class="message-box contact-box">
                                    <div class="message-widget contact-widget">
                                      <h4> Mickey </h4>
                                      <div class="progress">
                                        <div class="progress-bar progress-bar-striped progress-bar-animated bg-danger" role="progressbar" style="width: {{mickeys}}%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                      </div>
                                      <br>
                                      <h4> Minnie </h4>
                                      <div class="progress">
                                        <div class="progress-bar progress-bar-striped progress-bar-animated bg-minnie" role="progressbar" style="width: {{minnies}}%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                      </div>
                                      <br>
                                      <h4> Donald </h4>
                                      <div class="progress">
                                        <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: {{donalds}}%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                      </div>
                                      </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12">
                                                      <!-- Autos & Manuals -->
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <h4 class="card-title"><span class="lstick"></span>Estadisticas Modo</h4>
                                    </div>
                                    <div class="message-box contact-box">
                                        <div class="message-widget contact-widget">
                                          <h4> Automaticas </h3>
                                          <div class="progress">
                                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: {{automatica}}%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                          </div>
                                          <br>
                                          <h4> Manuales </h3>
                                          <div class="progress">
                                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning" role="progressbar" style="width: {{manual}}%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                          </div>
                                          </div>
                                        </div>
                                    </div>
                                </div>
                    </div>
                </div>


            <!-- footer -->
            % include('footer.tpl')
            <!-- End footer -->
            </div>
          </div>
        </div>
        <!-- ============================================================== -->
    </div>
    % include('jquery.tpl')
</body>
</html>
