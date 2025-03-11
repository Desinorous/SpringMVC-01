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

                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <h1 style="text-align: center;" class="mt-3">Manage Roles</h1>
                            <div class="container-fluid p-5 mt-3">
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Update Role</h3>
                                            <hr />
                                            <form:form method="post" action="/admin/role/update"
                                                modelAttribute="updatedRole">

                                                <div class="mb-3" style="display: none;">
                                                    <label class="form-label">Id:</label>
                                                    <form:input type="text" class="form-control" path="id" />
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Name:</label>
                                                    <form:input type="text" class="form-control" id="roleNameInput"
                                                        path="name" />
                                                    <select class="form-select mt-1"
                                                        onchange="document.getElementById('roleNameInput').value=this.value;">
                                                        <option value="">Choose...</option>
                                                        <option value="Admin">Admin</option>
                                                        <option value="User">User</option>
                                                    </select>
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Description:</label>
                                                    <form:input type="text" class="form-control" path="description" />
                                                </div>

                                                <div class="d-flex justify-content-between">
                                                    <button type="submit" class="btn btn-primary">Update</button>
                                                    <a href="/admin/role" class="btn btn-info">Return</a>
                                                </div>
                                            </form:form>
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