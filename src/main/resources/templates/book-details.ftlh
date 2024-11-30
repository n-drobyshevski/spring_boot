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
<main class="px-5 pt-5">
 <h2 style="text-align: center">Информация о книге</h2>
 <hr>
 <div class="d-flex w-100 px-5">
     <img src="/images/${book.previewImageID}" alt="${book.title}">
    <div class="ms-5 d-flex flex-column flex-fill align-items-start" style="text-align: center">
        <div class="flex-fill">
          <h3>Title: ${book.title}</h3>
          <h4>Author: ${book.author}</h4>
          <h4>${book.genre}</h4>
          <p>${book.description}</p>
        </div>
        <div class="d-flex w-100 justify-content-between">
          <h3>${book.price}</h3>
          <form class="" action="/AddToCart" method="post">
            <div class="btn-group">
              <input type="hidden" name="_csrf" value="${_csrf.token}">
              <input type="submit" class="btn btn-sm btn-primary" value="Добавить в корзину">   
            </div>
          </form>
        <div>
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
