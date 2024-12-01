<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <title>Мои заказы</title>
  <link rel="stylesheet" href="/css/1.css">  
  <link rel="stylesheet" href="/css/base.css">
</head>
<body>
  <!-- Include Navbar -->
  <header>
    <#include "components/navbar.ftl">
  </header>
  <main class="container py-5">
    <h1 class="mb-4">Мои заказы</h1>
    <table class="table table-bordered table-hover">
      <thead class="table-light">
        <tr>
          <th>ID</th>
          <th>ФИО</th>
          <th>Адрес</th>
          <th>Способ оплаты</th>
          <th>Статус</th>
          <th>Книги</th>
        </tr>
      </thead>
      <tbody>
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
      </tbody>
    </table>
  </main>
  <#include "components/footer.ftl">
</body>
</html>