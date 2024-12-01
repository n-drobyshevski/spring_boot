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
    <div class="container mt-4">
    <div class="row">
        <#list books as book>
            <div class="col-md-3 mb-4">
                <div class="card h-100 shadow-sm">
                    <!-- Обёртываем изображение книги ссылкой -->
                    <a href="/books/${book.id}">
                        <img class="card-img-top" src="/images/${book.previewImageID}" alt="${book.title}">
                    </a>
                    <div class="card-body d-flex flex-column">
                        <!-- Обёртываем название книги ссылкой -->
                        <a href="/books/${book.id}" class="card-title h5 text-decoration-none text-dark">
                            ${book.title}
                        </a>
                        <p class="card-text mt-auto">Стоимость: ${book.price} бел.руб</p>
                        <form action="/AddToCart" onsubmit="return validateAndFormatCost()" method="post">
                            <input type="hidden" name="nameproduct" value="${book.title}" readonly>
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <input type="hidden" name="cost" value="${book.price!''}" readonly>
                            <input type="hidden" name="image" value="/images/${book.previewImageID}">
                            <button type="submit" class="btn btn-outline-primary btn-block mt-3">Добавить в корзину</button>
                        </form>
                    </div>
                </div>
            </div>
        </#list>
    </div>
</div>

</div>



   <script>
    function validateAndFormatCost() {
        var costInput = document.getElementById('cost');
        var costValue = costInput.value.replace(/,/g, ''); // Remove commas
        if (isNaN(costValue)) {
            alert('Invalid cost value');
            return false;
        }
        costInput.value = parseFloat(costValue).toFixed(2); // Format as a number with two decimal places
        return true;
    }
</script>

  <#include "components/footer.ftl">

</body>

</html>