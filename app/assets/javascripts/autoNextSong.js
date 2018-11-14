$(document).on("turbolinks:load", function(){
  var audio = $(".audio-play-song");

  if (sessionStorage.check_autonext == "true"){
    $(".audio-play-song").removeAttr("loop");
    checked();
  } else {
    unchecked();
  }

  $('body').on("click", ".btn-autonext", function(){
    if (sessionStorage.check_autonext == "true"){
      audio.attr("loop", "loop");
      sessionStorage.check_autonext = "false";
      unchecked();
    } else {
      sessionStorage.check_autonext = "true";
      audio.removeAttr("loop");
      checked();
    }
  });

  audio[0].addEventListener("ended", function(){
    if (sessionStorage.check_autonext == "true"){
      console.log(sessionStorage.check_autonext);
      autonext();
    }
  })
});

function autonext(){
  var next = $("ul.suggest a:first-child");
  var link = next.attr("href");
  console.log("a");
  window.open(link, "_self");
  return false;
}

sessionStorage.setItem("check_autonext", "true");

// function checked() {
//   $(".checked").css("display", "inline");
//   $(".unchecked").css("display", "none");
// }

// function unchecked() {
//   $(".checked").css("display", "none");
//   $(".unchecked").css("display", "inline");
// }
 function checked(){
  $(".slider").css(
    "background-color", "#2196F3"

  );
 }
 function unchecked() {
  $(".slider").css(
    "background-color", "#ccc"
  );
 }
