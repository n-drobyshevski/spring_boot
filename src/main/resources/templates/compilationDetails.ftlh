<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Compilation Detail</title>
     <style>
      .cover-image {
            width: 100%;
            height: 300px; /* Adjust the height as needed */
            object-fit: cover; /* This will crop the image */
            object-position: top; /* This will ensure the bottom part is visible */
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <header>
        <#include "components/navbar.ftl">
    </header>
    <main class="d-grid gap-5 py-5 mx-auto" style="width: 900px;">
        <div class="w-100 d-flex justify-content-end">
            <#if role??>
            <#if role=="ROLE_ADMIN">
            <div class="d-flex">
                <a class="btn btn-secondary me-2" href="/compilations/edit/${compilation.id}" class="btn btn-warning">Edit</a>
                 <form action="/compilations/delete/${compilation.id}" method="post" style="display:inline;">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
                </div>
            </#if>
            </#if>
        </div>
        <section class="text-center container">
            <div class="container marketing">
                <#if compilation.previewImageID??>
                    <img src="/images/${compilation.previewImageID}" alt="Cover Image" class="cover-image">
                <#else>
                    <img src="/images/default-cover.jpg" alt="Default Cover Image" class="cover-image">
                </#if>
                <h4>${compilation.name}</h4>
                <p>${compilation.description}</p>
                <div class="container mt-5">
                    <h5>Книги в подборке:</h5>
                    <div class="row">
                        <#list books as book>
                            <div class="col-md-4 mb-4">
                                <div class="card h-100 shadow-sm">
                                    <a href="/books/${book.id}">
                                        <img src="/images/${book.previewImageID}" class="card-img-top" alt="${book.title}" style="height: 150px; object-fit: cover;">
                                    </a>
                                    <div class="card-body p-2">
                                        <h6 class="card-title mb-1">
                                            <a href="/books/${book.id}" class="text-decoration-none text-dark">${book.title}</a>
                                        </h6>
                                        <p class="card-text mb-1">${book.author}</p>
                                    </div>
                                </div>
                            </div>
                        </#list>
                    </div>
                </div>
            </div>
        </section>
    </main>
</body>
</html>