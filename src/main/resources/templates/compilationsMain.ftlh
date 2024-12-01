<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Compilations</title>
</head>
<body>
    <header>
        <#include "components/navbar.ftl">
    </header>
    <section class="py-5 text-center container">
        <div class="container marketing">
            <h4>Compilations</h4>
            <#list compilations as compilation>
                <div class="compilation-item">
                    <h5>${compilation.name}</h5>
                    <p>${compilation.description}</p>
                    <ul>
                        <#list compilation.books as book>
                            <li>${book.title} by ${book.author}</li>
                        </#list>
                    </ul>
                </div>
            </#list>
        </div>
    </section>
</body>
</html>