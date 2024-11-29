<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/1.css">
</head>
<body>

<header data-bs-theme="dark">
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="/head">Главная страница</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/books">Готовые букеты</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/someBooks">Собрать букет</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/cart">Корзина</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/">Профиль</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/admin">Профиль админа</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<section class="py-5 text-center container">
    <div class="row py-lg-5">
        <div class="col-lg-6 col-md-8 mx-auto">
            <h1 class="fw-light">FLOWERS SHOP</h1>
            <p class="lead text-muted">Откройте мир цветов: бесконечные возможности для креативных и ярких букетов</p>
        </div>
    </div>
</section>

<div class="container mt-5">
    <h4>Панель администратора</h4>
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

    <h3>Создать новую книгу</h3>
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

    <h1>Список книг</h1>
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
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
