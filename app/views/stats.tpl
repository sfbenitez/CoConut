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
              <div class="row">
                <!-- Last 5 copyers -->
                  <div class="col-lg-6 col-md-12">
                      <div class="card">
                        <iframe src="http://172.22.200.157:3000/dashboard-solo/db/coconut-db?refresh=30s&orgId=1&panelId=4&from=1513239207714&to=1513250007714" width="620" height="200" frameborder="0"></iframe>
                      </div>
                  </div>
                  <!-- Hosts -->
                  <div class="col-lg-6 col-md-12">
                      <!-- Hosts -->
                      <div class="card">
                        <iframe src="http://172.22.200.157:3000/dashboard-solo/db/coconut-db?refresh=30s&orgId=1&panelId=6&from=1513239577654&to=1513250377654" width="620" height="200" frameborder="0"></iframe>
                        </div>
                  </div>
                  <div class="col-lg-6 col-md-12">
                      <!-- Hosts -->
                      <div class="card">
                        <iframe src="http://172.22.200.157:3000/dashboard-solo/db/coconut-db?refresh=30s&orgId=1&panelId=7&from=1513239686476&to=1513250486476" width="620" height="200" frameborder="0"></iframe>
                      </div>
                  </div>
                  <div class="col-lg-6 col-md-12">
                      <!-- Hosts -->
                      <div class="card">
                        <iframe src="http://172.22.200.157:3000/dashboard-solo/db/coconut-db?refresh=30s&orgId=1&panelId=11&from=1513239797529&to=1513250597529" width="620" height="200" frameborder="0"></iframe>
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
