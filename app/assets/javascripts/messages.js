$(document).ready(function(){
    var txt_success = $(".alert alert-success").text();
    var txt_error = $(".alert alert-danger").text();
    if(txt_success != ''){
      alert(txt_success);
    }
    else{
      alert(txt_danger);
    }
});
