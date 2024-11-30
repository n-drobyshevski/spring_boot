<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      xmlns="http://www.w3.org/1999/html">

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
            <p class="lead text-body-secondary">Выберите уже готовый букет, созданный профессионалами и сэкономить время и насладиться красотой сразу..</p>
            <strong class="lead text-body-thirdly">Готовые букеты.</strong>
        </div>
    </div>
</section>
<div>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

        <div style="text-align: right; margin-right: 50px;">

        <form action="/getFlowers" method="get">
                Поиск по названию объявления: <input type="text" name="title" style="width: 300px;"><br>
                <input type="submit" value="Поиск"/>
            </form>
        </div>
    </div>
</div>
<div class="album py-5 bg-body-tertiary">
    <div class="container">
<#--        <form>-->
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

<#--            <form action="/AddToCart" method="post">-->
<#--                <div class="col">-->
<#--                    <div class="card shadow-sm">-->
<#--                        <img src="карликовые розы.jpg" alt="kjh"/>-->
<#--                        <div class="card-body">-->
<#--                            <p class="card-text">Букет карликовых роз</p>-->
<#--                            <input type="hidden" name="nameproduct" value="Букет карликовых роз" readonly>-->
<#--                            <div class="d-flex justify-content-between align-items-center">-->
<#--                                <div class="btn-group">-->
<#--                                    <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--                                    <input type="submit" class="btn btn-sm btn-outline-secondary" value="Добавить в корзину">-->
<#--                                </div>-->
<#--                                <small class="text-body-secondary">Стоимость:90 бел.руб </small>-->
<#--                                <input type="hidden" name="cost" value="90" readonly>-->
<#--                                <input type="hidden" name="image" value="карликовые розы.jpg" />-->
<#--                            </div>-->
<#--                        </div>-->
<#--                    </div>-->
<#--                </div>-->
<#--            </form>-->

<#--            <form action="/AddToCart" method="post">-->
<#--            <div class="col">-->
<#--                <div class="card shadow-sm">-->
<#--                    <img src="пионы1.jpg" alt="kjh"/>-->
<#--                    <div class="card-body">-->
<#--                        <p class="card-text">Букет пион</p>-->
<#--                        <input type="hidden" name="nameproduct" value="Букет пион" readonly>-->
<#--                        <div class="d-flex justify-content-between align-items-center">-->
<#--                            <div class="btn-group">-->
<#--                                <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--                                <input type="submit" class="btn btn-sm btn-outline-secondary" value="Добавить в корзину">-->
<#--                            </div>-->
<#--                            <small class="text-body-secondary">Стоимость:180 бел.руб </small>-->
<#--                            <input type="hidden" name="cost" value="180" readonly>-->
<#--                            <input type="hidden" name="image" value="пионы1.jpg" />-->
<#--                        </div>-->
<#--                    </div>-->
<#--                </div>-->
<#--            </div>-->
<#--            </form>-->

<#--            <form action="/AddToCart" method="post">-->
<#--                <div class="col">-->
<#--                    <div class="card shadow-sm">-->
<#--                        <img src="хризантемы.jpg" alt="kjh"/>-->
<#--                        <div class="card-body">-->
<#--                            <p class="card-text">Букет хризантем</p>-->
<#--                            <input type="hidden" name="nameproduct" value="Букет хризантем" readonly>-->
<#--                            <div class="d-flex justify-content-between align-items-center">-->
<#--                                <div class="btn-group">-->
<#--                                    <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--                                    <input type="submit" class="btn btn-sm btn-outline-secondary" value="Добавить в корзину">-->
<#--                                </div>-->
<#--                                <small class="text-body-secondary">Стоимость:90 бел.руб </small>-->
<#--                                <input type="hidden" name="cost" value="90" readonly>-->
<#--                                <input type="hidden" name="image" value="хризантемы.jpg" />-->
<#--                            </div>-->
<#--                        </div>-->
<#--                    </div>-->
<#--                </div>-->
<#--            </form>-->

<#--            <form action="/AddToCart" method="post">-->
<#--                <div class="col">-->
<#--                    <div class="card shadow-sm">-->
<#--                        <img src="белые розы1.jpg" alt="kjh"/>-->
<#--                        <div class="card-body">-->
<#--                            <p class="card-text">Букет белых роз</p>-->
<#--                            <input type="hidden" name="nameproduct" value="Букет белых роз" readonly>-->
<#--                            <div class="d-flex justify-content-between align-items-center">-->
<#--                                <div class="btn-group">-->
<#--                                    <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--                                    <input type="submit" class="btn btn-sm btn-outline-secondary" value="Добавить в корзину">-->
<#--                                </div>-->
<#--                                <small class="text-body-secondary">Стоимость:130 бел.руб </small>-->
<#--                                <input type="hidden" name="cost" value="130" readonly>-->
<#--                                <input type="hidden" name="image" value="белые розы1.jpg" />-->
<#--                            </div>-->
<#--                        </div>-->
<#--                    </div>-->
<#--                </div>-->
<#--            </form>-->

<#--            <form action="/AddToCart" method="post">-->
<#--                <div class="col">-->
<#--                    <div class="card shadow-sm">-->
<#--                        <img src="ромашки.jpg" alt="kjh"/>-->
<#--                        <div class="card-body">-->
<#--                            <p class="card-text">Букет ромашек</p>-->
<#--                            <input type="hidden" name="nameproduct" value="Букет ромашек" readonly>-->
<#--                            <div class="d-flex justify-content-between align-items-center">-->
<#--                                <div class="btn-group">-->
<#--                                    <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--                                    <input type="submit" class="btn btn-sm btn-outline-secondary" value="Добавить в корзину">-->
<#--                                </div>-->
<#--                                <small class="text-body-secondary">Стоимость:50 бел.руб </small>-->
<#--                                <input type="hidden" name="cost" value="50" readonly>-->
<#--                                <input type="hidden" name="image" value="ромашки.jpg" />-->
<#--                            </div>-->
<#--                        </div>-->
<#--                    </div>-->
<#--                </div>-->
<#--            </form>-->

<#--            <form action="/AddToCart" method="post">-->
<#--                <div class="col">-->
<#--                    <div class="card shadow-sm">-->
<#--                        <img src="лилии.jpg" alt="kjh"/>-->
<#--                        <div class="card-body">-->
<#--                            <p class="card-text">Букет лилий</p>-->
<#--                            <input type="hidden" name="nameproduct" value="Букет лилий" readonly>-->
<#--                            <div class="d-flex justify-content-between align-items-center">-->
<#--                                <div class="btn-group">-->
<#--                                    <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--                                    <input type="submit" class="btn btn-sm btn-outline-secondary" value="Добавить в корзину">-->
<#--                                </div>-->
<#--                                <small class="text-body-secondary">Стоимость:100 бел.руб </small>-->
<#--                                <input type="hidden" name="cost" value="100" readonly>-->
<#--                                <input type="hidden" name="image" value="лилии.jpg" />-->
<#--                            </div>-->
<#--                        </div>-->
<#--                    </div>-->
<#--                </div>-->
<#--            </form>-->

            <#list flowers as flower>
                <form action="/AddToCart" method="post">
                    <tr>
                        <div class="col">
                            <div class="card shadow-sm">
                                <img src="/images/${flower.previewImageID}">
                                <div class="card-body">
                                    <p class="card-text">${flower.title}</p>
                                    <input type="hidden" name="nameproduct" value="${flower.title}" readonly>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                                            <input type="submit" class="btn btn-sm btn-outline-secondary" value="Добавить в корзину">
                                        </div>
                                        <small class="text-body-secondary">Стоимость: ${flower.price} бел.руб </small>
                                        <input type="hidden" name="cost" value="${flower.price}" readonly>
                                        <input type="hidden" name="image" value="/images/${flower.previewImageID}" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </tr>
                </form>
             </#list>
        </div>
    </div>
</div>
