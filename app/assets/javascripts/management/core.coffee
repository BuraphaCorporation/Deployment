
#= require switchery/switchery.min
#= require bootstrap-tagsinput/dist/bootstrap-tagsinput.min
#= require multiselect/js/jquery.multi-select
#= require jquery-quicksearch/jquery.quicksearch
#= require select2/select2.min
#= require bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min
#= require bootstrap-inputmask/bootstrap-inputmask.min


#= require timepicker/bootstrap-timepicker.min
#= require mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min
#= require bootstrap-datepicker/dist/js/bootstrap-datepicker.min
#= require bootstrap-daterangepicker/daterangepicker

#= require components/libs/parsley

#= require dropzone/dist/dropzone

#= require_self

$(document).ready ->

  picker_init = ->
    jQuery('.event-datepicker').datepicker
      autoclose: true
      format: 'dd/mm/yyyy'
      todayHighlight: true
    jQuery('.event-timepicker').timepicker
      showMeridian: false
      minuteStep: 15
  #
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
