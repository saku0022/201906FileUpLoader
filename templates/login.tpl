<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
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
    <center><h2>{$login}</h2><br></center>
        <form action="Login.php" method="post">
            <table align="center">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-2">
                        </div>
                        <div class="col-8">
							※使用可能文字　（ 英大文字：[A-Z]、英小文字：[a-z]、数字：[0-9]、記号：[ _-! ] )<br/>
							　文字数       （メールアドレス：１２８文字以内、パスワード：６字以上１２字以内 ）　
                            <input type="email" class="form-control mr-sm-6" id="email" name="email" value="{$email}"
                                     placeholder="メールアドレス">
							{$mail_msg}
                        </div>
                        <div class="col-2">
                        </div>

                        <div class="col-2">
                        </div>
                        <div class="col-8">
                                <input type="password" class="form-control mr-sm-6" id="pass" name="pass" value=""
                                       placeholder="パスワード">
							{$pass_msg}<br/>
							{$message}
                        </div>
                        <div class="col-2">
                        </div>
                    </div>
                </div>
            </table><br><br><br>

                <center>
                    <button type="submit" id="login" name="login" class="btn btn-info btn-lg" >　　ログイン　　</button><br><br><br>
                </center>
        </form>

		<form action="Touloku.php" method="post">
			<center>
				<button type="button"  class="btn btn-info btn-lg" onclick="location.href='Touloku.php';">新規ユーザー登録へ</button>
			</center>
		</form>

    </body>
</html>
