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
            <p class="loader__label">Admin Pro</p>
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
                    <a class="navbar-brand" href="index.html">
                        <!-- Logo icon --><b>
                            <img src="../static/assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                        </b>
                        <!--End Logo icon -->
                        <!-- Logo text -->
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
                        <!-- ============================================================== -->
                        <li class="nav-item hidden-xs-down search-box"> <a class="nav-link hidden-sm-down waves-effect waves-dark" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <form class="app-search">
                                <input type="text" class="form-control" placeholder="Search & enter"> <a class="srh-btn"><i class="ti-close"></i></a>
                            </form>
                        </li>
                        <!-- ============================================================== -->
                        <!-- Profile -->
                        <!-- ============================================================== -->
                        <li class="nav-item">
                            <a class="nav-link waves-effect waves-dark" href="#"><img src="../static/assets/images/users/1.jpg" alt="user" class="profile-pic" /></a>
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
							<div class="row">

								<section class="content">
									<h1>Table Filter</h1>
									<div class="col-md-8 col-md-offset-2">
										<div class="panel panel-default">
											<div class="panel-body">
												<div class="pull-right">
													<div class="btn-group">
														<button type="button" class="btn btn-success btn-filter" data-target="pagado">Pagado</button>
														<button type="button" class="btn btn-warning btn-filter" data-target="pendiente">Pendiente</button>
														<button type="button" class="btn btn-danger btn-filter" data-target="cancelado">Cancelado</button>
														<button type="button" class="btn btn-default btn-filter" data-target="all">Todos</button>
													</div>
												</div>
												<div class="table-container">
													<table class="table table-filter">
														<tbody>
															<tr data-status="pagado">
																<td>
																	<div class="ckbox">
																		<input type="checkbox" id="checkbox1">
																		<label for="checkbox1"></label>
																	</div>
																</td>
																<td>
																	<a href="javascript:;" class="star">
																		<i class="glyphicon glyphicon-star"></i>
																	</a>
																</td>
																<td>
																	<div class="media">
																		<a href="#" class="pull-left">
																			<img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
																		</a>
																		<div class="media-body">
																			<span class="media-meta pull-right">Febrero 13, 2016</span>
																			<h4 class="title">
																				Lorem Impsum
																				<span class="pull-right pagado">(Pagado)</span>
																			</h4>
																			<p class="summary">Ut enim ad minim veniam, quis nostrud exercitation...</p>
																		</div>
																	</div>
																</td>
															</tr>
															<tr data-status="pendiente">
																<td>
																	<div class="ckbox">
																		<input type="checkbox" id="checkbox3">
																		<label for="checkbox3"></label>
																	</div>
																</td>
																<td>
																	<a href="javascript:;" class="star">
																		<i class="glyphicon glyphicon-star"></i>
																	</a>
																</td>
																<td>
																	<div class="media">
																		<a href="#" class="pull-left">
																			<img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
																		</a>
																		<div class="media-body">
																			<span class="media-meta pull-right">Febrero 13, 2016</span>
																			<h4 class="title">
																				Lorem Impsum
																				<span class="pull-right pendiente">(Pendiente)</span>
																			</h4>
																			<p class="summary">Ut enim ad minim veniam, quis nostrud exercitation...</p>
																		</div>
																	</div>
																</td>
															</tr>
															<tr data-status="cancelado">
																<td>
																	<div class="ckbox">
																		<input type="checkbox" id="checkbox2">
																		<label for="checkbox2"></label>
																	</div>
																</td>
																<td>
																	<a href="javascript:;" class="star">
																		<i class="glyphicon glyphicon-star"></i>
																	</a>
																</td>
																<td>
																	<div class="media">
																		<a href="#" class="pull-left">
																			<img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
																		</a>
																		<div class="media-body">
																			<span class="media-meta pull-right">Febrero 13, 2016</span>
																			<h4 class="title">
																				Lorem Impsum
																				<span class="pull-right cancelado">(Cancelado)</span>
																			</h4>
																			<p class="summary">Ut enim ad minim veniam, quis nostrud exercitation...</p>
																		</div>
																	</div>
																</td>
															</tr>
															<tr data-status="pagado" class="selected">
																<td>
																	<div class="ckbox">
																		<input type="checkbox" id="checkbox4" checked>
																		<label for="checkbox4"></label>
																	</div>
																</td>
																<td>
																	<a href="javascript:;" class="star star-checked">
																		<i class="glyphicon glyphicon-star"></i>
																	</a>
																</td>
																<td>
																	<div class="media">
																		<a href="#" class="pull-left">
																			<img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
																		</a>
																		<div class="media-body">
																			<span class="media-meta pull-right">Febrero 13, 2016</span>
																			<h4 class="title">
																				Lorem Impsum
																				<span class="pull-right pagado">(Pagado)</span>
																			</h4>
																			<p class="summary">Ut enim ad minim veniam, quis nostrud exercitation...</p>
																		</div>
																	</div>
																</td>
															</tr>
															<tr data-status="pendiente">
																<td>
																	<div class="ckbox">
																		<input type="checkbox" id="checkbox5">
																		<label for="checkbox5"></label>
																	</div>
																</td>
																<td>
																	<a href="javascript:;" class="star">
																		<i class="glyphicon glyphicon-star"></i>
																	</a>
																</td>
																<td>
																	<div class="media">
																		<a href="#" class="pull-left">
																			<img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
																		</a>
																		<div class="media-body">
																			<span class="media-meta pull-right">Febrero 13, 2016</span>
																			<h4 class="title">
																				Lorem Impsum
																				<span class="pull-right pendiente">(Pendiente)</span>
																			</h4>
																			<p class="summary">Ut enim ad minim veniam, quis nostrud exercitation...</p>
																		</div>
																	</div>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
										<div class="content-footer">
											<p>
												Page © - 2016 <br>
												Powered By <a href="https://www.facebook.com/tavo.qiqe.lucero" target="_blank">TavoQiqe</a>
											</p>
										</div>
									</div>
								</section>

							</div>
						</div>
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
		<script>
		$(document).ready(function () {

			$('.star').on('click', function () {
		      $(this).toggleClass('star-checked');
		    });

		    $('.ckbox label').on('click', function () {
		      $(this).parents('tr').toggleClass('selected');
		    });

		    $('.btn-filter').on('click', function () {
		      var $target = $(this).data('target');
		      if ($target != 'all') {
		        $('.table tr').css('display', 'none');
		        $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
		      } else {
		        $('.table tr').css('display', 'none').fadeIn('slow');
		      }
		    });

		 });
		</script>
    % include('jquery2.tpl')
</body>
</html>
