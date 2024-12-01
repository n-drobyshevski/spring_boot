<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Manage Users</title>
</head>
<body>
    <header>
        <#include "components/navbar.ftl">
    </header>
    <main class="container py-5">
         <div class="mb-4">
            <a href="/admin" class="btn btn-outline-secondary">Назад к панели управления</a>
        </div>
        <h1 class="mb-4">Manage Users</h1>
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
    </main>
    <#include "components/footer.ftl">
</body>
</html>