<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <title>Dead Poets Society</title>
  <link rel="stylesheet" href="/css/1.css">  
  <link rel="stylesheet" href="/css/base.css">
</head>

<body>
  <!-- Include Navbar -->
  <header>
    <#include "components/navbar.ftl">
  </header>
  <main class="d-grid gap-5 mt-5 py-5 mx-auto" style="width: 900px;">
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

  </main>
  <#include "components/footer.ftl">
</body>

</html>