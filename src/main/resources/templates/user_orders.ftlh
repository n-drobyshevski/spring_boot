<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Мои заказы</title>
</head>
<body>
    <h1>Мои заказы</h1>
    <table>
        <thead>
            <tr>
                <th>Книги</th>
                <th>Дата</th>
                <th>Статус</th>
            </tr>
        </thead>
        <tbody>
            <tr th:each="order : ${orders}">
                <td th:text="${order.bookTitles}"></td>
                <td th:text="${order.orderTime}"></td>
                <td th:text="${order.status}"></td>
            </tr>
        </tbody>
    </table>
</body>
</html>
