<?php
require_once './base.php';

class Touloku extends base {
    public function execute() {
		$email = '';
		$mail_msg = '';
		$pass_msg = '';
		$pass2_msg = '';
		$message = '';
		if (isset($_POST["touloku"])) {
	        // 登録ボタンが押された場合
			$email = $_POST['email'];
			$pass = $_POST['pass'];
			$pass2 = $_POST['pass2'];
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

			if (empty($pass2)) {
				$pass2_msg = '確認用パスワードを入力してください。';
				$err = true;
			} else if (mb_strlen($pass2) < 6 || 12 < mb_strlen($pass2)) {
				$pass_msg = '確認用パスワードは6文字以上12文字以内で設定してください。';
				$err = true;
			}

			if (!empty($pass) && !empty($pass2) && $pass != $pass2) {
				$pass2_msg = 'パスワードがちがいます。';
				$err = true;
			}

			if (!$err) {
				try {
					$stmt = $this->pdo->prepare('SELECT * FROM member WHERE email = ?');
					$stmt->bindParam(1,$email, PDO::PARAM_STR);
					$stmt->execute();
					$all = $stmt->fetchAll();
					if (count($all) > 0) {
						$message = 'そのメールアドレスは既に登録されています。';
					} else {
						$stmt = $this->pdo->prepare('INSERT INTO member (email,password) VALUES(?,?)');
						$stmt->bindParam(1,$email, PDO::PARAM_STR);
						$stmt->bindParam(2,$pass, PDO::PARAM_STR);
						if ($stmt->execute()){
							$_SESSION['email'] = $email;
							header('Location:ToulokuEnd.php');
							return;

						}else{
							$message = 'ユーザー登録に失敗しました。';
						}
					}
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
		$this->smarty->assign('pass2_msg', $pass2_msg);
		$this->smarty->assign('message', $message);
		$this->smarty->display('touloku.tpl');
	}
}
new Touloku();
?>

