<%-- 
    Document   : body
    Created on : 26 nov 2023, 12:49:50
    Author     : Acid
--%>

<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                <div class="sidebar-brand-icon">
                   <img src="img/logoremoved.png" alt="Logo" width="100" height="100" class="img-fluid">
                   
                </div>

            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
          
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Gestión
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                   aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-clipboard-check"></i>                 
                    <span>Turnos</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Acciones:</h6>
                        <a class="collapse-item" href="nuevoTurno.jsp"><i class="fas fa-plus mr-2"></i> Agregar Nuevo Turno</a>
                        <a class="collapse-item" href="listado.jsp" ><i class="fas fa-list mr-2"></i> Ver Todos los Turnos</a>
                        <a class="collapse-item" href="listadoFechas.jsp" ><i class="fas fa-list mr-2"></i> Ver Listado por fecha</a>
                    </div>
                </div>
            </li>
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Title -->
                    <div class="topbar-title">
                        <h2 class="m-0 text-gray-800">Sistema de Gestión de Turnos</h2>
                    </div>

                    <!-- ... (Resto del código) -->

                </nav>
                <!-- End of Topbar -->

