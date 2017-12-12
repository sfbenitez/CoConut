<aside class="left-sidebar">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar">
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav">
                <li> <a class="waves-effect waves-dark" href="/dashboard" aria-expanded="false"><i class="mdi mdi-checkerboard"></i><span class="hide-menu">Dashboard</span></a></li>
                <li> <a class="waves-effect waves-dark" href="/profile" aria-expanded="false"><i class="mdi mdi-face-profile"></i><span class="hide-menu">Profile</span></a></li>
                <li> <a class="waves-effect waves-dark" href="/backups" aria-expanded="false"><i class="mdi mdi-format-list-bulleted-type"></i><span class="hide-menu">Backups</span></a></li>
                % if str(get('rol')) in '1' :
                <!--<li> <a class="waves-effect waves-dark" href="/newbackup" aria-expanded="false"><i class="mdi mdi-database-plus"></i><span class="hide-menu">New Backup</span></a></li>-->
                % else:
                <li> <a class="waves-effect waves-dark" href="/newbackup" aria-expanded="false"><i class="mdi mdi-database-plus"></i><span class="hide-menu">New Backup</span></a></li>
                % end
                <!--<li> <a class="waves-effect waves-dark" href="/stats" aria-expanded="false"><i class="mdi mdi-vector-polyline"></i><span class="hide-menu">Stats</span></a></li>-->
                <!--<li> <a class="waves-effect waves-dark" href="pages-blank.html" aria-expanded="false"><i class="mdi mdi-book-open-variant"></i><span class="hide-menu">Blank</span></a></li>-->
                <!--<li> <a class="waves-effect waves-dark" href="pages-error-404.html" aria-expanded="false"><i class="mdi mdi-help-circle"></i><span class="hide-menu">404</span></a></li>-->
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>
