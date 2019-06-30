<?php
require_once './base.php';
header('Content-Type: text/html; charset=UTF-8');
class FileUpLoader extends base {

    public function execute() {

    	// 共有のほう
    	// 共有の時、session閉じる必要はない
    	// allフォルダーへ保存　できればOK
    	// ユーザー <=> 共有　行ったり来たり

//     	$email=$_SESSION['email']; // 不正アクセス防止のため、になってない、、
    	// ファイル一覧表示
    	$dir = $this->makeDir(all);
    	// ディレクトリ・ハンドルをオープン
    	$dir_h = opendir( $dir );
    	$file_list2 = array();
    	// ファイル・ディレクトリの一覧を　$file_list　に
    	while (false !== ($file_name = readdir($dir_h))){
    	    array_push($file_list2, $file_name);
    	}
    	//ディレクトリ・ハンドルをクローズ
    	closedir();
    	$i = 0;
    	$file_list4 = array(); // 共有用の表示ファイル　

    	foreach( $file_list2 as $file_name){
    	    // ファイルのみを表示

    	    if (is_file($dir . "/" . $file_name))
    	    {// もしファイルだったら、、
    	        // file_list3[N] の　[0]に、ファイル名、[1]にファイル更新日
    	        // $_FILE[パラメータ][name] アップロードファイル名
    	        $file_list4[$i]['name'] = mb_convert_encoding($file_name, "UTF-8", "SJIS");//utf-8になっている

    	        // ファイルの更新日時を取得
    	        $file_list4[$i]['date'] = date("Y/m/d H:i", filemtime($dir . "/" . $file_name));
    	        // ファイルのサイズを取得
    	        $filesize = filesize($dir . "/" . $file_name);

    	        $precision = 2;
    	        if ($filesize < 1024) {							// バイト
    	            $size = $filesize . "バイト";
    	        } else if ($filesize < 1024*1024) {				// KB
    	            $size = round($filesize/1024, $precision) . "KB";
    	        } else if ($filesize < 1024*1024*1024) {		// MB
    	            $size = round($filesize/1024/1024, $precision) . "MB";
    	        } else {										// GB
    	            $size = round($filesize/1024/1024/1024, $precision) . "GB";
    	        }
    	        $file_list4[$i]['size'] = $size;

    	        $i++;
    	    }
    	}
    	//　引数 $file_list2 配列[N][1] でソートする関数
    	function order_by_desc($a,$b)
    	{
    	    if ( strtotime($a[1]) > strtotime($b[1])){
    	        return -1;
    	    } else if ( strtotime($a[1]) < strtotime($b[1])) {
    	        return 1;
    	    } else {
    	        return 0;
    	    }
    	}


    	$this->smarty->assign('file_list4', $file_list4);
    	$this->smarty->display('fileuploader.tpl');
	}
}
new FileUpLoader();
?>
