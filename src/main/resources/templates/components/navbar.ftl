<navbar class="navbar d-flex navbar-expand-md shadow-sm bg-white px-2 align-items-center justify-content-between" style="height: fit-content;">
  <div style="display: flex; align-items: center;">
    <a href="/" class="navbar-brand" style="background-color: transparent; margin-right: 0px;">
      <img src="/static/im/99.jpg" alt="Логотип" class="navbar-logo" style=" width: 80px; height: 70px; margin-right: 0px;"> <!-- Логотип слева -->
    </a>
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link active" aria-current="page" href="/books">Книги</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/podborki">Подборки</a>
      </li>
      
      <#if role??> <!-- нет логина нет и корзины -->
        <li class="nav-item">
          <a class="nav-link" href="/cart">Корзина</a>
        </li>
      </#if>
    </ul>
  </div>
  <form class="d-flex w-50" role="search">
    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
  </form>
  <#-- В зависимости от аттрибута role рендерится один из дропдаунов -->
    <ul class="navbar-nav">
      <#if role??>
        <li class="nav-item dropdown">
        
          <#if role=="ROLE_USER">
            <a class="nav-link dropdown-toggle" href="/user/${userId}" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Профиль
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="/user/${userId}">Профиль</a></li>
              <li><a class="dropdown-item" href="/orders/my">Мои заказы</a></li>
              <li><a class="dropdown-item" href="/logout">Выйти</a></li>
            </ul>
          </#if>
          <#if role=="ROLE_ADMIN">
            <a class="nav-link dropdown-toggle" href="/admin" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Профиль админа
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="/admin">Профиль</a></li>
              <li><a class="dropdown-item" href="/orders/my">Мои заказы</a></li>
              <li><a class="dropdown-item" href="/logout">Выйти</a></li>
            </ul>
          </#if>
          <#else>
            <!-- Bootstrap Login Button if no role is detected -->
        <li class="nav-item me-4">
          <a class="nav-link" href="/login">Login</a>
      </#if>
      </li>
    </ul>
</navbar>