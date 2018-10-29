$(document).ready(function(){

  var audio = $("#audio");
  var playlist = $("#playlist");
  var songs = playlist.find("li div a.song");
  var len = songs.length;
  var current = 0;
  audio[0].volume = .50;
  // var reg = /mp3$/;

  function run(link, player){
  //  if (reg.test(link) == false ) {
      player.src = link.attr("href");
      par = link.parent().parent();
      par.addClass("active").siblings().removeClass("active");
   // }
    player.load();
    player.play();
  }

  function next_song(){
    current++;
    if(current == len){
      current = 0;
      link = playlist.find('a.song')[0];
    }else{
      link = playlist.find("a.song")[current];
    }
    run($(link),audio[0]);
  }

  // function only_song(){
  //   audio[0].addEventListener('ended',function(e){
  //     link = audio[0].src;
  //     audio[0].load;
  //     run(link,audio[0]);
  //   });
  // }

  init();
  function init(){
    playlist.on("click", ".song-in-playlist", function(e){
      e.preventDefault();
      link = $(this).find("a.song");
      current = link.parent().parent().index();
      audio[0].src = link.attr("href");
      run(link, audio[0]);
    });
    audio[0].addEventListener('ended',function(e){
      next_song();
    });
  }

  $("button#next-song").click(function(){
    next_song();
    });

  $("button#previous-song").click(function(){
    current = current - 2;
    console.log(current);
    if (current < 0){
      current = -1;
    }
    next_song();
  });
});
