<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

        /* Верхнее меню */
        .navbar {
            display: flex;
            height: 60px;
            justify-content: space-between;
            align-items: center;
            padding: 2px;
            background-color: #ffffff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .navbar-logo {
            width: 80px; /* Размер логотипа */
            height: 70px; /* Размер логотипа */
            margin-right: 0px; /* Отступ от логотипа */
        }
        .navbar a {
            text-decoration: none;
            color: black;
            font-size: 16px;
            margin-right: 20px;
            padding: 10px 15px; /* Отступы для кнопок */
            border: 1px solid transparent; /* Граница для кнопок */
            border-radius: 20px; /* Скругление углов */
            transition: background-color 0.3s, color 0.3s; /* Эффекты перехода */
        }

        .navbar a:hover {
            background-color: #B5A495; /* Цвет фона при наведении */
            color: white; /* Цвет текста при наведении */
        }
        .navbar input[type="text"] {
            padding: 5px;
            font-size: 16px;
            width: 400px;
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
<div class="navbar">
  <div style="display: flex; align-items: center;">
    <a href="loh3.html" style="background-color: transparent; margin-right: 0px;">
      <img src="im/99.jpg" alt="Логотип" class="navbar-logo"> <!-- Логотип слева -->
    </a>
    <a href="/books">Книги</a>
    <a href="/podborki">Подборки</a>
    <a href="/cart">Корзина</a>
  </div>
  <form action="/getBooks" method="get" >
                  Поиск по названию объявления: <input type="text" placeholder="Search" name="title" id="title"><br>
                  <input type="submit" value="Поиск"/>

              </form>
  <div>
    <a class="nav-link active" aria-current="page" href="/">Профиль </a>
    <a href="#">Профиль админа</a>
  </div>
</div>

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