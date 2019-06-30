//　fileuploader.tplより

// タブがクリックされイベントをJavaScript側で以下のように受け取れる。
$('a[data-toggle="tab"]').on('shown', function (e) {
 // クリックされたタブ名はこんな感じで取得する。
 var tabName = e.target.href;
 var items = tabName.split("#"); // activated tab

 // 処理内容を書く
 alert('タブ  ');

 //e.relatedTarget // 直前のタブはこんなんで取得可能らしい
});

//$(document).on('click', '.btn btn-info', function(){
//	  alert('Button is clicked');
//	});

// 「全て選択」チェックで全てにチェック付く
function AllChecked(flg){
	if (document.file_list.test instanceof RadioNodeList) {	// 配列になっているか、判定
		// チェックボックスが複数の場合
		for (var i=0; i < document.file_list.test.length; i++){
			document.file_list.test[i].checked = flg;
		}
	} else {
		// チェックボックスが１つだけの場合
		document.file_list.test.checked = flg;
	}
}

function download(fname) {
	alert(fname +' をダウンロードします。 ');
	document.download_form.fname.value = fname;
	document.download_form.submit();
}

function delfile() {
	// var files = 'DB_Connect.php/index.php/MySmarty.class.php';
	var files = '';

	if (document.file_list.test instanceof RadioNodeList) {	// 配列になっているか、判定
		// チェックボックスが複数の場合
		for (var i=0; i < document.file_list.test.length; i++) {
			if (document.file_list.test[i].checked) {
				if (files.length > 0) {
					files+= '/';
				}
				files+= document.file_list.test[i].value;
			}
		}
	} else {
		// チェックボックスが１つだけの場合
		files+= document.file_list.test.value;
	}

	if (files.length > 0) {
		if(window.confirm('ファイルを削除します。')){
			document.delete_form.fname.value = files;
			document.delete_form.submit();      // value の　files をsubmit している
		}
	} else {
		alert('ファイルを選択してください。');
	}
}

//binds to onchange event of your input field
$('#myFile').bind('change', function() {

  //this.files[0].size gets the size of your file.
  alert(this.files[0].size);

});

function check(){
	var fileList = document.getElementById("sFiles").files;
	var list = "";
	for(var i=0; i<fileList.length; i++){
	list += "[" + fileList[i].size + " bytes]" + fileList[i].name + "<br>";
	}
	document.getElementById("result").innerHTML = list;
	}
