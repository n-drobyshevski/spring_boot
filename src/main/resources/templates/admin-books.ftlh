<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <title>Управление книгами</title>
</head>
<body>
  <header>
    <#include "components/navbar.ftl">
  </header>
  <main class="container py-5">
    <div class="mb-4">
      <a href="/admin" class="btn btn-outline-secondary">Назад к панели управления</a>
    </div>
    <h1 class="mb-4">Управление книгами</h1>
    <div>
      <h2 class="mb-3">Добавить новую книгу</h2>
      <form action="/books/create" method="post" enctype="multipart/form-data">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="mb-3">
          <label for="bookTitle" class="form-label">Название книги</label>
          <input type="text" class="form-control" id="bookTitle" name="title" required>
        </div>
        <div class="mb-3">
          <label for="bookAuthor" class="form-label">Автор</label>
          <input type="text" class="form-control" id="bookAuthor" name="author" required>
        </div>
        <div class="mb-3">
          <label for="bookGenre" class="form-label">Жанр</label>
          <input type="text" class="form-control" id="bookGenre" name="genre" required>
        </div>
        <div class="mb-3">
          <label for="bookDescription" class="form-label">Описание</label>
          <textarea class="form-control" id="bookDescription" name="description" required></textarea>
        </div>
        <div class="mb-3">
          <label for="bookPrice" class="form-label">Цена</label>
          <input type="number" class="form-control" id="bookPrice" name="price" required>
        </div>
        <div class="mb-3">
          <label for="bookImage" class="form-label">Загрузить изображение обложки</label>
          <input type="file" class="form-control" id="bookImage" name="file1">
        </div>
        <button type="submit" class="btn btn-primary">Добавить книгу</button>
      </form>
    </div>
    <div class="mt-5">
      <h2 class="mb-3">Все книги</h2>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>Название</th>
            <th>Автор</th>
            <th>Жанр</th>
            <th>Цена</th>
            <th>Действия</th>
          </tr>
        </thead>
        <tbody>
          <#list books as book>
            <tr>
              <td>${book.title}</td>
              <td>${book.author}</td>
              <td>${book.genre}</td>
              <td>${book.price}</td>
              <td>
                <a href="/books/edit/${book.id}" class="btn btn-warning btn-sm">Редактировать</a>
                <a href="/books/delete/${book.id}" class="btn btn-danger btn-sm">Удалить</a>
              </td>
            </tr>
          </#list>
        </tbody>
      </table>
    </div>
  </main>
  <#include "components/footer.ftl">
</body>
</html>