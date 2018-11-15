$(document).ready(function(){
  (function(){
    $("#show-limit").on("change", function(){
      $(this).closest("form").trigger("submit");
    });
  })
});
