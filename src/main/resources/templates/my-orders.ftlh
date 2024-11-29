<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Мои заказы</title>
</head>
<body>
<h1>Мои заказы</h1>
<table>
    <tr>
        <th>ID</th>
        <th>ФИО</th>
        <th>Адрес</th>
        <th>Способ оплаты</th>
        <th>Статус</th>
        <th>Книги</th>
    </tr>
    <#list orders as order>
        <tr>
            <td>${order.id}</td>
            <td>${order.customerName}</td>
            <td>${order.address}</td>
            <td>${order.paymentMethod}</td>
            <td>${order.status}</td>
            <td>${order.bookTitles}</td>
        </tr>
    </#list>
</table>
</body>
</html>
