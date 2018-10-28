$(document).ready(function () {
  init();
  function init(){
    var current = 0;
    var audio = $("#audio");
    var playlist = $("#playlist");
    var songs = playlist.find("li a .song");
    var len = songs.length - 1;
    audio[0].volume = .50;
    playlist.on("click", ".song-in-playlist", function(e){
      e.preventDefault();
      link = $(this).find("a.song");
      current = link.parent().index();
      run(link, audio[0]);
    });
    audio[0].addEventListener('ended',function(e){
      current++;
      if(current == len){
        current = 0;
        link = playlist.find('a.song')[0];
      }else{
        link = playlist.find("a.song")[current];
      }
      run($(link),audio[0]);
    });
  }
  function run(link, player){
    player.src = link.attr("href");
    par = link.parent().parent();
    par.addClass("active").siblings().removeClass("active");
    player.load();
    player.play();
  }
});