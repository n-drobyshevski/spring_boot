<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Оформление заказа</title>
</head>
<body>
<h1>Оформление заказа</h1>
<form action="/orders/create" method="post">
    <label for="customerName">ФИО:</label>
    <input type="text" id="customerName" name="customerName" required><br><br>

    <label for="address">Адрес:</label>
    <input type="text" id="address" name="address" required><br><br>

    <label for="paymentMethod">Способ оплаты:</label>
    <select id="paymentMethod" name="paymentMethod">
        <option value="card">Карта</option>
        <option value="cash">Наличные</option>
    </select><br><br>

    <button type="submit">Подтвердить заказ</button>
    <a class="navbar-brand" href="/orders/my">loh</a>
</form>
</body>
</html>
