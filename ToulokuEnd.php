<?php
require_once './base.php';
class ToulokuEnd extends base {
    public function execute() {
		$this->smarty->assign('email', $_SESSION['email']);
		$this->smarty->display('toulokuend.tpl');
    }
}
new ToulokuEnd();
?>