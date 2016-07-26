
$(document).ready ->
  # $('#event_category').addClass "c-select form-control boxed"
  #
  # $('.editor .ql-editor').on 'blur', ->
  #   $('#event_description').append $(this).html()


  picker_init = ->
    jQuery('.event-datepicker').datepicker
      autoclose: true
      format: 'dd/mm/yyyy'
      todayHighlight: true
    jQuery('.event-timepicker').timepicker
      showMeridian: false
      minuteStep: 15

  # if $('.nested-fields').length == 0
  #   document.getElementById('addTickets').click();
  #   picker_init()
  #   $('body').click();

  $('form').parsley()
  picker_init()

  $('.remove_fields').click ->
    setTimeout (->
      picker_init()
      return
    ), 0
    return
  $('.add_fields').click ->
    setTimeout (->
      picker_init()
      return
    ), 0
    return
