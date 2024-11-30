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

<!-- Фильтры -->
<div class="filters">
    <button class="filter-btn">все</button>
    <button class="filter-btn">бизнес-книги</button>
    <button class="filter-btn">классическая литература</button>
    <button class="filter-btn">детективы</button>
    <button class="filter-btn">фэнтези</button>
    <button class="filter-btn">романы</button>
    <button class="filter-btn">ужасы</button>
</div>
<div class="container w-100 d-flex justify-content-end" >
<form class="mb-5" action="/getBooksByGenre"" method="get">
    <label for="genre">Фильтр по жанру:</label>
    <select name="genre" id="genre" onchange="this.form.submit()">
        <option value="">Все жанры</option>
        <option value="роман">Роман</option>
        <option value="детектив">Детектив</option>
        <option value="Ужасы">Ужасы</option>
        <option value="Biography">Biography</option>
    </select>
</form>
</div>
<div class="d-flex flex-wrap w-100" style="padding: 0 96px" >
    <#list books as book>
        <form class="flex-fill" action="/AddToCart" method="post" style="min-width:100px;max-width:25%">
        <div class="d-flex flex-wrap">
                    <div class="card mb-4 mw-20 flex-fill h-100 me-4 bg-blue rounded shadow-sm" style="">
                        <!-- Обёртываем изображение книги ссылкой -->
                        <a href="/books/${book.id}">
                            <img class="card-img-top" src="/images/${book.previewImageID}" alt="${book.title}">
                        </a>
                        <div class="card-body">
                            <!-- Обёртываем название книги ссылкой -->
                            <a href="/books/${book.id}" class="card-text" style="text-decoration: none; color: inherit;">
                                <p>${book.title}</p>
                            </a>
                            <input type="hidden" name="nameproduct" value="${book.title}" readonly>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <input type="submit" class="btn btn-sm btn-outline-secondary" value="Добавить в корзину">
                                </div>
                                <small class="text-body-secondary">Стоимость: ${book.price} бел.руб </small>
                                <input type="hidden" name="cost" value="${book.price}" readonly>
                                <input type="hidden" name="image" value="/images/${book.previewImageID}">
                            </div>
                        </div>
                    </div>
            </div>
        </form>
    </#list>
</div>


  <#include "components/footer.ftl">

</body>

</html>