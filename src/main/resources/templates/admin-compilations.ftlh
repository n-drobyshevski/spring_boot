<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
   <title>Manage Compilations</title>
</head>
<body>
    <header>
        <#include "components/navbar.ftl">
    </header>
     <main class="container py-5">
        <h1 class="mb-4">Управление подборками</h1>
        <div>
            <h2 class="mb-3">Создать новую подборку</h2>
            <form action="/admin/compilations/create" method="post" enctype="multipart/form-data">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <div class="mb-3">
                    <label for="compilationName" class="form-label">Название подборки</label>
                    <input type="text" class="form-control" id="compilationName" name="name" required>
                </div>
                <div class="mb-3">
                    <label for="compilationDescription" class="form-label">Описание подборки</label>
                    <textarea class="form-control" id="compilationDescription" name="description" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="compilationBooks" class="form-label">Выберите книги для подборки</label>
                    <select multiple class="form-control js-example-basic-multiple-limit" id="compilationBooks" name="bookIds">
                        <#list books as book>
                            <option value="${book.id}">${book.title}</option>
                        </#list>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="image" class="form-label">Загрузить обложку</label>
                    <input type="file" class="form-control" id="image" name="file1">
                </div>
                <button type="submit" class="btn btn-primary">Создать подборку</button>
            </form>
        </div>
        <div class="mt-5">
            <h2 class="mb-3">Все подборки</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                <th>Название подборки</th>
                <th>Описание подборки</th>
                <th>Детали</th>
                <th>Редактирование/Удаление</th>
                    </tr>
                </thead>
                <tbody>
                    <#list compilations as compilation>
                        <tr>
                            <td>${compilation.name}</td>
                            <td>${compilation.description}</td>
                            <td><a href="/compilations/${compilation.id}" class="btn btn-info">Details</a></td>
                            <td>
                                <a href="/compilations/edit/${compilation.id}" class="btn btn-warning">Edit</a>
                                <a href="/compilations/delete/${compilation.id}" class="btn btn-danger">Delete</a>
                            </td>
                        </tr>
                    </#list>
                </tbody>
            </table>
        </div>
    </main>

  <#include "components/footer.ftl">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
     <script>
        $(document).ready(function() {
            $('.js-example-basic-multiple-limit').select2({
                placeholder: "Выберите книги",
                allowClear: true,
                maximumSelectionLength: 10 // Limit the number of selections
            });
        });
    </script>
</body>

</html>