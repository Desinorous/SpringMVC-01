<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


      <html lang="en">

      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Table Users</title>
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <!-- <link href="/css/demo.css" rel="stylesheet"> -->

        <link href="/css/styles.css" rel="stylesheet" />

        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

      </head>

      <body>
        <jsp:include page="../layout/header.jsp" />
        <div id="layoutSidenav">
          <jsp:include page="../layout/sidebar.jsp" />
          <div id="layoutSidenav_content">
            <main>
              <h1 style="text-align: center;" class="mt-3">Manage Users</h1>
              <div class="container-fluid p-5 mt-3">
                <div class="row">
                  <div class="col-12 mx-auto">
                    <div class="d-flex justify-content-between">
                      <h3>Table users</h3>
                      <a href="/admin/user/create" class="btn btn-primary">Create a user</a>
                    </div>

                    <hr />
                    <table class="table table-bordered table-hover">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>Email</th>
                          <th>Full Name</th>
                          <th>Role</th>
                          <th>Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${users}" var="user">
                          <tr>
                            <td>${user.id}</td>
                            <td>${user.email}</td>
                            <td>${user.fullname}</td>
                            <td>${user.getRole().getName()}</td>
                            <td>
                              <a href="/admin/user/${user.id}" class="btn btn-info">View</a>
                              <a href="/admin/user/update/${user.id}" class="btn btn-warning">Edit</a>
                              <a href="/admin/user/delete/${user.id}" class="btn btn-danger">Delete</a>
                            </td>
                          </tr>
                        </c:forEach>

                      </tbody>
                    </table>
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