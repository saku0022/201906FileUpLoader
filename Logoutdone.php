<?php
require_once './base.php';
header('Location:Login.php'); // リダイレクト　このページにアクセスあったら、ここに移動する
class Logoutdone extends base {
    public function execute() {

		$_SESSION=[];//セッション変数を全て削除。
		session_destroy();//セッション破棄！！

		$this->smarty->assign('logout','ログアウトしました。');
		$this->smarty->display('logoutdone.tpl');
	}
}
new Logoutdone();
?>