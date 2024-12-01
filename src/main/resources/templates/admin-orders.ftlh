<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Управление заказами</title>
</head>
<body>
    <header>
        <#include "components/navbar.ftl">
    </header>
    <main class="container py-5">
        <div class="mb-4">
            <a href="/admin" class="btn btn-outline-secondary">Назад к панели управления</a>
        </div>
        <h1 class="mb-4">Управление заказами</h1>
         <table class="table table-bordered table-hover">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Имя клиента</th>
                    <th>Адрес</th>
                    <th>Способ оплаты</th>
                    <th>Email</th>
                    <th>Книги</th>
                    <th>Статус</th>
                    <th>Действия</th>
                </tr>
            </thead>
            <tbody>
                <#list orders as order>
                    <tr>
                        <td>${order.id}</td>
                        <td>${order.customerName}</td>
                        <td>${order.address}</td>
                        <td>${order.paymentMethod}</td>
                        <td>${order.email}</td>
                        <td>${order.bookTitles}</td>
                        <td>
                            <form action="/orders/update-status" method="post" class="d-inline">
                                <input type="hidden" name="orderId" value="${order.id}">
                                <select name="status" class="form-select form-select-sm">
                                    <option value="В обработке" <#if order.status == "В обработке">selected</#if>>В обработке</option>
                                    <option value="Подтвержден" <#if order.status == "Подтвержден">selected</#if>>Подтвержден</option>
                                    <option value="Доставлен" <#if order.status == "Доставлен">selected</#if>>Доставлен</option>
                                    <option value="Отменен" <#if order.status == "Отменен">selected</#if>>Отменен</option>
                                </select>
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <button type="submit" class="btn btn-outline-primary btn-sm mt-2">Обновить статус</button>
                            </form>
                            
                        </td>
                        <td>
                        <form action="/orders/delete" method="post" class="d-inline">
                                <input type="hidden" name="orderId" value="${order.id}">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <button type="submit" class="btn btn-outline-danger btn-sm mt-2">Удалить</button>
                            </form>
                        </td>
                    </tr>
                </#list>
            </tbody>
        </table>
    </main>
    <#include "components/footer.ftl">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
</body>
</html>