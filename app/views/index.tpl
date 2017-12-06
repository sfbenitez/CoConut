<!DOCTYPE html>
<html lang="en">

% include('header.tpl', title='Dashboard')

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
                <div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h3 class="text-themecolor">Usuario: {{ user_name }}</h3>
                    </div>
                    <div class="col-md-7 align-self-center">
                        <a href="/logout" class="btn waves-effect waves-light btn-danger pull-right hidden-sm-down"> Logout </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex">
                                    <div>
                                        <h4 class="card-title"><span class="lstick"></span>Últimas copias realizadas</h4></div>
                                </div>
                                <div class="table-responsive m-t-20">
                                    <table class="table vm no-th-brd no-wrap pro-of-month">
                                        <thead>
                                            <tr>
                                                <th colspan="2">Hostname</th>
                                                <th>Usuario</th>
                                                <th>Fecha</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            % for h in backupsusers:
                                            <tr>
                                                <td style="width:50px;"><span class="round"><img src=static/assets/images/{{h[1]}}.jpg alt="user" width="50"></span></td>
                                                <td>
                                                    <h6>{{h[1]}}</h6><small class="text-muted">{{h[0]}}</small>
                                                </td>
                                                <td>{{h[2]}}</td>
                                                <td>
                                                  <h5>{{h[3]}}</h5><small class="text-muted">{{h[4]}}</small></td>
                                            </tr>
                                            % end
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- contact -->
                    <div class="col-lg-6 col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex">
                                    <h4 class="card-title"><span class="lstick"></span>Numero de Backups Por Host</h4>
                                </div>
                                <div class="message-box contact-box">
                                    <div class="message-widget contact-widget">
                                      <h4> Mickey </h3>
                                      <div class="progress">
                                        <div class="progress-bar progress-bar-striped progress-bar-animated bg-danger" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                      </div>
                                      <br>
                                      <h4> Minnie </h3>
                                      <div class="progress">
                                        <div class="progress-bar progress-bar-striped progress-bar-animated bg-minnie" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                      </div>
                                      <br>
                                      <h4> Donald </h3>
                                      <div class="progress">
                                        <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                      </div>
                                      </div>
                                    </div>
                                </div>
                            </div>
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
                                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                          </div>
                                          <br>
                                          <h4> Manuales </h3>
                                          <div class="progress">
                                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                          </div>
                                          </div>
                                        </div>
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
        <!-- ============================================================== -->
    </div>
    % include('jquery.tpl')
</body>
</html>
