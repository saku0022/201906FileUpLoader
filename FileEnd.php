<?php
require_once './base.php';
header('Content-Type: text/html; charset=UTF-8');
class FileEnd extends base {

    public function execute() {
		$email=$_SESSION['email'];
		// ファイルのアップロード開始
		// $email のディレクトリ作成
		$dir = $this->makeDir($email);
		$img = '';
		$file_name = '';
		$msg = '';
		if (isset($_FILES['file'])) {
			$file_name = $dir . '/' . @$_FILES['file']['name'];
			$file_name = mb_convert_encoding($file_name, "SJIS", "UTF-8");
			if(move_uploaded_file($_FILES['file']['tmp_name'], $file_name)){
				$file_name = mb_convert_encoding($file_name, "UTF-8", "SJIS");
				$ext = pathinfo($file_name, PATHINFO_EXTENSION);
				$ext = strtolower($ext);
				if ($ext == 'png' || $ext == 'jpg')
				{
					$img = '<img src="' . $file_name . '">'; //画像表示
				}
				$_SESSION['file'] = $file_name;//セッション変数に登録
				$msg = 'ファイルをアップロードしました。';

			}
			else {
				$msg = 'ファイルのアップロードに失敗しました。';
			}
//			$file_name = mb_convert_encoding($file_name, "SJIS", "UTF-8");
		}
		$this->smarty->assign('img', $img);
		$this->smarty->assign('file_name',$file_name);
		$this->smarty->assign('msg',$msg);
		$this->smarty->display('fileend.tpl');
	}
}
new FileEnd();
?>