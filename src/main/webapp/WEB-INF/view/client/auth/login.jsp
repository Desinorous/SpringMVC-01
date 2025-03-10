<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
        <script type="text/javascript" src="/client/js/validation.js" defer></script>
        <link rel="stylesheet" href="/client/css/styleReLo.css">
      </head>

      <body>
        <div class="wrapper">
          <h1>Login</h1>
          <p id="error-message"></p>
          <c:if test="${param.error != null}">
            <div class="my-2" style="color: red;">Email or password không hợp lệ!</div>
          </c:if>
          <c:if test="${param.logout != null}">
            <div class="my-2" style="color: green;">Bạn đã đăng xuất thành công</div>
          </c:if>
          <form id="form" method="post" action="/login">
            <div class="form-login">
              <label class="label-login" for="email-input">
                <span>@</span>
              </label>
              <input class="input-login" type="email" name="username" id="email-input" placeholder="Email">
            </div>
            <div class="form-login">
              <label class="label-login" for="password-input">
                <svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 -960 960 960" width="24">
                  <path
                    d="M240-80q-33 0-56.5-23.5T160-160v-400q0-33 23.5-56.5T240-640h40v-80q0-83 58.5-141.5T480-920q83 0 141.5 58.5T680-720v80h40q33 0 56.5 23.5T800-560v400q0 33-23.5 56.5T720-80H240Zm240-200q33 0 56.5-23.5T560-360q0-33-23.5-56.5T480-440q-33 0-56.5 23.5T400-360q0 33 23.5 56.5T480-280ZM360-640h240v-80q0-50-35-85t-85-35q-50 0-85 35t-35 85v80Z" />
                </svg>
              </label>
              <input class="input-login" type="password" name="password" id="password-input" placeholder="Password">


              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </div>
            <div class="form-check">
              <input type="checkbox" name="remember" class="form-check-input" id="exampleCheck1">
              <label class="form-check-label" for="exampleCheck1">Remember me</label>
            </div>
            <button type="submit">Login</button>
          </form>
          <p>New here? <a href="/register">Create an Account</a></p>
        </div>
      </body>

      </html>