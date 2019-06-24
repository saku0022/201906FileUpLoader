<?php
require_once './base.php';
//$_SESSION['email'];
class HenkouEnd extends base {
    public function execute() {
			$this->smarty->assign('email', $_SESSION['email']);
 			$this->smarty->display('henkouend.tpl');

	}
}
new HenkouEnd();
?>