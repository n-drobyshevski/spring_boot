<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <title>Dead Poets Society</title>
  <link rel="stylesheet" href="/css/1.css">  
  <link rel="stylesheet" href="/css/base.css">
</head>

<body>
  <!-- Include Navbar -->
  <header>
    <#include "components/navbar.ftl">
  </header>

<div class="d-grid gap-5 mt-5 py-5 mx-auto" style="width: 900px;">
    <div class="d-flex flex-column">
        <h4 class=" mb-3">Панель администратора</h4>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>Email</th>
                    <th>Номер телефона</th>
                    <th>Активность</th>
                    <th>Роли</th>
                    <th>Бан</th>
                    <th>Редактирование</th>
                    <th>Подробная информация</th>
                </tr>
            </thead>
            <tbody>
                <#list users as user>
                    <tr>
                        <td>${user.email! "Не указано"}</td>
                        <td>${user.number_phone! "Не указано"}</td>
                        <td><#if user.active>true<#else>false</#if></td>
                        <td><#list user.roles as role>${role} </#list></td>
                        <td>
                            <form action="/admin/user/ban/${user.id}" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <input type="submit" class="btn btn-danger btn-sm" value="Бан">
                            </form>
                        </td>
                        <td><a href="/admin/user/edit/${user.id}" class="btn btn-primary btn-sm">Редактировать</a></td>
                        <td><a href="/user/${user.id}" class="btn btn-info btn-sm">Подробно</a></td>
                    </tr>
                <#else>
                    <tr>
                        <td colspan="7" class="text-center">Пользователей нет</td>
                    </tr>
                </#list>
            </tbody>
        </table>
    </div>
    <div  >
        <h3 class=" mb-3">Создать новую книгу</h3>
        <form action="/books/create" method="post" enctype="multipart/form-data" class="mb-5">
            <div class="mb-3">
                <label for="title" class="form-label">Название:</label>
                <input type="text" name="title" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Цена:</label>
                <input type="number" name="price" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="genre" class="form-label">Жанр:</label>
                <input type="text" name="genre" class="form-control">
            </div>
            <div class="mb-3">
                <label for="author" class="form-label">Автор:</label>
                <input type="text" name="author" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="stock_quantity" class="form-label">Количество:</label>
                <input type="number" name="stock_quantity" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Описание:</label>
                <textarea name="description" class="form-control"></textarea>
            </div>
            <div class="mb-3">
                <label for="file1" class="form-label">Фотография:</label>
                <input type="file" name="file1" class="form-control" required>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="btn btn-success">Добавить товар</button>
        </form>
    </div>
    <div >
        <h1 class=" mb-3">Список книг</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Название</th>
                    <th>Автор</th>
                    <th>Цена</th>
                    <th>Действия</th>
                </tr>
            </thead>
            <tbody>
                <#list books as book>
                    <tr>
                        <td>${book.title! "Название отсутствует"}</td>
                        <td>${book.author! "Автор отсутствует"}</td>
                        <td>${book.price! "Цена отсутствует"}</td>
                        <td>
                            <#if book.id??>
                                <form action="/books/delete/${book.id}" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <button type="submit" class="btn btn-danger btn-sm">Удалить</button>
                                </form>
                            <#else>
                                <span>ID отсутствует</span>
                            </#if>
                        </td>
                    </tr>
                <#else>
                    <tr>
                        <td colspan="4" class="text-center">Книг нет</td>
                    </tr>
                </#list>
            </tbody>
        </table>
    <div>
</div>

  <#include "components/footer.ftl">
</body>

</html>