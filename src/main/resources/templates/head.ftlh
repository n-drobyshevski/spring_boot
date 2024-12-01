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
    <#if compilations??>
        <#list compilations as compilation>
            <#if compilation?index < 6>
                <div class="collection-item">
                    <a href="/compilations/${compilation.id}" style="text-decoration: none">
                        <div class="card h-100 shadow-sm">
                          <#if compilation.previewImageID??>
                              <img src="/images/${compilation.previewImageID}" class="card-img-top" alt="${compilation.name}">
                                  <#else>
                                      <img src="im/12.jpg" class="card-img-top" alt="Default Cover Image">
                                  </#if>
                            <div class="card-body p-2">
                                <p class="card-text">${compilation.name}</p>
                            </div>
                        </div>
                    </a>
                </div>
            </#if>
        </#list>
    </#if>
</div>
    <!-- Секция со всеми книгами -->
     <div class="" style="max-width:1200px;margin:0 auto;padding: 60px 20px;">
       <h2 class="mb-4">Our Books</h2>
      <div class="d-flex flex-wrap justify-content-between">
        <#if books??>
          <#list books as book>
            <#if book?index < 20>
              <a href="/books/${book.id}" class="d-flex flex-column mb-4 book-card text-body" style="flex: 0 0 calc(20% - 10px); margin-right: 10px; text-decoration: none;">
                <div class="card h-100 shadow-sm">
                  <img src="/images/${book.previewImageID}" class="card-img-top" alt="${book.title}" style="height: 150px; object-fit: cover;">
                  <div class="card-body p-2">
                    <h6 class="card-title mb-1">
                      ${book.title}
                    </h6>
                    <p class="card-text mb-1">
                      ${book.author}
                    </p>
                  </div>
                </div>
              </a>
            </#if>
          </#list>
        </#if>
      </div>
      <div class="text-center mt-4">
        <a href="/books" class="btn btn-primary">Все книги</a>
      </div>
    </div>
  <#include "components/footer.ftl">
</body>

</html>