<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Chicken Kingdom
                </title>
                <link href="/css/styles.css" rel="stylesheet" />
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <h1 style="text-align: center;" class="mt-3">Manage Users</h1>
                            <div class="container-fluid p-5 mt-3">
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3>User Detail</h3>
                                            </div>

                                            <hr />
                                            <div class="card" style="width: 60%;">
                                                <div class="card-header">
                                                    ${user.fullname}
                                                </div>
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item"><img
                                                            style="width: 200px; height: 200px; object-fit: cover;"
                                                            src="/img/avatar/${user.avatar}" alt=""></li>
                                                    <li class="list-group-item">ID: ${user.id}</li>
                                                    <li class="list-group-item">Email: ${user.email}</li>
                                                    <li class="list-group-item">Address: ${user.address}</li>
                                                    <li class="list-group-item">Phone: ${user.phone}</li>
                                                    <li class="list-group-item">Phone: ${user.role.name}</li>
                                                </ul>
                                            </div>

                                            <a href="/admin/user" class="btn btn-primary mt-4">Return</a>
                                        </div>

                                    </div>

                                </div>
                            </div>

                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
            </body>

            </html>