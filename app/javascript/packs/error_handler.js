// var App = App || {};
//
// App.ErrorHandler = {
//     add_errors: function(container_id, error_hash){
//         $el = $(container_id);
//         this.clear_errors(container_id);
//         errors = JSON.parse(error_hash);
//         $.each(errors, function(key,errors_arr){
//             $input = $el.find("[data-errorkey="+key.replace(/\./g,'_')+"]")
//             $input.closest(".form-group").addClass("error").append("<span class='error'>"+errors_arr.join(", ")+"</span>")
//         });
//     },
//
//     clear_errors: function(container_id){
//         $(container_id).find("span.error").each(function(){
//             $(this).closest(".form-group").removeClass("error");
//             $(this).remove();
//         });
//     }
// }
//
//
// function hello() {
//     alert("hi");
// }