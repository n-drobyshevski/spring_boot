<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Compilation Detail</title>
</head>
<body>
    <header>
        <#include "components/navbar.ftl">
    </header>
    <main class="d-grid gap-5 py-5 mx-auto" style="width: 900px;">
           <div class="w-100 d-flex justify-content-end">
                <#if role=="ROLE_ADMIN">
                    <a href="/admin/compilations/edit/${compilation.id}" class="btn btn-warning">Edit</a>
                </#if>
            </div>
    <section class="text-center container">
        <div class="container marketing">
            <h4>${compilation.name}</h4>
            <p>${compilation.description}</p>
            <ul>
                
            </ul>
        </div>
    </section>
    </main>
</body>
</html>