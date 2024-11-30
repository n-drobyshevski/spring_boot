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
    
    
    /* Секция с цитатой и заголовком */
    .hero {
        position: relative;
        background-image: url('im/100.jpg');
        background-size: cover;
        background-position: center;
        height: 600px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        color: white;
        text-align: right;
    }
    .hero-overlay {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: rgba(0, 0, 0, 0.5);
    }
    .hero-title {
        position: relative;
        font-size: 50px;
        font-weight: bold;
        margin-bottom: 80px;
    }
    .hero-content {
        position: relative;
        max-width: 800px;
        border: 4px solid white;
        padding: 100px;
    }
    .hero p {
        font-size: 23px;
        margin: 0;
    }

    /* Секция с подборками книг */
    .collections {
        padding: 60px 20px; /* Увеличенный верхний отступ */
        max-width: 1200px;
        margin: 0 auto;
        display: grid;
        grid-template-columns: repeat(3, 1fr); /* Три колонки */
        gap: 20px;
    }
    .collection-item {
        text-align: center;
        border-radius: 10px;
        overflow: hidden;
        background-color: #ffffff;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        cursor: pointer; /* Курсор в виде руки для эффекта кнопки */
        transition: transform 0.2s, box-shadow 0.2s;
    }
    .collection-item:hover {
        transform: translateY(-5px); /* Поднимается при наведении */
        box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
    }
    .collection-item img {
        width: 100%;
        height: 300px; /* Фиксированная высота для единообразия */
        object-fit: cover; /* Обеспечивает обрезку изображения, чтобы оно заполнило заданную высоту */
    }
    .collection-item p {
        padding: 10px;
        font-size: 18px; /* Увеличенный размер шрифта */
        color: #333;
        font-weight: bold; /* Сделаем текст жирным для выделения */
        margin: 0;
    }

    /* Стиль подвала */
    .footer {
        background-color: #333;
        color: white;
        text-align: center;
        padding: 20px 0; /* Отступы сверху и снизу */
        position: relative;
        bottom: 0;
        width: 100%;
    }
    .footer p {
        margin: 0; /* Убираем отступы у параграфа */
    }
  </style>
</head>
<body>

<!-- Верхнее меню -->
<#include "navbar.ftl"> <!-- подключить Navbar -->


<!-- Секция с цитатой и заголовком -->
<div class="hero">
  <div class="hero-overlay"></div>
  <h1 class="hero-title">Dead Poets Society</h1>
  <div class="hero-content">
    <p>"Тот, кто читает, проживает тысячу жизней, прежде чем умрет. <br>Тот, кто не читает, проживает лишь одну"  <br><br>Джордж Р.Р. Мартин.</p>
  </div>
</div>

<!-- Секция с подборками книг -->
<div class="collections">
  <div class="collection-item">
    <a href="loh5.html" style=" text-decoration: none">
      <img src="im/12.jpg" alt="Топ 10 лучших книг">
      <p>Топ 10 лучших книг</p>
    </a>
  </div>
  <div class="collection-item">
    <img src="im/13.jpg" alt="20 книг, которые нужно прочитать до 30">
    <p>20 книг, которые нужно прочитать до 30</p>
  </div>
  <div class="collection-item">
    <img src="im/14.jpg" alt="Книги про отношения">
    <p>Книги про отношения</p>
  </div>
  <div class="collection-item">
    <img src="im/15.jpg" alt="Топ 10 лучших книг">
    <p>Топ 10 лучших книг</p>
  </div>
  <div class="collection-item">
    <img src="im/16.jpg" alt="20 книг, которые нужно прочитать до 30">
    <p>20 книг, которые нужно прочитать до 30</p>
  </div>
  <div class="collection-item">
    <img src="im/17.jpg" alt="Книги про отношения">
    <p>Книги про отношения</p>
  </div>
</div>

<!-- Секция со всеми книгами -->
<div class="" style="max-width:1200px;margin:0 auto;padding: 60px 20px;">
  <div class="d-flex flex-wrap w-100">
    <#list books as book>
      <#if book?index < 20>
        <div class="card mb-4 flex-fill h-100 me-4 bg-blue rounded shadow-sm" style="max-width: 30%;">
          <img src="" class="card-img-top">
          <div class="card-body">
            <h5 class="card-title">${book.title}</h5>
            <p class="card-text">${book.author}</p>
          </div>
        </div>
      </#if>
    </#list>
  </div>
</div>

<!-- Подвал сайта -->
<div class="footer">
  <p>&copy; 2024 Dead Poets Society. Все права защищены.</p>
</div>


<!-- скрипты бутстрапа -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>