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
                        const orgImage = "${updatedProduct.image}";
                        if (orgImage) {
                            const urlImage = "/img/product/" + orgImage;
                            $("#avatarPreview").attr("src", urlImage);
                            $("#avatarPreview").css({ "display": "block" });
                        }
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
                            <h1 style="text-align: center;" class="mt-3">Manage Products</h1>
                            <div class="container-fluid p-5 mt-3">
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Update Product</h3>
                                            <hr />
                                            <form:form action="/admin/product/update" method="post"
                                                modelAttribute="updatedProduct" enctype="multipart/form-data">
                                                <div class="row">
                                                    <div class="mb-3" style="display: none;">
                                                        <label class="form-label">Id:</label>
                                                        <form:input type="text" class="form-control" path="id" />
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label class="form-label">Name:</label>
                                                        <form:input type="text" class="form-control" id="name"
                                                            path="name" />
                                                        <form:errors style="color: red;" path="name" />
                                                    </div>

                                                    <div class="form-group col-md-6">
                                                        <label class="form-label">Price:</label>
                                                        <form:input type="number" step="1" class="form-control"
                                                            id="password" path="price" />
                                                        <form:errors style="color: red;" path="price" />
                                                    </div>
                                                </div>

                                                <div class="mb-3 mt-4">
                                                    <label class="form-label">Detail Description:</label>
                                                    <form:input type="text" class="form-control" path="detailDesc" />
                                                    <form:errors style="color: red;" path="detailDesc" />
                                                </div>
                                                <div class="row mt-4">
                                                    <div class="form-group col-md-6">
                                                        <label class="form-label">Short Description:</label>
                                                        <form:input type="text" class="form-control" path="shortDesc" />
                                                        <form:errors style="color: red;" path="shortDesc" />
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label class="form-label">Quantity:</label>
                                                        <form:input type="number" class="form-control"
                                                            path="quantity" />
                                                        <form:errors style="color: red;" path="quantity" />
                                                    </div>
                                                </div>
                                                <div class="row mt-4">
                                                    <div class="form-group col-md-6">
                                                        <label class="form-label">Factory:</label>
                                                        <form:select class="form-select" path="factory">
                                                            <option selected>Choose...</option>
                                                            <form:option value="Gà Ta">Gà Ta</form:option>
                                                            <form:option value="Gà Tre">Gà Tre</form:option>
                                                            <form:option value="Gà Ri">Gà Ri</form:option>
                                                            <form:option value="Gà Đông Tảo">Gà Đông Tảo</form:option>
                                                            <form:option value="Gà Tây">Gà Tây</form:option>
                                                        </form:select>
                                                    </div>

                                                    <div class="form-group col-md-6">
                                                        <label class="form-label">Target:</label>
                                                        <form:select class="form-select" path="target">
                                                            <option selected>Choose...</option>
                                                            <form:option value="Sinh Viên">Sinh Viên</form:option>
                                                            <form:option value="Gia Đình">Gia Đình</form:option>
                                                            <form:option value="Dân Văn Phòng">Dân Văn Phòng
                                                            </form:option>
                                                            <form:option value="Giới Siêu Giàu">Giới Siêu Giàu
                                                            </form:option>
                                                        </form:select>
                                                    </div>

                                                </div>
                                                <div class="mb-3 mt-4">
                                                    <label class="form-label" for="avatarFile">Image:</label>
                                                    <input class="form-control" type="file" id="avatarFile" name="file"
                                                        accept=".png, .jpg, .jpeg">
                                                </div>
                                                <div class="col-12 mb-3 mt-4">
                                                    <img class="mx-auto" style="max-height: 250px; display: none;"
                                                        alt="avatar preview" id="avatarPreview">
                                                </div>

                                                <div class="d-flex justify-content-between mt-4">
                                                    <button type="submit" class="btn btn-primary">Update</button>
                                                    <a href="/admin/product" class="btn btn-info">Return</a>
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