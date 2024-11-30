<head>
    <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <title>Dead Poets Society</title>
    <style>
        /* Основной стиль страницы */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f4f0;
            color: #333;
        }

        

                /* Кнопки фильтров */
                .filters {
                    display: flex;
                    justify-content: center;
                    padding: 20px;
                    gap: 10px;
                    flex-wrap: wrap;
                }
                .filter-btn {
                    border: 1px solid black;
                    padding: 8px 16px;
                    border-radius: 20px;
                    background-color: #fff;
                    cursor: pointer;
                    font-size: 16px;
                }
                .filter-btn:hover {
                    background-color: #e0e0e0;
                }


                   .book-list {
                       display: flex;
                       flex-wrap: wrap;
                       gap: 50px;
                       justify-content: center;
                   }

                   .book-card {
                       width: 200px;
                       border: 1px solid #f0f0f0;
                       border-radius: 10px;
                       overflow: hidden;
                       text-align: center;
                       transition: transform 0.3s ease;
                   }

                   .book-card:hover {
                       transform: translateY(-5px);
                       box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
                       cursor: pointer;
                   }

                   .book-image {
                       width: 100%;
                       height: 300px;
                       object-fit: cover;
                       border-bottom: 1px solid #f0f0f0;
                   }

                   .book-info {
                       padding: 15px;
                   }

                   .book-title {
                       font-size: 18px;
                       font-weight: bold;
                       margin: 0;
                   }

                   .book-author {
                       font-size: 14px;
                       color: #666;
                   }

                   .book-price {
                       font-size: 16px;
                       font-weight: bold;
                       color: #333;
                       margin-top: 5px;
                   }

                   .add-to-cart-button {
                       background-color: black;
                       color: white;
                       padding: 10px;
                       border: none;
                       width: 100%;
                       font-size: 14px;
                       border-radius: 5px;
                       cursor: pointer;
                       margin-top: 10px;
                   }
    </style>
</head>
<body>


<!-- Верхнее меню -->
<#include "navbar.ftl"> <!-- подключить Navbar -->

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



<#list books as book>
    <form action="/AddToCart" method="post">
        <tr>
            <div class="col">
                <div class="card shadow-sm">
                    <!-- Обёртываем изображение книги ссылкой -->
                    <a href="/books/${book.id}">
                        <img src="/images/${book.previewImageID}" alt="${book.title}">
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
        </tr>
    </form>
</#list>


<form action="/getBooksByGenre"" method="get">
    <label for="genre">Фильтр по жанру:</label>
    <select name="genre" id="genre" onchange="this.form.submit()">
        <option value="">Все жанры</option>
        <option value="роман">Роман</option>
        <option value="детектив">Детектив</option>
        <option value="Ужасы">Ужасы</option>
        <option value="Biography">Biography</option>
    </select>
</form>