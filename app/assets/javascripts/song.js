$(document).ready(function(){
  var check = false;
  $(".add-to-pls").click(function(){
    if (check == false) {
      $(".list-pls").show();
      check = true;
    } else {
      $(".list-pls").hide();
      check = false;
    }
  });
});
