<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

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
    <div class="container marketing"><br><br>
        <main>
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <form action="/AddItemToCart" method="post">
                <div class="col">
                    <div class="card shadow-sm">
                        <img src="флорист1.jpeg" alt="kjh"/>                <div class="card-body">
                            <p class="card-text">Флорист Елена</p>
                            <input type="hidden" name="nameproduct" value="Флорист Елена" readonly>
                            <p class="card-text">Цена: 55 р</p>
                            <input type="hidden" name="cost" value="55" readonly>
                            <input type="hidden" name="image" value="флорист1.jpg" />
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <input type="submit" class="btn btn-sm btn-outline-secondary" value="Добавить в корзину">
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </form>
                <form action="/AddItemToCart" method="post">
                <div class="col">
                    <div class="card shadow-sm">
                        <img src="флорист2.jpg" alt="kjh"/>                <div class="card-body">
                            <p class="card-text">Флорист Анна</p>
                            <input type="hidden" name="nameproduct" value="Флорист Анна" readonly>
                            <p class="card-text">Цена: 40 р</p>
                            <input type="hidden" name="cost" value="40" readonly>
                            <input type="hidden" name="image" value="флорист2.jpg" />
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <input type="submit" class="btn btn-sm btn-outline-secondary" value="Добавить в корзину">
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                </form>
                <form action="/AddItemToCart" method="post">
                    <div class="col">
                        <div class="card shadow-sm">
                            <img src="флорист3.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Флорист Татьяна</p>
                                <input type="hidden" name="nameproduct" value="Флорист Татьяна" readonly>
                                <p class="card-text">Цена: 45 р</p>
                                <input type="hidden" name="cost" value="45" readonly>
                                <input type="hidden" name="image" value="флорист3.jpg" />
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <input type="submit" class="btn btn-sm btn-outline-secondary" value="Добавить в корзину">
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <form action="/AddItemToCart" method="post">
                    <div class="col">
                        <div class="card shadow-sm">
                            <img src="флорист.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Флорист Виктория</p>
                                <input type="hidden" name="nameproduct" value="Флорист Виктория" readonly>
                                <p class="card-text">Цена: 25 р</p>
                                <input type="hidden" name="cost" value="25" readonly>
                                <input type="hidden" name="image" value="флорист.jpg" />
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <input type="submit" class="btn btn-sm btn-outline-secondary" value="Добавить в корзину">
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <form action="/AddItemToCart" method="post">
                <div class="col">
                    <div class="card shadow-sm">
                        <img src="флорист5.jpg" alt="kjh"/>                <div class="card-body">
                            <p class="card-text">Флорист Елизавета</p>
                            <input type="hidden" name="nameproduct" value="Флорист Елизавета" readonly>
                            <p class="card-text">Цена: 35 р</p>
                            <input type="hidden" name="cost" value="35" readonly>
                            <input type="hidden" name="image" value="флорист5.jpg" />
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <input type="submit" class="btn btn-sm btn-outline-secondary" value="Добавить в корзину">
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                </form>
                <form action="/AddItemToCart" method="post">
                    <div class="col">
                        <div class="card shadow-sm">
                            <img src="флорист6.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Флорист Мария</p>
                                <input type="hidden" name="nameproduct" value="Флорист Мария" readonly>
                                <p class="card-text">Цена: 30 р</p>
                                <input type="hidden" name="cost" value="30" readonly>
                                <input type="hidden" name="image" value="флорист6.jpg" />
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <input type="submit" class="btn btn-sm btn-outline-secondary" value="Добавить в корзину">
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </main>
    </div>
</section>