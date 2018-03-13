var syncerWatchPosition = {
  count: 0 ,
  lastTime: 0 ,
  map: null ,
  marker: null ,
} ;

// 成功した時の関数
function successFunc( position )
{
  /*
  // データの更新
  ++syncerWatchPosition.count ;         // 処理回数
  var nowTime = ~~( new Date() / 1000 ) ; // UNIX Timestamp

  // 前回の書き出しから3秒以上経過していたら描写
  // 毎回HTMLに書き出していると、ブラウザがフリーズするため
  if( (syncerWatchPosition.lastTime + 3) > nowTime )
  {
    return false ;
  }

  // 前回の時間を更新
  syncerWatchPosition.lastTime = nowTime ;
  */
  /*
  console.log("latitude = "+position.coords.latitude+" longitude = "+position.coords.longitude)
	var hostUrl= "<%= location_current_path(@ticket) %>";
	var latitude = position.coords.latitude;
	var longitude = position.coords.longitude;
	var csrf_token = "<%= form_authenticity_token %>"
	$.ajax({
	  url: hostUrl,
	  type:'POST',
	  dataType: 'json',
	  headers: {
	    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
	  },
	  data : {lat : latitude, lon : longitude },
	  timeout:3000,
	}).done(function(data) {

	   //App.locate.put_latlng(data["latitude"],data["longitude"]);
	}).fail(function(XMLHttpRequest, textStatus, errorThrown) {
	               //alert("error");
	})*/
  var link = $("a.get_my_location").attr("href");
  $("a.get_my_location").attr("href", function(i, href){
    var link = "<%= location_check_in_path(@ticket) %>" + "?latitude=" + position.coords.latitude + "&longitude=" + position.coords.longitude
    location.href = link;
  })
}

// 失敗した時の関数
function errorFunc( error )
{
  // エラーコードのメッセージを定義
  var errorMessage = {
    0: "原因不明のエラーが発生しました…。" ,
    1: "位置情報の取得が許可されませんでした…。" ,
    2: "電波状況などで位置情報が取得できませんでした…。" ,
    3: "位置情報の取得に時間がかかり過ぎてタイムアウトしました…。" ,
  } ;

  // エラーコードに合わせたエラー内容を表示
  //alert( errorMessage[error.code] ) ;
}

// オプション・オブジェクト
var optionObj = {
  "enableHighAccuracy": false ,
  "timeout": 1000000 ,
  "maximumAge": 0 ,
} ;

// 現在位置を取得する
$(document).on("click","a.get_my_location",function(event){
  //event.preventDefault();
  console.log("click button")
  navigator.geolocation.watchPosition( successFunc , errorFunc , optionObj );
})