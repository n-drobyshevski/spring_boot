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
     <main class="d-grid gap-5 py-5 mx-auto" style="width: 900px;">
        <section class="text-center container">
            <div class="container marketing">
                <h4 class="mb-4">Compilations</h4>
                <div class="row justify-content-center">
                    <#list compilations as compilation>
                        <div class="col-md-4">
                            <div class="card mb-4 shadow-sm">
                                <#if compilation.previewImageID??>
                                    <img src="/images/${compilation.previewImageID}" class="card-img-top" alt="Cover Image">
                                <#else>
                                    <img src="im/12.jpg" class="card-img-top" alt="Default Cover Image">
                                </#if>
                                <div class="card-body">
                                    <h5 class="card-title">${compilation.name}</h5>
                                    <p class="card-text">${compilation.description}</p>
                                    <a href="/compilations/${compilation.id}" class="btn btn-primary">Подробнее</a>
                                </div>
                            </div>
                        </div>
                    </#list>
                </div>
            <#if role=="ROLE_ADMIN">
               <a href="/admin" class="btn btn-success mt-4">Добавить Подборку</a>
            </#if>

            </div>
        </section>
    </main>
</body>
</html>