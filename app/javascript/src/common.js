// 関数に「window.」を付与し、グローバル変数として定義する事により処理が実行された

window.previewImage = function(id) {
  const target = this.target;
  const file = target.files[0];
  const reader  = new FileReader();
  reader.onloadend = function () {
    const preview = document.querySelector("#preview")
      if(preview) {
        preview.src = reader.result;
      }
    }
    if (file) {
    reader.readAsDataURL(file);
  }
}


console.log("validateImage called");