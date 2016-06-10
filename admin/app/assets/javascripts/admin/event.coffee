
$(document).ready ->
  $('#event_category').addClass "c-select form-control boxed"

  $('.editor .ql-editor').on 'blur', ->
    $('#event_description').append $(this).html()

