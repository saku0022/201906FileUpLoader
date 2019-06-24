<!DOCTYPE html>
<html>
    <head>
        <title>ファイル共有システム</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"/>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
     <link rel="stylesheet" href="./templates/common.css" type="text/css">
    </head>
    <body><br>
    <center><h1>ファイル共有システム</h1><br></center>
    <center><h2>新規ユーザー登録</h2><br><br/></center>
        <form action="Touloku.php" method="post"><!--値をわたすdir-OK!-->
            <table align="center">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-2">
                        </div>
                        <div class="col-8">
							※使用可能文字　（ 英大文字：[A-Z]、英小文字：[a-z]、数字：[0-9]、記号：[ _-! ] )<br/>
							　文字数       （メールアドレス：１２８文字以内、パスワード：６字以上１２字以内 ）　
							<input type="email" class="form-control mr-sm-6" name="email" value="{$email}"
								   placeholder="メールアドレス"　>
							{$mail_msg}
                        </div>
                        <div class="col-2">
                        </div>

                        <div class="col-2">
                        </div>
                        <div class="col-8">
							<input type="password" class="form-control mr-sm-6" name="pass" value=""
								   placeholder="パスワード"　>
							{$pass_msg}
                        </div>
                        <div class="col-2">
                        </div>

                        <div class="col-2">
                        </div>
                        <div class="col-8">
							<input type="password" class="form-control mr-sm-6" name="pass2" value=""
								   placeholder="確認用パスワード"　>
							{$pass2_msg}
                        </div>
                        <div class="col-2">
                        </div>

                        <div class="col-2">
                        </div>
                        <div class="col-8">
							{$message}
                        </div>
                        <div class="col-2">
                        </div>
                    </div>
                </div>
            </table><br><br>

			<center><br><br>
                <button type="submit" id='touloku' name='touloku' class="btn btn-info btn-lg" >新規ユーザー登録</button>
				<button type="button" class="btn btn-info btn-lg" onclick="location.href='Login.php';">戻る</button>
			</center>
        </form>
    </body>
</html>
