 var check = false;
$(document).on("click", ".add-to-pls", function(){
    if (check == false) {
      $(".list-pls").show();
      check = true;
    } else {
      $(".list-pls").hide();
      check = false;
    }
});
