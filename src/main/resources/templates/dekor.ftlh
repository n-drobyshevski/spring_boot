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
                            <img src="декор11.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Сухоцветы</p>
                                <input type="hidden" name="nameproduct" value="Сухоцветы" readonly>
                                <p class="card-text">Цена: 10 р</p>
                                <input type="hidden" name="cost" value="10" readonly>
                                <input type="hidden" name="image" value="декор11.jpg" />
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
                            <img src="декор2.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Веточки красные</p>
                                <input type="hidden" name="nameproduct" value="Веточки красные" readonly>
                                <p class="card-text">Цена: 12 р</p>
                                <input type="hidden" name="cost" value="12" readonly>
                                <input type="hidden" name="image" value="декор2.jpg" />
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
                            <img src="декор3.jpeg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Гипсофилы</p>
                                <input type="hidden" name="nameproduct" value="Гипсофилы" readonly>
                                <p class="card-text">Цена: 18 р</p>
                                <input type="hidden" name="cost" value="18" readonly>
                                <input type="hidden" name="image" value="декор3.jpg" />
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
                            <img src="декор4.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Сухоцветы(бежевые)</p>
                                <input type="hidden" name="nameproduct" value="Сухоцветы(бежевые)" readonly>
                                <p class="card-text">Цена: 15 р</p>
                                <input type="hidden" name="cost" value="15" readonly>
                                <input type="hidden" name="image" value="декор4.jpg" />
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
                            <img src="декор5.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Гипсофилы</p>
                                <input type="hidden" name="nameproduct" value="Гипсофилы" readonly>
                                <p class="card-text">Цена: 11 р</p>
                                <input type="hidden" name="cost" value="11" readonly>
                                <input type="hidden" name="image" value="декор5.jpg" />
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
                            <img src="декор6.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Сухоцветы(разные)</p>
                                <input type="hidden" name="nameproduct" value="Сухоцветы(разные)" readonly>
                                <p class="card-text">Цена: 16 р</p>
                                <input type="hidden" name="cost" value="16" readonly>
                                <input type="hidden" name="image" value="декор6.jpg" />
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
                            <img src="декор9.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Гипсофилы(сереневые)</p>
                                <input type="hidden" name="nameproduct" value="Гипсофилы(сереневые)" readonly>
                                <p class="card-text">Цена: 9 р</p>
                                <input type="hidden" name="cost" value="9" readonly>
                                <input type="hidden" name="image" value="декор9.jpg" />
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
                            <img src="декор8.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Сухоцветы 6</p>
                                <input type="hidden" name="nameproduct" value="Сухоцветы 6" readonly>
                                <p class="card-text">Цена: 10 р</p>
                                <input type="hidden" name="cost" value="10" readonly>
                                <input type="hidden" name="image" value="декор8.jpg" />
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
                            <img src="декор1.jpg" alt="kjh"/>                <div class="card-body">
                                <p class="card-text">Декор в виде сердечка</p>
                                <input type="hidden" name="nameproduct" value="Декор в виде сердечка" readonly>
                                <p class="card-text">Цена: 5 р</p>
                                <input type="hidden" name="cost" value="5" readonly>
                                <input type="hidden" name="image" value="декор1.jpg" />
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