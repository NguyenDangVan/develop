$(document).ready(function() {
  $("audio").trigger('load');
  jQuery.fn.extend({
    player: function(id, task) {
      if(task == 'play'){
        $(id).children("audio").trigger('play');
      }
    }
  });
  $("li.play-list").click(function(){
    $("audio").trigger('pause');
    $("audio").prop("currentTime", 0);
    $(this).css("color","red");
    $(this).player(this, "play");
    $("li").not(this).css("color","black");
  });
});
