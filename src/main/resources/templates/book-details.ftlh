<!DOCTYPE html>
<html lang="ru">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <title>Dead Poets Society</title>
 <link rel="stylesheet" href="/css/books.css"> 
 <link rel="stylesheet" href="/css/base.css">

</head>

<body  class="h-100">
  <!-- Include Navbar -->
  <header>
    <#include "components/navbar.ftl">
  </header>
<main class="container py-5">
  <h2 class="text-center mb-4">Информация о книге</h2>
  <hr>
  <div class="row">
    <div class="col-md-4">
      <img src="/images/${book.previewImageID}" alt="${book.title}" class="img-fluid rounded shadow-sm">
    </div>
    <div class="col-md-8">
      <div class="card h-100 shadow-sm">
        <div class="card-body">
          <h3 class="card-title">Title: ${book.title}</h3>
          <h4 class="card-subtitle mb-2 text-muted">Author: ${book.author}</h4>
          <h5 class="card-subtitle mb-3 text-muted">${book.genre}</h5>
          <p class="card-text">${book.description}</p>
          <div class="d-flex justify-content-between align-items-center mt-4">
            <h3 class="text-primary">${book.price} бел.руб</h3>
            <form action="/AddToCart" method="post">
              <input type="hidden" name="_csrf" value="${_csrf.token}">
              <input type="hidden" name="nameproduct" value="${book.title}">
              <input type="hidden" name="cost" value="${book.price}">
              <input type="hidden" name="image" value="/images/${book.previewImageID}">
              <button type="submit" class="btn btn-primary">Добавить в корзину</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
 <#if errorMessage??>
     <h2 style="color: red">${errorMessage}</h2>
 </#if>
 <br>
</main>
 <hr>
 <footer>
  <#include "components/footer.ftl">
</footer>
</body>

</html>
