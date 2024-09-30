<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Image Upload</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2>Image Upload</h2>
    <form id="uploadForm" method="post" action="/images/upload" enctype="multipart/form-data">
        <div class="form-group">
            <label for="file">Select Image:</label>
            <input type="file" class="form-control" id="file" name="file" required>
        </div>
        <div class="form-group">
            <label for="image_type">Image Type:</label>
            <select class="form-control" id="image_type" name="image_type" required>
                <option value="BOARD">Board</option>
                <option value="POPUP">Popup</option>
                <option value="COMMENT">Comment</option>
            </select>
        </div>
        <div class="form-group">
            <label for="associated_idx">Associated IDX:</label>
            <input type="text" class="form-control" id="associated_idx" name="associated_idx" placeholder="Enter associated ID" required>
        </div>
        <button type="submit" class="btn btn-primary">Upload</button>
    </form>
    <div id="response" class="mt-3"></div>
</div>

<script>
    document.getElementById("uploadForm").onsubmit = function(event) {
        event.preventDefault(); // 기본 제출 방지
        var formData = new FormData(this);

        fetch('/images/upload', {
            method: 'POST',
            body: formData
        })
        .then(response => response.text())
        .then(data => {
            document.getElementById("response").innerText = data;
        })
        .catch(error => {
            document.getElementById("response").innerText = 'Error: ' + error;
        });
    };
</script>
</body>
</html>
