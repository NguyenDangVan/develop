// document.addEventListener("tuborlinks:load", function(){
//   $input = $("[data-behavior='autocomplete']")

//   var options= {
//     getValue: "name",
//     url: function(phrase){
//       return "/search.json?q=" + phrase;
//     },
//     categories: [
//       {
//         listLocation: "users",
//         header: "<strong>User</strong>",
//       }
//     ],
//     list: {
//       onChooseEvent: function(){
//         var url = $input.getSelectItemData().url
//         $input.val("")
//         console.log(url)
//       }
//     }
//   }

//   input.easyAutocomplete(options)
// })

$(document).ready(function(){
  var options = [
    "Van",
    "Man1",
    "Man2",
    "Man3"
  ];

  $("#auto-comple").autocomplete({
    source: options
  });
});
