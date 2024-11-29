<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Управление заказами</title>
</head>
<body>
<h1>Управление заказами</h1>

<table border="1">
    <tr>
        <th>ID</th>
        <th>ФИО</th>
        <th>Адрес</th>
        <th>Способ оплаты</th>
        <th>Email</th>
        <th>Книги</th>
        <th>Статус</th>
        <th>Действия</th>
    </tr>

    <#list orders as order>
        <tr>
            <td>${order.id}</td>
            <td>${order.customerName}</td>
            <td>${order.address}</td>
            <td>${order.paymentMethod}</td>
            <td>${order.email}</td>
            <td>${order.bookTitles}</td>
            <td>${order.status}</td>
            <td>
                <form action="/orders/update-status" method="post" style="display:inline;">
                    <input type="hidden" name="orderId" value="${order.id}">
                    <select name="status">
                        <option value="В обработке" <#if order.status == "В обработке">selected</#if>>В обработке</option>
                        <option value="Подтвержден" <#if order.status == "Подтвержден">selected</#if>>Подтвержден</option>
                        <option value="Доставлен" <#if order.status == "Доставлен">selected</#if>>Доставлен</option>
                        <option value="Отменен" <#if order.status == "Отменен">selected</#if>>Отменен</option>
                    </select>
                    <button type="submit">Обновить статус</button>
                </form>
            </td>
        </tr>
    </#list>
</table>

</body>
</html>
