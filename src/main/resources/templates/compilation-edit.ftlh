<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Edit Compilation</title>
</head>
<body>
    <header>
        <#include "components/navbar.ftl">
    </header>
    <main class="d-grid gap-5 py-5 mx-auto" style="width: 900px;">
        <section class="text-center container">
            <div class="container marketing">
                <h4>Edit Compilation</h4>
                <form action="/compilations/edit/${compilation.id}" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${compilation.id}">
                    <div class="mb-3">
                        <label for="compilationName" class="form-label">Name</label>
                        <input type="text" class="form-control" id="compilationName" name="name" value="${compilation.name}" required>
                    </div>
                    <div class="mb-3">
                        <label for="compilationDescription" class="form-label">Description</label>
                        <textarea class="form-control" id="compilationDescription" name="description" required>${compilation.description}</textarea>
                    </div>
                    <div class="d-flex align-items-end mb-5">
                     <#if compilation.previewImageID??>
                        <div class="mb-3 d-flex flex-column me-4">
                            <label for="previewImageID" class="form-label">Current Cover Image</label>
                            <img src="/images/${compilation.previewImageID}" alt="Cover Image" class="img-thumbnail mb-3" style="max-width: 200px;">
                        </div>
                    </#if>
                    <div class="mb-3 d-flex flex-column justify-content-start">
                        <label for="file1" class="form-label">Choose New Cover Image</label>
                        <input type="file" class="form-control" id="file1" name="file1">
                    </div>
                    </div>
                    
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
                <form action="/compilations/delete/${compilation.id}" method="post" style="display:inline;">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit" class="btn btn-danger mt-3">Delete</button>
                </form>
            </div>
        </section>
    </main>
</body>
</html>