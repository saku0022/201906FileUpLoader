var canvas = null;
var img_name = [
	"0.png",
	"1.png",
	"2.png",
	"3.png",
	"4.png",
	"5.png",
	"6.png",
	"7.png",
	"8.png",
	"s_BOMB.jpg",
	"s_BOMB2.jpg",
	"close.png",
	"flag.png"
];
var mineimg = new Array(img_name.length);
var IMG_WIDTH = 50;
var IMG_HEIGHT = 50;
var BD_WD = 9;
var BD_HT = 9;
var MAXBOMB = 5;

var BOMB = 9;				// 爆弾
var BOMB2 = 10;				// 爆弾2
var CLOSE = 11;				//
var FLAG = 12;

var g_Mine = new Array(BD_WD*BD_HT);
var g_Open = new Array(BD_WD*BD_HT);
var g_Flag = new Array(BD_WD*BD_HT);

var game_count = 0;
var message = "";
var time = "";

var FONT_HEIGHT = 24;

function init() {
	// ゲームの初期化
	initBoard();
	// 描画コンテキストの取得
	canvas = document.getElementById('canvas');
	if (canvas.getContext) {
		document.oncontextmenu = function () {return false;}
		canvas.onmousedown = onMouseDown;		// canvas内の onMouseDown 有効
		loadImage();
	}
}

function initBoard(){
	for (var i = 0; i < BD_WD*BD_HT; i++) {
		g_Open[i] = false;							// マス目は閉じた状態
		g_Flag[i] = false;							// 旗が無い状態
		g_Mine[i] = 0;								// 周りの爆弾数は0
	}

	// 爆弾を配置
	for (var i = 0; i < MAXBOMB; i++) {
		var n;

		do {
			var x = Math.floor(Math.random() * BD_WD);	// 0～(BD_WD-1)までの乱数を生成
			var y = Math.floor(Math.random() * BD_HT);	// 0～(BD_HT-1)までの乱数を生成
			n = x+y*BD_WD;
		} while (g_Mine[n] !== 0);						// 既に爆弾が置いてある
		g_Mine[n] = BOMB;								// 爆弾配置
	}

	// 爆弾を数える
	for (var i = 0; i < BD_WD*BD_HT; i++) {
		if (g_Mine[i] === 0) {
			var x = i % BD_WD;
			var y = Math.floor(i / BD_WD);
			g_Mine[i] = bombCount(x, y);
		}
	}
}

function loadImage() {							// init()で設定した　初期画面表示の設定
	var cnt = 0;

	for (var i=0; i < img_name.length; i++) {	// new Image() していく
		mineimg[i] = new Image();				// mineimg = new Array(img_name.length);
		mineimg[i].src = img_name[i] + "?" + new Date().getTime();	// .png
		mineimg[i].onload = function() {		// onload・・・cnt=画像が読み込まれた回数
			cnt++;								// onloadしたら、draw()
			if (cnt >= img_name.length) {
				draw();
				setInterval(draw, 1000);		// 1秒ごとに描画
			}
		}
	}
}

function draw() {								// init() → loadImage() → draw()  初期画面表示
	var ctx = canvas.getContext('2d');

	for (var i=0; i < g_Mine.length; i++) {
		var num = g_Mine[i];					// [0-80]
		var x = (i%BD_WD);
		var y = Math.floor(i/BD_WD);			// 位置の取得
		var xx = x*IMG_WIDTH;
		var yy = y*IMG_HEIGHT;

		if(g_Flag[i]){
			ctx.drawImage(mineimg[FLAG], xx, yy);
		} else {
			if (g_Open[i]) {
				ctx.drawImage(mineimg[num], xx, yy);	// [0-80] に、50*50px　で画像描画 drawImage()
			} else {
				ctx.drawImage(mineimg[CLOSE], xx, yy);
			}
		}
	}

	ctx.font = FONT_HEIGHT + "px 'ＭＳ Ｐゴシック'";
	ctx.fillStyle = "red";
	ctx.textBaseline = "top";
	ctx.fillText(message, (450-ctx.measureText(message).width)/2, 450/2);

	// 時間の描画
	if (message == "") {
		time = updateTimeText();
	}
	var x = 460;
	var y = 0;
	var sx = ctx.measureText(time).width;
	var sy = FONT_HEIGHT;
	ctx.fillStyle = "#FFFFFF";
	ctx.fillRect(x, y, sx, sy);
	ctx.fillStyle = "#0000FF";
	ctx.textBaseline = "top";
	ctx.fillText(time, x, y);

	// デバッグ用
	for (var y=0; y < BD_HT; y++) {
		var str = "";
		for (var x=0; x < BD_WD; x++) {
			str+= g_Mine[x+y*BD_WD];
		}
		str+= " ";
		for (var x=0; x < BD_WD; x++) {
			str+= g_Open[x+y*BD_WD] ? "1":"0";
		}
		console.log(y + "=" + str);
	}
}

var vx = [ -1,  0,  1, -1, 1, -1, 0, 1 ];
var vy = [ -1, -1, -1,  0, 0,  1, 1, 1 ];

function bombCount(x, y) {
	var bomb_count = 0;

	for (var i=0; i < vx.length; i++) {
		var xx = x + vx[i];
		var yy = y + vy[i];

		if (0 <= xx && xx < BD_WD && 0 <= yy && yy < BD_HT) {	// 範囲内の場合
			var n = xx+yy*BD_WD;

			if (g_Mine[n] === BOMB) {
				bomb_count++;
			}
		}
	}
	return bomb_count;
}

function flag(x, y){
	var num = x + y * BD_WD;					// [0-80]
	if (!g_Open[num]) {
		g_Flag[num] = !g_Flag[num];
		draw();
	}
}
// 盤面をオープン
function open(x, y) {
	if (x < 0 || BD_WD <= x || y < 0 || BD_HT <= y) {		//	範囲外の場合
		return;
	}
	var n = x+y*BD_WD;
	if( g_Open[n] ) {										//	既に開いている場合
		return;
	}

	if (game_count == 0) {
		startTime = Date.now();
	}
	game_count++;

	g_Open[n] = true;

	if( g_Mine[n] == 0 ) {									// そこに爆弾が無く、周りにも爆弾が無い場合
		for (var i=0; i < vx.length; i++) {
			var xx = x + vx[i];
			var yy = y + vy[i];
			var num = xx + yy * BD_WD;

			if (0 <= xx && xx < BD_WD && 0 <= yy && yy < BD_HT) {	// 範囲内の場合
				if (g_Mine[num] != BOMB) {
					open(xx, yy);							// 再帰
				}
			}
		}
	}
}
// 表示される内容をアップデートする関数
function updateTimeText() {
	if (game_count > 0) {
		var elapsedTime = Date.now() - startTime ;
		// 1分 = 1000 ミリ秒 * 60秒
		 var m = Math.floor(elapsedTime / (1000 * 60));
		 // 1分に満たなかったミリ秒のうち，秒となったもの
		 var s = Math.floor((elapsedTime % (1000 * 60)) / 1000);
		 // 1秒になれなかったもの
		 var ms = elapsedTime % 1000;

		 // ゼロパディング
		 m = `0${m}`.slice(-2);
		 s = `0${s}`.slice(-2);

		 return `${m}:${s}`;
	} else {
		 return "00:00";
	}
};

//  ゲームクリア
function GameClear(){
	var cnt = 0;
	for (var x = 0; x < BD_WD; x++) {
		for (var y = 0 ; y < BD_HT; y++) {
			var n = x + y * BD_WD;
			if(g_Open[n] == true) {
				cnt++;
			}
		}
	}
	if(cnt == BD_WD * BD_HT - MAXBOMB) {
		let elapsedTime;
		elapsedTime = 0;
		// 00:00:000 を表示
		updateTimeText();

		message = "ゲームクリア！！  お疲れ様でした！！";
		console.log("ゲームクリア！！　お疲れ様でした！！");
//		long endTime = System.currentTimeMillis() - startTime;
//		long sec = endTime / 1000;
//		long msec = endTime % 1000;
//		System.out.println(sec + "秒" + msec + "ミリ秒です。");
		return false;
	}else {
		return true;
	}
}
// ゲームオーバー
function GameOver( x, y){
	var n = x+y*BD_WD;	//場所(0-80)
	g_Mine[n] = BOMB2;

	for (var yy = 0; yy < BD_HT ; yy++) {
		for(var xx = 0; xx < BD_WD; xx++) {
			var num = xx + yy * BD_WD;
			g_Open[num] = true;
		}
	}
	message = "ゲームオーバー！！";
	console.log("ゲームオーバー！！");
}

function onMouseDown(event) {
	// クリックした場所
	var rect = event.target.getBoundingClientRect();
	var mx	= event.clientX - rect.left;
	var my	= event.clientY - rect.top;
	var x = Math.floor(mx/IMG_WIDTH);
	var y = Math.floor(my/IMG_HEIGHT);
	var data = event.buttons;
	var button_l = ((data & 0x0001) ? true : false);
	var button_r = ((data & 0x0002) ? true : false);

	if (0 <= x && x < BD_WD && 0 <= y && y < BD_HT) {// 範囲内で、クリックしたら、、、
		var num = x + y * BD_WD;					// [0-80]

		console.log("x=" + x + " y=" + y);

		if (button_l) {
			console.log("ひだり******num=" + num);					// [0-80]

			if(g_Mine[num] == BOMB){
				if (game_count == 0) {
					do {
						initBoard();
					} while(g_Mine[num] == BOMB);
				} else {
					GameOver(x, y);
				}
			}

			if (!g_Flag[num]) {
				open(x, y);
				GameClear();
			}
		} else if (button_r) {
			console.log("みぎ********num=" + num);
			flag(x, y);
		}

		draw();
	}
}