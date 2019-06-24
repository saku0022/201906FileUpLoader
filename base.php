<?php
require_once './smarty/Smarty.class.php';
class base {
	public $smarty;
	public $pdo;
	public $id="" ;
	public $email="";
	public $pass="";
	public $pass2="";
	public function  __construct(){
		session_start();
		$this->smarty = new Smarty();
		$this->smarty->template_dir = './templates';
		$this->smarty->compile_dir = './templates_c';
		$dsn = 'mysql:dbname=fileuploader;host=localhost;charset=utf8';
		$user = 'root';
		$password = '';
		$this->pdo = new PDO($dsn,$user,$password);//mediapro,mediapro
		$this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

		if (strpos($_SERVER['SCRIPT_NAME'], 'Login.php') === false &&
				strpos($_SERVER['SCRIPT_NAME'], 'Login_done.php') === false &&
				strpos($_SERVER['SCRIPT_NAME'], 'Touloku.php') === false &&
				strpos($_SERVER['SCRIPT_NAME'], 'ToulokuEnd.php') === false) {
			if(!isset($_SESSION['email'])) {
				//$this->smarty->assign('user','ログインしてください。');
				//$this->smarty->display('login_done.tpl');
				header('Location:Login.php');
				exit;
			}
		}
		$this->execute();//移動先のメソッド実行する
 	}
	public function makeDir($email) {
		$dir = 'upload';
		$this->makeDirectory($dir);
		$dir.= "/{$email}";
		$this->makeDirectory($dir);
		return $dir;
	}
	private function makeDirectory($dir) {
		if(!file_exists($dir)){
			mkdir($dir);
		}
	}
}
?>