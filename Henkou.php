<?php
require_once './base.php';
class Henkou extends base {
    public function execute() {
		$email = $_SESSION['email'];
		$pass_msg = '';
		$pass2_msg = '';
		$message = '';

        if (isset($_POST["henkou"])) {
			// 変更ボタンが押された場合
			$email = $_SESSION['email'];
			$pass = $_POST['pass'];
			$pass2 = $_POST['pass2'];

			$err = false;
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
				$pass_msg = 'パスワードは6文字以上12文字以内で設定してください。';
				$err = true;
			}

			if (!empty($pass) && !empty($pass2) && $pass != $pass2) {
				$pass2_msg = 'パスワードがちがいます。';
				$err = true;
			}


			if(!$err){ // フラグ
                try{
                    $stmt = $this->pdo->prepare('UPDATE member SET password=? WHERE email=?');
                    $stmt->bindParam(1,$pass, PDO::PARAM_STR);
                    $stmt->bindParam(2,$email, PDO::PARAM_STR);
        				if ($stmt->execute()){

							header('Location:HenkouEnd.php');
							return;
						}else{
							$message = 'パスワード変更に失敗しました。';
						}

                } catch (PDOException $e){
//                  echo $e->getMessage();
//					print '例外発生・・・';
					$message = '例外が発生しました。システム管理者にお問い合わせください。';
				}
			}

		} else {
			// 初期表示
		}


		$this->smarty->assign('email', $email);
		$this->smarty->assign('pass_msg', $pass_msg);
		$this->smarty->assign('pass2_msg', $pass2_msg);
		$this->smarty->assign('message', $message);
		$this->smarty->display('henkou.tpl');

	}
}
new Henkou();
?>

