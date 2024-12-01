<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
  <title>Dead Poets Society</title>
  <link rel="stylesheet" href="/css/1.css">  
  <link rel="stylesheet" href="/css/base.css">
</head>

<body>
  <!-- Include Navbar -->
  <header>
    <#include "components/navbar.ftl">
  </header>
    <main class="container py-5">
        <h1 class="mb-4">Панель управления</h1>
       <div class="list-group">
            <a href="/admin/users" class="list-group-item list-group-item-action">Управление пользователями</a>
            <a href="/admin/compilations" class="list-group-item list-group-item-action">Управление подборками</a>
            <a href="/admin/orders" class="list-group-item list-group-item-action">Управление заказами</a>
            <a href="/admin/books" class="list-group-item list-group-item-action">Управление книгами</a>
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