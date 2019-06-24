<?php
require_once './base.php';
class Delete extends base {
	public function execute() {
		$email=$_SESSION['email']; // ログインしないと　エラー発生！！
//		files; // checked された　var files = 'DB_Connect.php/index.php/MySmarty.class.php';
		$file_name = $_POST['fname'];
		$file_name = explode("/",$file_name);
		//　ファイル名のパス
		$dir = $this->makeDir($email);
			// checked のファイルだけを　unlink()
			// ループ処理で削除していく
			foreach ($file_name as $value) {
				// globで取得したファイルをunlinkで1つずつ削除していく

				$file = "{$dir}/{$value}";
				$file = mb_convert_encoding($file, "SJIS", "UTF-8");// SJIS →　UTF-8 にしている

				 unlink($file);
			}
		header('Location:FileUpLoader.php');
	}
}
new Delete();
?>