<div class="navbar">
  <div style="display: flex; align-items: center;">
    <a href="/head" style="background-color: transparent; margin-right: 0px;">
      <img src="im/99.jpg" alt="Логотип" class="navbar-logo"> <!-- Логотип слева -->
    </a>
    <a href="/books">Книги</a>
    <a href="/podborki">Подборки</a>
    <a href="/cart">Корзина</a>
  </div>
  <div>
    <input type="text" placeholder="Search">
  </div>
  <div>
    <#if role??>
      <#if role == "ROLE_USER">
        <a class="nav-link active" aria-current="page" href="/user/${userId}">Профиль</a>
      </#if>
      <#if role == "ROLE_ADMIN">
        <a class="nav-link" href="/admin">Профиль админа</a>
      </#if>
    <#else>
      <!-- Bootstrap Login Button if no role is detected -->
      <a class="nav-link" href="/login" >Login</a>
    </#if>
  </div>
</div>