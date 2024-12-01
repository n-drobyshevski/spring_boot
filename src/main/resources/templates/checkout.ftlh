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

<main class="d-grid gap-5 mt-5 py-5 mx-auto" style="width: 900px;">
   <h1>Оформление заказа</h1>
    <form action="/cart/buyCart" method="post" class="needs-validation" novalidate>
        <div class="mb-3">
            <label for="customerName" class="form-label">ФИО:</label>
            <input type="text" name="customerName" class="form-control" id="customerName" required>
            <div class="invalid-feedback">
                Пожалуйста, введите ваше ФИО.
            </div>
        </div>
        <div class="mb-3">
            <label for="address" class="form-label">Адрес:</label>
            <input type="text" name="address" class="form-control" id="address" required>
            <div class="invalid-feedback">
                Пожалуйста, введите ваш адрес.
            </div>
        </div>
        <div class="mb-3">
            <label for="paymentMethod" class="form-label">Способ оплаты:</label>
            <select name="paymentMethod" class="form-select" id="paymentMethod" required>
                <option value="">Выберите способ оплаты</option>
                <option value="cash">Наличные</option>
                <option value="card">Карта</option>
            </select>
            <div class="invalid-feedback">
                Пожалуйста, выберите способ оплаты.
            </div>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" name="email" class="form-control" id="email" required>
            <div class="invalid-feedback">
                Пожалуйста, введите ваш email.
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Подтвердить покупку</button>
        <a href="/cart" class="btn btn-secondary">Вернуться в корзину</a>

    </form>
    <h2>Ваши товары:</h2>
    <div class="row">
        <#list carts as cart>
            <div class="col-md-4">
                <div class="card mb-4">
                    <img src="${cart.image}" class="card-img-top" alt="${cart.nameproduct}" style="height: 150px; object-fit: cover;">
                    <div class="card-body">
                        <h5 class="card-title">${cart.nameproduct!''}</h5>
                        <p class="card-text">Количество: ${cart.quantity!''}</p>
                        <p class="card-text">Цена: ${cart.cost}</p>
                    </div>
                </div>
            </div>
        </#list>
    </div>
    
</main>
    
  <#include "components/footer.ftl">
  <script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
        'use strict'

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }

                    form.classList.add('was-validated')
                }, false)
            })
    })()
</script>
</body>
</html>
