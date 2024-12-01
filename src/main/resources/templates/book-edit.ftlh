<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Редактировать книгу</title>
</head>
<body>
    <header>
        <#include "components/navbar.ftl">
    </header>
    <main class="container py-5">
        <h1 class="mb-4">Редактировать книгу</h1>
        <form action="/books/edit/${book.id}" method="post" enctype="multipart/form-data">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div class="mb-3">
                <label for="title" class="form-label">Название</label>
                <input type="text" class="form-control" id="title" name="title" value="${book.title}" required>
            </div>
            <div class="mb-3">
                <label for="author" class="form-label">Автор</label>
                <input type="text" class="form-control" id="author" name="author" value="${book.author}" required>
            </div>
            <div class="mb-3">
                <label for="genre" class="form-label">Жанр</label>
                <input type="text" class="form-control" id="genre" name="genre" value="${book.genre}" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Описание</label>
                <textarea class="form-control" id="description" name="description" required>${book.description}</textarea>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Цена</label>
                <input type="number" class="form-control" id="price" name="price" value="${book.price}" required>
            </div>
            <div class="mb-3">
                <label for="image" class="form-label">Загрузить обложку</label>
                <input type="file" class="form-control" id="image" name="file1">
            </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="btn btn-primary">Сохранить изменения</button>
        </form>
    </main>
    <#include "components/footer.ftl">
</body>
</html>