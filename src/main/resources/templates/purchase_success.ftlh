<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <title>Dead Poets Society</title>
  <link rel="stylesheet" href="/css/base.css">
  <link rel="stylesheet" href="/css/head.css">
</head>

<body class="h-100">
  <!-- Include Navbar -->
  <header>
    <#include "components/navbar.ftl">
  </header>
  <div class="d-flex flex-column justify-content-center align-items-center h-100  w-100">
    <h1>Thank you for your purchase!</h1>
    <p>Your order has been successfully processed.</p>
    <a href="/books">Continue Shopping</a>
<div>
  <#include "components/footer.ftl">
</body>

</html>