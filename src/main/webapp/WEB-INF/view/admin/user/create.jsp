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
        <script>
          $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
              const imgURL = URL.createObjectURL(e.target.files[0]);
              $("#avatarPreview").attr("src", imgURL);
              $("#avatarPreview").css({ "display": "block" });
            });
          });
        </script>

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
                    <div class="col-md-6 col-12 mx-auto">
                      <h3>Create a user</h3>
                      <hr />
                      <form:form action="/admin/user/create" method="post" modelAttribute="newUser">
                        <div class="row">
                          <div class="form-group col-md-6">
                            <label class="form-label">Email:</label>
                            <form:input type="email" class="form-control" id="email" path="email" required="required" />
                          </div>

                          <div class="form-group col-md-6">
                            <label class="form-label">Password:</label>
                            <form:input type="password" class="form-control" id="password" path="password" />
                          </div>
                        </div>

                        <div class="row mt-4">
                          <div class="form-group col-md-6">
                            <label class="form-label">Full Name:</label>
                            <form:input type="text" class="form-control" path="fullname" />
                          </div>
                          <div class="form-group col-md-6">
                            <label class="form-label">Phone number:</label>
                            <form:input type="text" class="form-control" path="phone" />
                          </div>
                        </div>

                        <div class="mb-3 mt-4">
                          <label class="form-label">Address:</label>
                          <form:input type="text" class="form-control" path="address" />
                        </div>

                        <div class="row mt-4">
                          <div class="form-group col-md-6">
                            <label class="form-label">Role:</label>
                            <select class="form-select">
                              <option selected>Choose...</option>
                              <option value="1">Admin</option>
                              <option value="2">User</option>
                            </select>
                          </div>

                          <div class="form-group col-md-6">
                            <label class="form-label" for="avatarFile">Avatar:</label>
                            <input class="form-control" type="file" id="avatarFile" accept=".png, .jpg, .jpeg">
                          </div>
                        </div>
                        <div class="col-12 mb-3 mt-4">
                          <img class="mx-auto" style="max-height: 250px; display: none;" alt="avatar preview"
                            id="avatarPreview">
                        </div>

                        <div class="d-flex justify-content-between mt-4">
                          <button type="submit" class="btn btn-primary">Create</button>
                          <a href="/admin/user" class="btn btn-info">Return</a>
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
        <!-- <script src="js/scripts.js"></script> -->

        <script>
          document.getElementById("email").addEventListener("invalid", function (event) {
            event.target.setCustomValidity("Vui lòng nhập địa chỉ email!");
          });
        </script>
      </body>

      </html>