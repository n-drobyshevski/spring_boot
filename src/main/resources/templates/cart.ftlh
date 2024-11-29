<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/static/css/3.css">
<header data-bs-theme="dark">
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="/head">Главная страница</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/flowers">Готовые букеты</a>
                    </li>
                    <li class="nav-item">

                        <a class="nav-link active" aria-current="page" href="/someFlowers">Собрать букет</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/cart">Корзина </a>
                    </li>
                    <li class="nav-item1">
                        <a class="nav-link active" aria-current="page" href="/">Профиль </a>
                    </li>
                    <li class="nav-item1">
                        <a class="nav-link active" aria-current="page" href="/admin">Профиль админа </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header><br>
<section class="py-5 text-center container">
    <div class="row py-lg-5">
        <div class="col-lg-6 col-md-8 mx-auto">
            <h1 class="fw-light">FLOWERS SHOP</h1>
            <p class="lead text-body-secondary">Откройте мир цветов: бесконечные возможности для креативных и ярких букетов</p>
            <strong class="lead text-body-thirdly">Собери свой букет.</strong>
        </div>
    </div>
    <div class="container marketing"></div><br><br>
<html>
<head>
    <meta charset="UTF-8">
    <title>Корзина</title>
</head>
<body>
<h4>Список товаров, добавленных в корзину</h4><br>
<script>
    // Функция для подсчета суммы из всех элементов в корзине
    function calculateTotal() {
        let total = 0;
        <#list carts as cart>
        // Преобразование значения cost в число и добавление его к общей сумме
        total += Number("${cart.cost}");
        </#list>
        return total;
    }

    // Функция для обработки выбора способа оплаты
    function selectPaymentMethod(method) {
        // Ваш код обработки выбранного способа оплаты
        if (method === "cash") {
            console.log("Выбран способ оплаты наличными");
            askRecipient();
        } else if (method === "card") {
            console.log("Выбран способ оплаты по карте");
            askRecipient();
        }
    }

    // Функция для задания вопроса о получателе покупки
    function askRecipient() {

        const recipientButtons = document.createElement("div");
        recipientButtons.innerHTML = `
            <form action="/buyCart" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <#--<input type="hidden" name="id" value="${cart.id}"><br>-->
            <input type="submit" class="btn btn-sm btn-outline-secondary" value="Себе">
        </form>
       <button onclick="selectRecipient('other')"><a href="/form">Другой человек</a></button>
    `;
        // Rest of the code...

        document.getElementById("recipientContainer").appendChild(recipientButtons);
    }

    // Функция для выбора получателя заказа
    function selectRecipient(recipient) {
        if (recipient === "self") {
            console.log("Покупка будет отправлена вам");
        } else if (recipient === "other") {
            showRecipientForm();
        }
    }

</script>
<ul>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        <#list carts as cart>
            <li>
                <div class="col">
                    <div class="card shadow-sm">
                        <image class="bd-placeholder-img card-img-top" width="100%" height="225" src="${cart.image}" role="img" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em"></text>
                        </image>
                        <div class="card-body">
                            <p class="card-text">${cart.nameproduct}</p>
                            <strong>Цена товара:</strong> <span>${cart.cost}</span><br>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <form action="/cartDelete" method="post">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <input type="hidden" name="id" value="${cart.id}"><br>
                                        <input type="submit" class="btn btn-sm btn-outline-secondary" value="Удалить">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        </#list>
    </div>
</ul>
<!-- Вывод общей суммы -->
<p>Общая сумма: <span id="totalAmount"></span></p>

<!-- Контейнер для выбора получателя -->
<div id="recipientContainer"></div>

<!-- Выбор способа оплаты -->
<div>

    <button onclick="selectPaymentMethod('cash')">Наличные</button>
    <button onclick="selectPaymentMethod('card')">Карта</button>
    <div class="btn-group">
        <form action="/clearDelete" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
<#--            <input type="hidden" name="id" value="${cart.id}"><br>-->
            <input type="submit" class="btn btn-sm btn-outline-secondary" value="Очистить корзину">
        </form>
    </div>
</div>

<script>
    // Вызов функции для подсчета и вывода общей суммы
    document.getElementById("totalAmount").textContent = calculateTotal();
</script>
</body>
</html>
</section>