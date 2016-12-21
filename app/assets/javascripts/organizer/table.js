
function initTableFilter() {
  $('.table-filter').keyup(function () {
    var element = this;
    var table = $(element).parents('.event-section-panel').find('.table');
    var rex = new RegExp($(this).val(), 'i');
    $('tbody tr', table).hide();
    $('tbody tr', table).filter(function () {
      return rex.test($(this).text());
    }).show();
  })
}
