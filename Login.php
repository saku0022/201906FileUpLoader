<?php
require_once './base.php';

class Login extends base {
    public function execute() {
		$email = '';
		$mail_msg = '';
		$pass_msg = '';
		$pass2_msg = '';
		$message = '';
		if (isset($_POST["login"])) {
	        // ログインボタンが押された場合
			$email = $_POST['email'];
			$pass = $_POST['pass'];
			$err = false;

			// 1. email の入力チェック
			if (empty($email)) {  // emptyは値が空のとき
				$mail_msg = 'メールアドレスを入力してください。';
				$err = true;
			} else if (mb_strlen($email) > 128) {
				$mail_msg = 'メールアドレスは128文字以下で入力してください。';
				$err = true;
			}
			if (empty($pass)) {
				$pass_msg = 'パスワードを入力してください。';
				$err = true;
			} else if (mb_strlen($pass) < 6 || 12 < mb_strlen($pass)) {
				$pass_msg = 'パスワードは6文字以上12文字以内で設定してください。';
				$err = true;
			}


			if (!$err) {
				try {
					$stmt = $this->pdo->prepare('SELECT email,password FROM member WHERE email=? AND password=? ');
					$stmt->bindParam(1,$_POST['email'], PDO::PARAM_STR);
					$stmt->bindParam(2,$_POST['pass'], PDO::PARAM_STR);
					$this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
					$stmt->execute();
//					$all = $stmt->fetchAll();

						$result = $stmt->fetch(PDO::FETCH_ASSOC);
						if($result != false) {
							$_SESSION['email']=$_POST['email'];
							header('Location:FileUpLoader.php');

						} else {
							$message = 'そのメールアドレスは登録されていません。「新規ユーザー登録」をお願いします。';
//							header('Location:Login.php');
//							exit();
						}
//						if (count($all) > 0) {
//							$_SESSION['email'] = $email;
//							header('Location:FileUpLoader.php');
//
//						}else if (count($all) == 0){
//							$message = 'そのメールアドレスは登録されていません。\n';
//							return;
//						}
				} catch (PDOException $e){
//					echo $e->getMessage();
//					print '例外発生・・・';
					$message = '例外が発生しました。システム管理者にお問い合わせください。';
				}
			}

		} else {
			// 初期表示
		}
		$this->smarty->assign('email', $email);
		$this->smarty->assign('mail_msg', $mail_msg);
		$this->smarty->assign('pass_msg', $pass_msg);
		$this->smarty->assign('message', $message);
		$this->smarty->assign('login','ログイン');
		$this->smarty->display('login.tpl');
	}
}
new Login();
?>
