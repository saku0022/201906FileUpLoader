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
		<script language="JavaScript" type="text/javascript" src="js/fileuploader.js"></script>

		<script   src="https://code.jquery.com/jquery-3.3.1.min.js"   integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="   crossorigin="anonymous"></script>
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css"/>
		<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>
		<!-- jquery（ソート、検索、ペジネーション） -->
		<script>
			$(document).ready(function ($) {
				$('#fileList').DataTable();
			});
			jQuery(function($){
				$.extend( $.fn.dataTable.defaults, {
					language: {
					url: "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Japanese.json"
					}
				});
				$('#fileList').DataTable();
			});
		</script>
		<script>
			$(document).ready(function ($) {
				$('#fileList2').DataTable();
			});
			jQuery(function($){
				$.extend( $.fn.dataTable.defaults, {
					language: {
					url: "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Japanese.json"
					}
				});
				$('#fileList2').DataTable();
			});
		</script>
	</head>

	<header class="py-4">
		<div class="container text-center">
			<h1>ファイル共有システム</h1>
		</div>
	</header>

	<body>
		<span class="bg-danger">
			<nav class="naver naver-expand-lg naver-dark bg-dark">
				<ul class="nav justify-content-end">
				<li class="nav-item"><a class="nav-link" href="Henkou.php">パスワード変更</a></li>
				<li class="nav-item"><a class="nav-link" href="Logoutdone.php">ログアウト</a></li>
				</ul>
			</nav><br><br>

			<form action='FileEnd.php' method='post' id="upload" enctype="multipart/form-data">
				<table align="center">
						<div class="container-fluid">
							<div class="row">
								<div class="col-4">
								</div>

									<div class="col-4">
										<input id="lefile" name="file" type="file" style="display:none" width="100px">
											<div class="input-group">

												<center>
													<input type="file" id="sFiles"  name='file' multiple>
													<input type="submit" class="btn btn-info" onclick="check();" value="アップロード"><br/>
													(アップロード可能なファイルサイズは、２０ＭＢまでです。）
												</center>

											</div>
									</div>
								<div class="col-4">
								</div>

							</div>
						</div>
					</table><br><br>
			</form>
			<br><br>

			<div class="container-fluid">
				<div class="row">
					<div class="col-6">

						<label>
							<button id="checkAll" type="submit" class="btn btn-info" name="all" onclick="AllChecked(true);">全て選択</button>
						</label>
						<label>
							<button id="checkAll" type="reset" class="btn btn-info" onclick="AllChecked(false);">選択解除</button>
						</label>
					</div>


					<div class="col-6">
						<div class align="right">                           {*Javascriptの　delfile()メソッドの呼び出し*}
							<button type="button" class="btn btn-info" name="del" value="0" onclick='delfile();'>削除</button>
						</div>
					</div>
				</div>
			</div>
			<br>

			<!-- タブ型ナビゲーション -->
			<ul class="nav nav-pills nav-justified"></ul>
			<!-- <ul class="nav nav-pills flex-column flex-sm-row"> -->
        <div class="nav nav-pills" id="tab-menus" role="tablist">
          <!-- タブ01 -->
          <a class="flex-sm-fill text-sm-center nav-link active" id="tab-menu01" data-toggle="tab" href="#panel-menu01" role="tab" aria-controls="panel-menu01" aria-selected="true"> ユ ー ザ ー </a>
          <!-- タブ02 -->
          <a class="flex-sm-fill text-sm-center nav-link" id="tab-menu02" data-toggle="tab" href="#panel-menu02" role="tab" aria-controls="panel-menu02" aria-selected="false">  共  有  </a>
        </div>
      </ul>

        <!-- タブパネル -->
        <div class="tab-content" id="panel-menus">
          <!-- パネル01 -->
          <div class="tab-pane fade show active border border-top-0" id="panel-menu01" role="tabpanel" aria-labelledby="tab-menu01">
						<table id="fileList" class="table table-striped" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>  </th>
									<th>ファイル名          </th>
									<th>日時</th>
									<th>サイズ</th>
									<th>ダウンロード</th>
								</tr>
							</thead>
							<tbody>
								<form name='file_list'>   {*チェックボックスの　ｃｈｅｃｋｅｄ　をカウントするため*}
									{foreach from=$file_list3 item=data}
									<tr>
										<td>
											<label>
												<input type="checkbox" name="test" value="{$data.name}">
											</label>
										</td>
										<td>
											{$data.name}
										</td>
										<td>
											{$data.date}
										</td>
										<td>
											{$data.size}
										</td>
										<td>
			{*								<button type="submit" class="btn btn-info">ダウンロード</button>*}
											<button type="button" class="btn btn-default" aria-label="Left Align" onclick="download('{$data.name}');"><span class="glyphicon glyphicon-cloud-download" aria-hidden="true"></span>Download</button>
										</td>
									</tr>
									{/foreach}
								</form>

								<form name="delete_form" action="Delete.php" method="post"> {*削除ボタンと連動している*}
									<input type="hidden" name="fname" value="">
								</form>

								<form name="download_form" action="Download.php" method="post"> {*ダウンロードボタンと連動している*}
									<input type="hidden" name="fname" value="">
								</form>
							</tbody>
							{*<tfoot></tfoot>*}
						</table>
          </div>

          <!-- パネル02 -->
          <div class="tab-pane fade border border-top-0" id="panel-menu02" role="tabpanel" aria-labelledby="tab-menu02">
						<table id="fileList2" class="table table-striped" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>  </th>
									<th>ファイル名          </th>
									<th>日時</th>
									<th>サイズ</th>
									<th>ダウンロード</th>
								</tr>
							</thead>
							<tbody>
								<form name='file_list'>   {*チェックボックスの　ｃｈｅｃｋｅｄ　をカウントするため*}
									{foreach from=$file_list4 item=data}
									<tr>
										<td>
											<label>
												<input type="checkbox" name="test" value="{$data.name}">
											</label>
										</td>
										<td>
											{$data.name}
										</td>
										<td>
											{$data.date}
										</td>
										<td>
											{$data.size}
										</td>
										<td>
			{*								<button type="submit" class="btn btn-info">ダウンロード</button>*}
											<button type="button" class="btn btn-default" aria-label="Left Align" onclick="download('{$data.name}');"><span class="glyphicon glyphicon-cloud-download" aria-hidden="true"></span>Download</button>
										</td>
									</tr>
									{/foreach}
								</form>

								<form name="delete_form" action="Delete.php" method="post"> {*削除ボタンと連動している*}
									<input type="hidden" name="fname" value="">
								</form>

								<form name="download_form" action="Download.php" method="post"> {*ダウンロードボタンと連動している*}
									<input type="hidden" name="fname" value="">
								</form>
							</tbody>
							{*<tfoot></tfoot>*}
						</table>
          </div>
          </div>
        </div>
			</div>
		</div>

		</span>
	</body>
</html>
