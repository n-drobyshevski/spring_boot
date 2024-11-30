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
                <img src="ваза1.jpg" alt="kjh"/>
                <div class="card-body">
                    <p class="card-text">Ваза для гербариев и цветов</p>
                    <p class="card-text">Цена: 50 р</p>
                    <input type="hidden" name="nameproduct" value="Ваза декоративная" readonly>
                    <input type="hidden" name="cost" value="50" readonly>
                    <input type="hidden" name="image" value="ваза1.jpg" />
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
                    <img src="ваза2.jpg" alt="kjh"/>
                    <div class="card-body">
                        <p class="card-text">Ваза стеклянная, высота вазы = 30 см</p>
                        <p class="card-text">Цена: 30 р</p>
                        <input type="hidden" name="nameproduct" value="Ваза стеклянная" readonly>
                        <input type="hidden" name="cost" value="30" readonly>
                        <input type="hidden" name="image" value="ваза2.jpg" />
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
                    <img src="ваза3.jpg" alt="kjh"/>
                    <div class="card-body">
                        <p class="card-text">Ваза стеклянная, высота вазы = 40 см</p>
                        <p class="card-text">Цена: 45 р</p>
                        <input type="hidden" name="nameproduct" value="Ваза стеклянная1" readonly>
                        <input type="hidden" name="cost" value="45" readonly>
                        <input type="hidden" name="image" value="ваза3.jpg" />
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
                    <img src="ваза4.jpg" alt="kjh"/>
                    <div class="card-body">
                        <p class="card-text">Ваза стеклянная, высота вазы = 55 см</p>
                        <p class="card-text">Цена: 55 р</p>
                        <input type="hidden" name="nameproduct" value="Ваза стеклянная2" readonly>
                        <input type="hidden" name="cost" value="55" readonly>
                        <input type="hidden" name="image" value="ваза4.jpg" />
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
                    <img src="ваза5.jpg" alt="kjh"/>
                    <div class="card-body">
                        <p class="card-text">Ваза стеклянная, высота вазы = 35 см</p>
                        <p class="card-text">Цена: 45 р</p>
                        <input type="hidden" name="nameproduct" value="Ваза стеклянная3" readonly>
                        <input type="hidden" name="cost" value="45" readonly>
                        <input type="hidden" name="image" value="ваза5.jpg" />
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
                    <img src="ваза6.jpg" alt="kjh"/>
                    <div class="card-body">
                        <p class="card-text">Ваза стеклянная, высота вазы = 36 см</p>
                        <p class="card-text">Цена: 80 р</p>
                        <input type="hidden" name="nameproduct" value="Ваза стеклянная4" readonly>
                        <input type="hidden" name="cost" value="80" readonly>
                        <input type="hidden" name="image" value="ваза6.jpg" />
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
                    <img src="ваза9.jpg" alt="kjh"/>
                    <div class="card-body">
                        <p class="card-text">Ваза стеклянная, высота вазы = 36 см</p>
                        <p class="card-text">Цена: 70 р</p>
                        <input type="hidden" name="nameproduct" value="Ваза стеклянная5" readonly>
                        <input type="hidden" name="cost" value="70" readonly>
                        <input type="hidden" name="image" value="ваза9.jpg" />
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
                    <img src="ваза7.jpeg" alt="kjh"/>
                    <div class="card-body">
                        <p class="card-text">Ваза стеклянная, высота вазы = 36 см</p>
                        <p class="card-text">Цена: 50 р</p>
                        <input type="hidden" name="nameproduct" value="Ваза стеклянная6" readonly>
                        <input type="hidden" name="cost" value="70" readonly>
                        <input type="hidden" name="image" value="ваза7.jpeg" />
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
                    <img src="ваза8.jpg" alt="kjh"/>
                    <div class="card-body">
                        <p class="card-text">Ваза стеклянная, высота вазы = 36 см</p>
                        <p class="card-text">Цена: 40 р</p>
                        <input type="hidden" name="nameproduct" value="Ваза стеклянная7" readonly>
                        <input type="hidden" name="cost" value="40" readonly>
                        <input type="hidden" name="image" value="ваза8.jpg" />
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
