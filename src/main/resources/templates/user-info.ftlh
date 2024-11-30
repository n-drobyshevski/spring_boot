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
  <br>
<section class="py-5 text-center container">
    <div class="row py-lg-5">
        <div class="col-lg-6 col-md-8 mx-auto">
        </div>
    </div>
</section>
<body>
<h2 style="text-align: center">Информация о пользователе</h2>
<hr>
<div style="text-align: center">
    <h3>${user.name}</h3>
    <br>
    Номер телефона: <b>${user.number_phone}</b>
    <br>
    Почта:<b>${user.email}</b>
    <hr>
<a class="btn btn-dark" href="/logout">Выйти</a>
<br>
</div>
<#if errorMessage??>
    <h2 style="color: red">${errorMessage}</h2>
</#if>
<br>
</body>
</html>
