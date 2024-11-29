<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Book Details</title>
</head>
<body>
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
 </body>
</html>
