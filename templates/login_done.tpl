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
		<center><h1>ファイル共有システム</h1><br><br></center>
		<center><h2>{$user}</h2><br><br></center>
		<center><h3>Email : {$smarty.post.email}</h3><br></center>

        <center><br><br>
			<form action="FileUpLoader.php" method="post">
				<button type="submit" id="f_sys" name="f_sys" class="btn btn-info btn-lg" >ファイル共有システムへ</button><br><br><br>
			</form>

			<form action="Login.php" method="post">
				<button type="submit" class="btn btn-info btn-lg" >ログインへ</button><br><br><br>
			</form>
        </center>

    </body>
</html>
