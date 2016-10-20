# jQuery(function() {
#   return $("[data-behavior='delete']").on("click", function(e) {
#     e.preventDefault();
#     return swal({
#       title: 'Are you sure?',
#       text: 'You will not be able to recover this imaginary file!',
#       type: 'warning',
#       showCancelButton: true,
#       confirmButtonColor: '#DD6B55',
#       confirmButtonText: 'Yes, delete it!',
#       cancelButtonText: 'No, cancel plx!',
#       closeOnConfirm: false,
#       closeOnCancel: false
#     }, (function(_this) {
#       return function(confirmed) {
#         if (confirmed) {
#           $.ajax({
#             url: $(_this).attr("href"),
#             dataType: "JSON",
#             method: "DELETE",
#             success: function() {
#               return swal('Deleted!', 'Your imaginary file has been deleted.', 'success');
#             }
#           });
#         } else {
#           swal('Cancelled', 'Your imaginary file is safe :)', 'error');
#         }
#       };
#     })(this));
#   });
# });
