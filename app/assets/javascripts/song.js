var check = false;
var check_cmt = false;
var check_edit = false;
var check_reply = false;

$(document).on("click", ".add-to-pls", function(){
    if (check == false) {
      $(".list-pls").show();
      check = true;
    } else {
      $(".list-pls").hide();
      check = false;
    }
});
$(document).on("click", ".show-cmt", function(){
    if (check_cmt == false) {
      $(".hide-cmt").show();
      check_cmt = true;
    } else {
      $(".hide-cmt").hide();
      check_cmt = false;
    }
});
$(document).on("click", ".btn-edit-cmt", function(){
  if (check_edit == false) {
      $(this).parent().find("div.edit-cmt").show();
      check_edit = true;
    } else {
      $(this).parent().find("div.edit-cmt").hide();
      check_edit = false;
    }
});
$(document).on("click", ".show-lyric", function(){
  $(".hide-lyric").show();
  $(".btn-hide").show();
  $(this).hide();
})
$(document).on("click", ".btn-hide", function(){
  $(this).hide();
  $(".hide-lyric").hide();
  $(".show-lyric").show();
})

$(document).on("click", ".btn-reply", function(){
  if (check_reply == false) {
      $(this).parent().find(".hide-reply").show();
      check_reply = true;
      $(this).parent().next(".replies").show();
    } else {
      $(this).parent().find(".hide-reply").hide();
      check_reply = false;
      $(this).parent().next(".replies").hide();
    }
});
