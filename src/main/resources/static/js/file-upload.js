// 파일 업로드시 업로드한 파일명을 input 태그에 표시
$(document).ready(function () {
  $("#upload").on("change", function () {
    const fileName = this.files[0] ? this.files[0].name : "";
    $(".file_name").val(fileName);
  });
});
