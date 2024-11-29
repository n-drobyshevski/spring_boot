<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Оформление заказа</title>
</head>
<body>
    <h1>Оформление заказа</h1>
    <form action="/user/placeOrder" method="post">
        <label>ФИО:</label>
        <input type="text" name="customerName" required /><br>
        <label>Адрес:</label>
        <input type="text" name="address" required /><br>
        <label>Способ оплаты:</label>
        <select name="paymentMethod">
            <option>Наличные</option>
            <option>Карта</option>
        </select><br>
        <label>Email:</label>
        <input type="email" name="email" required /><br>
        <input type="hidden" name="bookTitles" th:value="${bookTitles}" />
        <button type="submit">Подтвердить покупку</button>
    </form>
</body>
</html>
