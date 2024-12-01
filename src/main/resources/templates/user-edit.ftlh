<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Edit Compilation</title>
</head>
<body>
    <header>
        <#include "components/navbar.ftl">
    </header>
    <main class="d-grid gap-5 py-5 mx-auto" style="width: 900px;">

<h3>Редактирование пользователя ${user.name}</h3>
<form action="/admin/user/edit" method="post">
    <#list roles as role>
        <div>
            <label><input type="radio" name="role" value="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
        </div>
    </#list>
    <input type="hidden" value="${user.id}" name="userId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <button class="mt-4 btn btn-primary" type="submit">Сохранить</button>
</form>
    </main>
</body>
</html>