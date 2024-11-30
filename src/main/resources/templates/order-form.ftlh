<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <title>Dead Poets Society</title>
  <link rel="stylesheet" href="/css/head.css">
</head>

<body>
  <!-- Include Navbar -->
  <header>
    <#include "components/navbar.ftl">
  </header>
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
  <#include "components/footer.ftl">
</body>

</html>
