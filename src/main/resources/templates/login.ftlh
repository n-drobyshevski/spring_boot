<!DOCTYPE html>
<html lang="ru">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <title>Dead Poets Society</title>
 <link rel="stylesheet" href="/static/css/login.css"> 
 <link rel="stylesheet" href="/css/base.css">

</head>

<body >
  <header>
    <#include "components/navbar.ftl">
  </header>
<main class="d-flex flex-column">
<div class="flex-fill">
<h1>Авторизация</h1>

<!-- Сообщения об ошибке или об успешном логауте-->
    <div class="container d-flex justify-content-center pt-4">
    <#if message??>
        <p>
            ${message}
        </p>
    </#if>
    <#if errorMessage??>
            <p>
                ${errorMessage}
            </p>
    </#if>
    </div>


<div class="regist">
    <div class="regist">
    <form action="/login " method="post">
        <div class="form-group">
            <label for="email">Электронная почта</label>
            <input type="email" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="email" name="username">
            <div id="email" class="invalid-feedback">
                Неверная электронная почта
            </div>
        </div>
        <div class="form-group">
            <label for="password">Пароль</label>
            <input type="password" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="password" name="password">
            <div id="password" class="invalid-feedback">
                Неверный пароль
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" style="width: 100%" class="btn btn-dark">Войти</button>
    </form>
    </div>
</div>
<h5 style="text-align: center">Нет аккаунта? <a href="/registration">Зарегистрируйся!</a></h5>
 </div>
</main>
</body>

</html>