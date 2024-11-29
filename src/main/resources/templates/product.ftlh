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
    <#list historys as history>
        <li>
            <div class="col">
                <div class="card shadow-sm">
                    <image class="bd-placeholder-img card-img-top" width="100%" height="225" src="${history.image}" role="img" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect>
                        <text x="50%" y="50%" fill="#eceeef" dy=".3em"></text>
                    </image>
                    <div class="card-body">
                        <p class="card-text">${history.nameproduct}</p>
                        <strong>Цена товара:</strong> <span>${history.cost}</span><br>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <form action="/cartDelete" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <input type="hidden" name="id" value="${history.id}"><br>
                                    <input type="submit" class="btn btn-sm btn-outline-secondary" value="Удалить">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </li>
    </#list>
    <div class="container marketing"><br><br>
    <#if user.email??>
        <h3>Имя пользователя: <i>${user.name}</i></h3>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Выйти"/>
        </form>
        <#if user.isAdmin()>
            <a href="/admin">Панель администратора</a>
        </#if>
    <#else>
        <a href="/login">Войти</a></h1>
    </#if>
<#--    <hr>-->
<#--        <ul>-->
<#--            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">-->
<#--                <#list carts as cart>-->
<#--                    <li>-->
<#--                        <div class="col">-->
<#--                            <div class="card shadow-sm">-->
<#--                                <image class="bd-placeholder-img card-img-top" width="100%" height="225" src="${cart.image}" role="img" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect>-->
<#--                                    <text x="50%" y="50%" fill="#eceeef" dy=".3em"></text>-->
<#--                                </image>-->
<#--                                <div class="card-body">-->
<#--                                    <p class="card-text">${cart.nameproduct}</p>-->
<#--                                    <strong>Цена товара:</strong> <span>${cart.cost}</span><br>-->
<#--                                    <div class="d-flex justify-content-between align-items-center">-->
<#--                                        <div class="btn-group">-->
<#--                                            <form action="/cartDelete" method="post">-->
<#--                                                <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--                                                <input type="hidden" name="id" value="${cart.id}"><br>-->
<#--                                                <input type="submit" class="btn btn-sm btn-outline-secondary" value="Удалить">-->
<#--                                            </form>-->
<#--                                        </div>-->
<#--                                    </div>-->
<#--                                </div>-->
<#--                            </div>-->
<#--                        </div>-->
<#--                    </li>-->
<#--                </#list>-->
<#--            </div>-->
<#--        </ul>-->


<#--  <#if carts??>-->
<#--   <#list cartss as cart>-->
<#--        <div>-->
<#--            <th>${cart.nameproduct}</th>-->
<#--            <th>${cart.cost}</th>-->
<#--        </div>-->
<#--   </#list>-->
<#-- <#else>-->
<#--  </#if>-->
<#--<h4>Цветы со всей Беларуси</h4>-->
<#--<form action= "/" method="get">-->
<#--    Поиск по названию объявления: <input type="text" name="title"><br>-->
<#--    <input type="submit" value="Поиск"/>-->
<#--</form>-->
<#--<#list products  as product>-->
<#--    <div>-->
<#--        <p><b>${product.title}</b> ${product.price} руб.|<a href="/product/${product.ID}">Подробнее...</a> </p>-->
<#--    </div>-->
<#--<#else>-->
<#--    <h3>Товаров нет</h3>-->
<#--</#list>-->
<#--<#if user.email??>-->
<#--<hr>-->
<#--<h3>Создать новый букет</h3>-->
<#--<form action="/product/create" method="post" enctype="multipart/form-data">-->
<#--    Название букета:<input type="text" name="title"/><br><br>-->
<#--    Описание букета:<input type="text" name="description"/><br><br>-->
<#--    Цена цветка:<input type="number" name="price"/><br><br>-->
<#--    Первая фотография:<input type="file" name="file1"/><br><br>-->
<#--    Вторая фотография:<input type="file" name="file2"/><br><br>-->
<#--    Третья фотография:<input type="file" name="file3"/><br><br>-->
<#--    <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--    <input type="submit" value="Добавить товар"/>-->

<#--</form>-->
<#--    </#if>-->
    </div>
</section>
</body>
</html>