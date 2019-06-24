<?php
require_once './base.php';
class Download extends base {
	public function execute() {
		$email=$_SESSION['email'];
		$file_n =  $_POST['fname'];
		//ダウンロードをしたいファイル名のパス
		$dir = $this->makeDir($email);
		//ダウンロードをしたいファイル名のパス
		$file_path =  $dir . '/'. mb_convert_encoding($file_n, "SJIS", "UTF-8"); ;
		//タイプをダウンロードと指定
		header('Content-Type: application/force-download;');

		// ファイルサイズを取得し、ダウンロードの進捗を表示
		header('Content-Length: '.filesize($file_path));
		//ダウンロードの指示・ダウンロード時のファイル名を指定
		header('Content-Disposition: attachment; filename="'.$file_n.'"');

		// ファイルの内容を出力する前に入力バッファの中身をクリアする
		ob_end_clean();
		//ファイルを読み込んでダウンロード
		readfile($file_path);
	}
}
new Download();
?>
