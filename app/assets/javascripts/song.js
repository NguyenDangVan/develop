var check = false;
var check_cmt = false;
var check_edit = false;
var check_lyric = false;
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
  if (check_lyric == false) {
      $(".hide-lyric").show();
      check_lyric = true;
    } else {
      $(".hide-lyric").hide();
      check_lyric = false;
    }
})
