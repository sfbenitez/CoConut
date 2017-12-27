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
                    <a class="navbar-brand" href="/dashboard">
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
                            <a class="nav-link waves-effect waves-dark" href="/profile"><img src="{{user_urlimage}}" alt="user" class="profile-pic" /></a>
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
                                    <h4 class="card-title"><span class="lstick"></span>Numero total de Backups - {{total}}</h4>
                                </div>
                                <div class="message-box contact-box">
                                    <div class="message-widget contact-widget">
                                      % for n in names:
                                      % cont = int(n[1] * 100 / total)
                                      <h4> {{n[0]}} -  {{n[1]}}</h4>
                                      <div class="progress">
                                        <div class="progress-bar progress-bar-striped progress-bar-animated bg-{{n[0]}}" role="progressbar" style="width: {{cont}}%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                      </div>
                                      <br>
                                      % end
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
                                          % for m in modes:
                                          % cont = int(m[1] * 100 / total)
                                              <h4> {{m[0]}} - {{m[1]}}</h4>
                                                <div class="progress">
                                                  <div class="progress-bar progress-bar-striped progress-bar-animated bg-{{m[0]}}" role="progressbar" style="width: {{cont}}%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                                <br>
                                            % end
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
