jQuery ->
  $("[data-behavior='delete']").on "click", (e) ->
    e.preventDefault()

    swal {
      title: 'Are you sure?'
      text: 'You will not be able to recover this imaginary file!'
      type: 'warning'
      showCancelButton: true
      confirmButtonColor: '#DD6B55'
      confirmButtonText: 'Yes, delete it!'
      cancelButtonText: 'No, cancel plx!'
      closeOnConfirm: false
      closeOnCancel: false
    }, (confirmed) =>
      if confirmed
        $.ajax(
          url: $(this).attr("href")
          dataType: "JSON"
          method: "DELETE"
          success: =>
            swal 'Deleted!', 'Your imaginary file has been deleted.', 'success'
            # TODO: Also remove the item from the page
        )

      else
        swal 'Cancelled', 'Your imaginary file is safe :)', 'error'
      return
