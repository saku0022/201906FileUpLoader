<!-- /** -->
<!--  * ファイルサイズの単位変換 -->
<!--  * @param int $size -->
<!--  * -->
<!--  * @return string -->
<!--  */ -->
 <?php
//  $file_list3[$i]['size'] = filesize($dir . "/" . $file_name);
//  require_once './base.php';
 class FileSize {


   public function execute()
    {
          $_REQUEST['size'];
          $b = 1024;    // バイト
          $mb = pow($b, 2);   // メガバイト
          $gb = pow($b, 3);   // ギガバイト

          switch(true){
            case $size >= $gb:
              $target = $gb;
              $unit = 'GB';
              break;
            case $size >= $mb:
              $target = $mb;
              $unit = 'MB';
              break;
            default:
              $target = $b;
              $unit = 'KB';
              break;
          }

          $new_size = round($size / $target, 2);
          $file_size = number_format($new_size, 2, '.', ',') . $unit;

          return $file_size;
    }
 }
    new FileSize();

// $size = calcFileSize(1000);
// // result -> 0.98KB

// $size = calcFileSize(1030);
// // result -> 1.01KB

// $size = calcFileSize(1000000000000000);
// // result -> 931,322.57GB
?>