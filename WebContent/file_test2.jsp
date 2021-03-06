<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>XMLHttpRequest 上传文件进度条示例</title>
</head>
<body>
<progress id="upload_progress" value="0" max="100"></progress>
<input id="upload_file" type="file" name="upload_file" />
<button id="btn_start">Start</button>
<button id="btn_cancel">Cancel</button>
<script type="text/javascript" src="assets/js/jquery-1.10.2.js"></script>
<script type="text/javascript">
var xhr = new XMLHttpRequest();
var progressBar = document.getElementById('upload_progress');
$('#btn_start').click(function() {
    var uploadFile = document.getElementById('upload_file').files[0];
    var formData = new FormData();
    formData.append('upload_file', uploadFile);

    // ---------------------------------------
    // 原生xmlHttpRequest发送
    xhr.open('post', '/WebCardTest/case/upload');
    xhr.onload = function() {
        alert('完成！');
    };
    xhr.onerror = function() {
        alert('无法连接服务器！');
    };
    xhr.upload.onprogress = function(progress) {
        if (progress.lengthComputable) {
            console.log(progress.loaded / progress.total * 100);
            progressBar.max = progress.total;
            progressBar.value = progress.loaded;
        }
    };
    xhr.upload.onloadstart = function() {
        console.log('started...');
    };
    xhr.send(formData);

    // ---------------------------------------
    // 使用jQuery发送
    /**
    $.ajax({
       type: "POST",
    　　url: "/server_url.php",
    　　data: formData , //这里上传的数据使用了formData 对象
    　　processData: false, 
    　　contentType: false, //必须false才会自动加上正确的Content-Type
    　　//这里我们先拿到jQuery产生的 XMLHttpRequest对象，为其增加 progress 事件绑定，然后再返回交给ajax使用
    　　xhr: function() {
    　　　　var xhr = $.ajaxSettings.xhr();
    　　　　if (xhr.upload) {
    　　　　　　xhr.upload.onprogress = function(progress) {
                    if (progress.lengthComputable) {
                        console.log(progress.loaded / progress.total * 100);
                        progressBar.max = progress.total;
                        progressBar.value = progress.loaded;
                    }
                };
                xhr.upload.onloadstart = function() {
                    console.log('started...');
                };
     　　　 }
              return xhr;
     　 }
    }).done(function(resp) {
        alert('完成！');
    }).fail(function(err) {
        alert('无法连接服务器！')
    });*/

});

$('#btn_cancel').click(function() {
    xhr.abort();
});
</script>
</body>
</html>