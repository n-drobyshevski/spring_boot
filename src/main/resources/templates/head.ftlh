<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <title>Dead Poets Society</title>
  <link rel="stylesheet" href="/css/head.css">
</head>

<body>
  <!-- Include Navbar -->
  <header>
    <#include "components/navbar.ftl">
  </header>
  <div>
    <!-- Секция с цитатой и заголовком -->
    <div class="hero" style="background-image: url('im/100.jpg');">
      <div class="hero-overlay"></div>
      <h1 class="hero-title">Dead Poets Society</h1>
      <div class="hero-content">
        <p>"Тот, кто читает, проживает тысячу жизней, прежде чем умрет. <br>Тот, кто не читает, проживает лишь одну" <br><br>Джордж Р.Р. Мартин.</p>
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
        <#if books??>
          <#list books as book>
            <#if book?index < 20>
              <div class="card mb-4 flex-fill h-100 me-4 bg-blue rounded shadow-sm" style="max-width: 30%;">
                <img src="" class="card-img-top">
                <div class="card-body">
                  <h5 class="card-title">
                    ${book.title}
                  </h5>
                  <p class="card-text">
                    ${book.author}
                  </p>
                </div>
              </div>
            </#if>
          </#list>
        </#if>
      </div>
    </div>
  </div>
  <#include "components/footer.ftl">
</body>

</html>