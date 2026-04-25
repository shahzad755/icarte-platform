            <!-- BEGIN SIDEBAR -->
            <div class="page-sidebar-wrapper">
                <!-- BEGIN SIDEBAR -->
                <div class="page-sidebar navbar-collapse collapse">
                    <!-- BEGIN SIDEBAR MENU -->
                    <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
                        <li class="sidebar-toggler-wrapper hide">
                            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                            <div class="sidebar-toggler"> </div>
                            <!-- END SIDEBAR TOGGLER BUTTON -->
                        </li>
                        <li class="nav-itemstart ${controllerName==null? 'active open':''}">
                            <a href="${request.contextPath}" class="nav-link nav-toggle">
                                <i class="icon-home"></i>
                                <span class="title">Dashboard</span>
                            </a>
                        </li>
                        <li class="heading">
                            <h3 class="uppercase">Management</h3>
                        </li>
                        <li class="nav-item">
							<sec:ifAnyGranted roles="ROLE_SUPERADMIN">
                                <li class="nav-item ${controllerName=='accountType'? 'active open':''}">
                                    <a href="${request.contextPath}/accountType/index" class="nav-link ">
                                    	<i class="fa fa-anchor"></i>
                                        <span class="title">Manage Account Types</span>
                                    </a>
                                </li>
                            </sec:ifAnyGranted>
                            <sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER">
                                <li class="nav-item ${controllerName=='restaurant'? 'active open':''}">
                                    <a href="${request.contextPath}/restaurant/index" class="nav-link ">
                                        <i class="fa fa-institution"></i>
                                        <span class="title">Manage Restaurant</span>
                                    </a>
                                </li>
                            </sec:ifAnyGranted>
                            <sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER">
                                <li class="nav-item ${controllerName=='branch'? 'active open':''}">
                                    <a href="javascript:;" class="nav-link nav-toggle">
                                        <i class="fa fa-map-signs"></i>
                                        <span class="title">Manage Branches</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
		                                    <a href="${request.contextPath}/branch/index" class="nav-link ">
		                                        <span class="title">View Branches</span>
		                                    </a>
                                        </li>
                                        <li class="nav-item">
		                                    <a href="${request.contextPath}/branch/create" class="nav-link ">
		                                        <span class="title">Create New Branch</span>
		                                    </a>
                                        </li>
                                    </ul>
                                </li>
                           	</sec:ifAnyGranted>
                            <sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER,ROLE_MANAGER,ROLE_STAFF">
                                <li class="nav-item ${controllerName=='customer'? 'active open':''}">
                                    <a href="javascript:;" class="nav-link nav-toggle">
                                        <i class="fa fa-users"></i>
                                        <span class="title">Manage Customers</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
		                                    <a href="${request.contextPath}/customer/index" class="nav-link ">
		                                        <span class="title">View Customers</span>
		                                    </a>
                                        </li>
                                        <li class="nav-item">
		                                    <a href="${request.contextPath}/customer/create" class="nav-link ">
		                                        <span class="title">Create New Customer</span>
		                                    </a>
                                        </li>
                                    </ul>
                                </li>
                           	</sec:ifAnyGranted>
                            <sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER,ROLE_MANAGER">
                                <li class="nav-item ${controllerName=='servingTable'? 'active open':''}">
                                    <a href="javascript:;" class="nav-link nav-toggle">
                                        <i class="fa fa-th-large"></i>
                                        <span class="title">Manage Tables</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
		                                    <a href="${request.contextPath}/servingTable/index" class="nav-link ">
		                                        <span class="title">View Tables</span>
		                                    </a>
                                        </li>
                                        <li class="nav-item">
		                                    <a href="${request.contextPath}/servingTable/create" class="nav-link ">
		                                        <span class="title">Create New Table</span>
		                                    </a>
                                        </li>
                                    </ul>
                                </li>
                            </sec:ifAnyGranted>
                            <sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER,ROLE_MANAGER">
                                <li class="nav-item ${controllerName=='restaurantDevice'? 'active open':''}">
                                    <a href="javascript:;" class="nav-link nav-toggle">
                                        <i class="fa fa-mobile"></i>
                                        <span class="title">Manage Devices</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
		                                    <a href="${request.contextPath}/restaurantDevice/index" class="nav-link ">
		                                        <span class="title">View Devices</span>
		                                    </a>
                                        </li>
                                        <li class="nav-item">
		                                    <a href="${request.contextPath}/restaurantDevice/create" class="nav-link ">
		                                        <span class="title">Create New Device</span>
		                                    </a>
                                        </li>
                                    </ul>
                                </li>
                            </sec:ifAnyGranted>
                            <sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER,ROLE_MANAGER">
                                <li class="nav-item ${controllerName=='feedbackConfig'? 'active open':''}">
                                    <a href="javascript:;" class="nav-link nav-toggle">
                                        <i class="fa fa-comments-o"></i>
                                        <span class="title">Manage Feedback Conf.</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
		                                    <a href="${request.contextPath}/feedbackConfig/index" class="nav-link ">
		                                        <span class="title">View Feedback Configurations</span>
		                                    </a>
                                        </li>
                                        <li class="nav-item">
		                                    <a href="${request.contextPath}/feedbackConfig/create" class="nav-link ">
		                                        <span class="title">Create New Feedback Configuration</span>
		                                    </a>
                                        </li>
                                    </ul>
                                </li>
                           	</sec:ifAnyGranted>
                            <sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER">
                                <li class="nav-item ${controllerName=='statusType'? 'active open':''}">
                                    <a href="javascript:;" class="nav-link nav-toggle">
                                        <i class="icon-tag"></i>
                                        <span class="title">Manage Status Types</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
		                                    <a href="${request.contextPath}/statusType/index" class="nav-link ">
		                                        <span class="title">View Status Types</span>
		                                    </a>
                                        </li>
                            		<sec:access controller="statusType" action='create'>
                                        <li class="nav-item">
		                                    <a href="${request.contextPath}/statusType/create" class="nav-link ">
		                                        <span class="title">Create New Status Type</span>
		                                    </a>
                                        </li>
                                    </sec:access>
                                    </ul>
                                </li>
                            </sec:ifAnyGranted>
                            <sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER,ROLE_MANAGER">
                                <li class="nav-item ${controllerName=='user'? 'active open':''}">
                                    <a href="javascript:;" class="nav-link nav-toggle">
                                        <i class="icon-users"></i>
                                        <span class="title">Manage Users</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
		                                    <a href="${request.contextPath}/user/index" class="nav-link ">
		                                        <span class="title">View Users</span>
		                                    </a>
                                        </li>
                            		<sec:access controller="user" action='create'>
                                        <li class="nav-item">
		                                    <a href="${request.contextPath}/user/create" class="nav-link ">
		                                        <span class="title">Create New User</span>
		                                    </a>
                                        </li>
                                    </sec:access>
                                    </ul>
                                </li>
                           	</sec:ifAnyGranted>
                            <sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER,ROLE_MANAGER">
                                <li class="nav-item ${controllerName=='restaurantEvent'? 'active open':''}">
                                    <a href="javascript:;" class="nav-link nav-toggle">
                                        <i class="icon-calendar"></i>
                                        <span class="title">Manage Events</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
		                                    <a href="${request.contextPath}/restaurantEvent/index" class="nav-link ">
		                                        <span class="title">View Events</span>
		                                    </a>
                                        </li>
                                        <li class="nav-item">
		                                    <a href="${request.contextPath}/restaurantEvent/create" class="nav-link ">
		                                        <span class="title">Create New Event</span>
		                                    </a>
                                        </li>
                                    </ul>
                                </li>
                           	</sec:ifAnyGranted>
                            <sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER">
                                <li class="nav-item">
                                    <a href="javascript:;" class="nav-link nav-toggle">
                                        <i class="icon-settings"></i>
                                        <span class="title">Settings</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                            		<sec:access controller="requestmapCache" action='clearCache'>
                                        <li class="nav-item">
		                                    <a href="${request.contextPath}/requestmapCache/clearCache" class="nav-link ">
		                                        <span class="title">Refresh User Permissions</span>
		                                    </a>
                                        </li>
                                    </sec:access>
                                    </ul>
                                </li>
                           	</sec:ifAnyGranted>
                        <li class="heading">
                            <h3 class="uppercase">Inventory</h3>
                        </li>
                     <sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER,ROLE_MANAGER">
                        <li class="nav-item ${controllerName=='menu'? 'active open':''}">
                            <a href="javascript:;" class="nav-link nav-toggle">
                                <i class="icon-book-open"></i>
                                <span class="title">Manage Menu Gropus</span>
                                <span class="arrow"></span>
                            </a>
                            <ul class="sub-menu">
                            	<li class="nav-item">
                               		<a href="${request.contextPath}/menu/index" class="nav-link ">
                                   		<span class="title">View Menu Groups</span>
                               		</a>
                                </li>
                        	<sec:access controller="menu" action='create'>
                            	<li class="nav-item">
                               		<a href="${request.contextPath}/menu/create" class="nav-link ">
                                   		<span class="title">Create New Menu Group</span>
                               		</a>
                                </li>
                            </sec:access>
                            </ul>
                        </li>
                    </sec:ifAnyGranted>
                    <sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER,ROLE_MANAGER">
                        <li class="nav-item ${controllerName=='addon'? 'active open':''}">
                            <a href="javascript:;" class="nav-link nav-toggle">
                                <i class="icon-layers"></i>
                                <span class="title">Manage Addons</span>
                                <span class="arrow"></span>
                            </a>
                            <ul class="sub-menu">
                            	<li class="nav-item">
                               		<a href="${request.contextPath}/addon/index" class="nav-link ">
                                   		<span class="title">View Addons</span>
                               		</a>
                                </li>
                            <sec:access controller="addon" action='create'>
                            	<li class="nav-item">
                               		<a href="${request.contextPath}/addon/create" class="nav-link ">
                                   		<span class="title">Create New Addon</span>
                               		</a>
                                </li>
                            </sec:access>
                            </ul>
                        </li>
                     </sec:ifAnyGranted>
                     <sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER,ROLE_MANAGER">
                        <li class="nav-item ${controllerName=='cuisineType'? 'active open':''}">
                            <a href="javascript:;" class="nav-link nav-toggle">
                                <i class="icon-flag"></i>
                                <span class="title">Manage Cuisine Types</span>
                                <span class="arrow"></span>
                            </a>
                            <ul class="sub-menu">
                            	<li class="nav-item">
                               		<a href="${request.contextPath}/cuisineType/index" class="nav-link ">
                                   		<span class="title">View Cuisine Types</span>
                               		</a>
                                </li>
                            <sec:access controller="cuisineType" action='create'>
                            	<li class="nav-item">
                               		<a href="${request.contextPath}/cuisineType/create" class="nav-link ">
                                   		<span class="title">Create New Cuisine Type</span>
                               		</a>
                                </li>
                            </sec:access>
                            </ul>
                        </li>
                     </sec:ifAnyGranted>
                     <sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER,ROLE_MANAGER">
                        <li class="nav-item ${controllerName=='itemCategory'? 'active open':''}">
                            <a href="javascript:;" class="nav-link nav-toggle">
                                <i class="fa fa-sitemap"></i>
                                <span class="title">Manage Item Categories</span>
                                <span class="arrow"></span>
                            </a>
                            <ul class="sub-menu">
                            	<li class="nav-item">
                               		<a href="${request.contextPath}/itemCategory/index" class="nav-link ">
                                   		<span class="title">View Item Categories</span>
                               		</a>
                                </li>
                            <sec:access controller="itemCategory" action='create'>
                            	<li class="nav-item">
                               		<a href="${request.contextPath}/itemCategory/create" class="nav-link ">
                                   		<span class="title">Create New Item Category</span>
                               		</a>
                                </li>
                            </sec:access>
                            </ul>
                        </li>
                     </sec:ifAnyGranted>
                     <sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER,ROLE_MANAGER">
                        <li class="nav-item ${controllerName=='item'? 'active open':''}">
                            <a href="javascript:;" class="nav-link nav-toggle">
                                <i class="fa fa-cutlery"></i>
                                <span class="title">Manage Menu Items</span>
                                <span class="arrow"></span>
                            </a>
                            <ul class="sub-menu">
                            	<li class="nav-item">
                               		<a href="${request.contextPath}/item/index" class="nav-link ">
                                   		<span class="title">View Menu Items</span>
                               		</a>
                                </li>
                            </ul>
                        </li>
                     </sec:ifAnyGranted>
                     <sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER,ROLE_MANAGER,ROLE_STAFF">
                        <li class="heading">
                            <h3 class="uppercase">Operations</h3>
                        </li>
                        <sec:access controller="orders" action='index'>
                        <li class="nav-item ${controllerName=='orders'? 'active':''}">
                      		<a href="${request.contextPath}/orders/index" class="nav-link">
                        		<i class="icon-handbag"></i>
                          		<span class="title">View Orders</span>
                      		</a>
                        </li>
                        </sec:access>
                        <li class="nav-item ${controllerName=='servingTable'? 'active':''}">
                      		<a href="${request.contextPath}/servingTableRequestStatus/index" class="nav-link">
                        		<i class="icon-bell"></i>
                          		<span class="title">View Customer Call Queue</span>
                      		</a>
                        </li>
                    </sec:ifAnyGranted>
                    </ul>
                    <!-- END SIDEBAR MENU -->
                </div>
                <!-- END SIDEBAR -->
            </div>
            <!-- END SIDEBAR -->
