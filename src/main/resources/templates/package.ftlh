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
                            <img src="упаковка1.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Упаковка 1</p>
                                <input type="hidden" name="nameproduct" value="Упаковка 1" readonly>
                                <p class="card-text">Цена: 3 р</p>
                                <input type="hidden" name="cost" value="3" readonly>
                                <input type="hidden" name="image" value="упаковка1.jpg" />
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
                            <img src="упаковка2.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Упаковка 2</p>
                                <input type="hidden" name="nameproduct" value="Упаковка 2" readonly>
                                <p class="card-text">Цена: 2 р</p>
                                <input type="hidden" name="cost" value="2" readonly>
                                <input type="hidden" name="image" value="упаковка2.jpg" />
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
                            <img src="упаковка3.jpeg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Упаковка 3</p>
                                <input type="hidden" name="nameproduct" value="Упаковка 3" readonly>
                                <p class="card-text">Цена: 4 р</p>
                                <input type="hidden" name="cost" value="4" readonly>
                                <input type="hidden" name="image" value="упаковка3.jpeg" />
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
                            <img src="упаковка4.jpeg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Упаковка 4</p>
                                <input type="hidden" name="nameproduct" value="Упаковка 4" readonly>
                                <p class="card-text">Цена: 5 р</p>
                                <input type="hidden" name="cost" value="5" readonly>
                                <input type="hidden" name="image" value="упаковка4.jpeg" />
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
                            <img src="упаковка5.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Упаковка 5</p>
                                <input type="hidden" name="nameproduct" value="Упаковка 5" readonly>
                                <p class="card-text">Цена: 3 р</p>
                                <input type="hidden" name="cost" value="3" readonly>
                                <input type="hidden" name="image" value="упаковка5.jpg" />
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
                            <img src="упаковка6.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Упаковка 6</p>
                                <input type="hidden" name="nameproduct" value="Упаковка 6" readonly>
                                <p class="card-text">Цена: 8 р</p>
                                <input type="hidden" name="cost" value="8" readonly>
                                <input type="hidden" name="image" value="упаковка186.jpg" />
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
                            <img src="упаковка7.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Упаковка 7</p>
                                <input type="hidden" name="nameproduct" value="Упаковка 7" readonly>
                                <p class="card-text">Цена: 7 р</p>
                                <input type="hidden" name="cost" value="7" readonly>
                                <input type="hidden" name="image" value="упаковка7.jpg" />
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
                            <img src="упаковка8.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Упаковка 8</p>
                                <input type="hidden" name="nameproduct" value="Упаковка 8" readonly>
                                <p class="card-text">Цена: 5 р</p>
                                <input type="hidden" name="cost" value="5" readonly>
                                <input type="hidden" name="image" value="упаковка8.jpg" />
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
                            <img src="упаковка9.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Упаковка 9</p>
                                <input type="hidden" name="nameproduct" value="Упаковка 9" readonly>
                                <p class="card-text">Цена: 5 р</p>
                                <input type="hidden" name="cost" value="5" readonly>
                                <input type="hidden" name="image" value="упаковка9.jpg" />
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