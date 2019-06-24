<?php
require_once './base.php';
class Login_done extends base {
	public function execute() {
//			$this->smarty->assign('email', $_SESSION['email']);
			$this->smarty->assign('user','ログインしました。');
			$this->smarty->display('login_done.tpl');
	}
}
new Login_done();
?>