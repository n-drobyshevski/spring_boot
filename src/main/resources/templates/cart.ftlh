<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <title>Dead Poets Society</title>
    <link rel="stylesheet" href="/css/base.css">
</head>

<body>
    <header>
        <#include "components/navbar.ftl">
    </header>
    <br>
    <section class="py-5 text-center container">
        <div class="container marketing"></div><br><br>
        <h4>Список товаров, добавленных в корзину</h4><br>


       

        <script>
        // Функция для подсчета суммы из всех элементов в корзине
        function calculateTotal() {
            let total = 0; 
            <#list carts as cart >
                // Преобразование значения cost в число и добавление его к общей сумме
                total += Number("${cart.cost}"); 
            </#list>
            return total;
        }
        // Функция для обработки выбора способа оплаты
        function selectPaymentMethod(method) {
            // Ваш код обработки выбранного способа оплаты
            if (method === "cash") {
                console.log("Выбран способ оплаты наличными");
                askRecipient();
            } else if (method === "card") {
                console.log("Выбран способ оплаты по карте");
                askRecipient();
            }
        }
        // Функция для задания вопроса о получателе покупки
        function askRecipient() {
            const recipientButtons = document.createElement("div");
            recipientButtons.innerHTML = `
                <form action="/buyCart" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <#--<input type="hidden" name="id" value="${cart.id}"><br>-->
                <input type="submit" class="btn btn-sm btn-outline-secondary" value="Себе">
            </form>
        <button onclick="selectRecipient('other')"><a href="/form">Другой человек</a></button>
        `;
            // Rest of the code...
            document.getElementById("recipientContainer").appendChild(recipientButtons);
        }
        // Функция для выбора получателя заказа
        function selectRecipient(recipient) {
            if (recipient === "self") {
                console.log("Покупка будет отправлена вам");
            } else if (recipient === "other") {
                showRecipientForm();
            }
        }
        </script>
        <ul>
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <#list carts as cart>
                    <li>
                        <div class="col">
                            <div class="card shadow-sm">
                                <image class="bd-placeholder-img card-img-top" width="100%" height="225" src="${cart.image!''}" role="img" preserveAspectRatio="xMidYMid slice" focusable="false">
                                    <title>Placeholder</title>
                                    <rect width="100%" height="100%" fill="#55595c"></rect>
                                    <text x="50%" y="50%" fill="#eceeef" dy=".3em"></text>
                                </image>
                                <div class="card-body">
                                    <p class="card-text">
                                        <#if cart.nameproduct?? && cart.nameproduct?has_content>
                                            ${cart.nameproduct}
                                        <#else>
                                            Book ID: ${cart.id}
                                        </#if>
                                    </p>
                                    <strong>Цена товара:</strong> <span>
                                        ${cart.cost!''}
                                    </span><br>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <form action="/cartDelete" method="post">
                                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                <input type="hidden" name="id" value="${cart.id}"><br>
                                                <input type="submit" class="btn btn-sm btn-outline-danger" value="Удалить">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </#list>
            </div>
        </ul>
        <!-- Вывод общей суммы -->
        <p>Общая сумма: <span id="totalAmount"></span></p>
        <!-- Контейнер для выбора получателя -->
        <div id="recipientContainer"></div>

        
        <#if carts??>
            <!-- Выбор способа оплаты -->
            <div class="d-flex w-100 justify-content-end align-items-center">

                    <button class="btn btn-primary" onclick="window.location.href='/checkout'">Оплатить</button>
                    <form action="/clearDelete" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <#-- <input type="hidden" name="id" value="${cart.id}"><br>-->
                            <input type="submit" class="btn btn-outline-danger" value="Очистить корзину">
                    </form>
            </div>
        </#if>
        <script>
        // Вызов функции для подсчета и вывода общей суммы
        document.getElementById("totalAmount").textContent = calculateTotal();
        </script>
</body>

</html>