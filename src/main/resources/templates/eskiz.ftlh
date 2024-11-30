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
                            <img src="эскиз1.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Эскиз 1</p>
                                <input type="hidden" name="nameproduct" value="Эскиз 1" readonly>
                                <p class="card-text">Цена: 10 р</p>
                                <input type="hidden" name="cost" value="10" readonly>
                                <input type="hidden" name="image" value="эскиз1.jpg" />
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
                            <img src="эскиз2.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Эскиз 2</p>
                                <input type="hidden" name="nameproduct" value="Эскиз 2" readonly>
                                <p class="card-text">Цена: 12 р</p>
                                <input type="hidden" name="cost" value="12" readonly>
                                <input type="hidden" name="image" value="эскиз2.jpg" />
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
                            <img src="эскиз3.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Эскиз 3</p>
                                <input type="hidden" name="nameproduct" value="Эскиз 3" readonly>
                                <p class="card-text">Цена: 20 р</p>
                                <input type="hidden" name="cost" value="20" readonly>
                                <input type="hidden" name="image" value="эскиз3.jpg" />
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
                            <img src="эскиз4.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Эскиз 4</p>
                                <input type="hidden" name="nameproduct" value="Эскиз 4" readonly>
                                <p class="card-text">Цена: 15 р</p>
                                <input type="hidden" name="cost" value="15" readonly>
                                <input type="hidden" name="image" value="эскиз4.jpg" />
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
                            <img src="эскиз5.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Эскиз 5</p>
                                <input type="hidden" name="nameproduct" value="Эскиз 5" readonly>
                                <p class="card-text">Цена: 14 р</p>
                                <input type="hidden" name="cost" value="14" readonly>
                                <input type="hidden" name="image" value="эскиз5.jpg" />
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
                            <img src="эскиз6.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Эскиз 6</p>
                                <input type="hidden" name="nameproduct" value="Эскиз 6" readonly>
                                <p class="card-text">Цена: 9 р</p>
                                <input type="hidden" name="cost" value="9" readonly>
                                <input type="hidden" name="image" value="эскиз6.jpg" />
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
                            <img src="эскиз7.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Эскиз 7</p>
                                <input type="hidden" name="nameproduct" value="Эскиз 7" readonly>
                                <p class="card-text">Цена: 13 р</p>
                                <input type="hidden" name="cost" value="13" readonly>
                                <input type="hidden" name="image" value="эскиз7.jpg" />
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
                            <img src="эскиз8.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Эскиз 8</p>
                                <input type="hidden" name="nameproduct" value="Эскиз 8" readonly>
                                <p class="card-text">Цена: 14 р</p>
                                <input type="hidden" name="cost" value="14" readonly>
                                <input type="hidden" name="image" value="эскиз8.jpg" />
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
                            <img src="эскиз9.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Эскиз 9</p>
                                <input type="hidden" name="nameproduct" value="Эскиз 9" readonly>
                                <p class="card-text">Цена: 25 р</p>
                                <input type="hidden" name="cost" value="25" readonly>
                                <input type="hidden" name="image" value="эскиз9.jpg" />
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