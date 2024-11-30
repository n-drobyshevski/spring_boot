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

 <h2 style="text-align: center">Информация о книге</h2>
 <hr>
 <div style="text-align: center">
     <img src="/images/${book.previewImageID}" alt="${book.title}">
     <h3>${book.title}</h3>
     <h3>${book.author}</h3>
     <h3>${book.description}</h3>
     <h3>${book.genre}</h3>
     <h3>${book.price}</h3>
 </div>
 <#if errorMessage??>
     <h2 style="color: red">${errorMessage}</h2>
 </#if>
 <br>
 <hr>
  <#include "components/footer.ftl">

</body>

</html>
