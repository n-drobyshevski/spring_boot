<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/login.css">
    <title>Заполнение формы</title>
</head>
<body>
<h1>Оформление получателя заказа</h1>
<div class="regist">

    <form action="/getForm" method="post">
        <div class="form-group ">
            <label for="name">Имя</label>
            <input type="text" class="form-control" required id="name" name="name">
        </div>
        <div class="form-group ">
            <label for="surname">Фамилия</label>
            <input type="text" class="form-control" required id="surname" name="surname">
        </div>
        <div class="form-group">
            <label for="phone_number">Номер телефона</label>
            <input type="text" class="form-control" id="phone_number" required name="phone_number">
        </div>
        <div class="form-group">
            <label for="adress">Адрес</label>
            <input type="text" class="form-control" id="adress" required name="adress">
        </div>
        <div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" name="name" style="width: 100%" class="btn btn-dark">Оформить получателя</button>

        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <a class="nav-link active" aria-current="page" href="/information">Информация о получении товара</a>
    </form>


    <div class="ss">
        <#if errorMessage??>
            <h2 style="color: black">${errorMessage}</h2>
        </#if>
    </div>
</div>
</body>
</html>