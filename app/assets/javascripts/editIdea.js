function editTitle() {
  //possibly set up timer here
  $("#idea-title-show" ).on('blur', function(event){
      editContent(this, {title: $(this).text(), id: $(this).data('title-id')})
  }).on('keydown', function (event) {
    if (event.keyCode !== 13) {
      return;
    }
    editContent(this, {title: $(this).text(), id: $(this).data('title-id')})
  })
}

function editBody(){
  $("#idea-body-show").on('blur keydown', function(event){
    if (event.type === "blur" || event.keyCode === 13) {
      debugger
      editContent(this, {body: $(this).text(), id: $(this).data('body-id')})
    }
  })
}

function editContent(elementHTML, updatedContent){
  debugger
var options =  {
    type: "PATCH",
    url: "/api/v1/ideas/" + updatedContent.id,
    data: {
        title: updatedContent.title,
        body: updatedContent.body
      },
      dataType: "json",
      success: function(datum){
      $('.user-flash').removeClass('hidden')
      if (datum['response'] === 'successful') {
        $('.user-flash').text('Successfully updated!')
      } else {
        $('.user-flash').text('Update unsuccessful.')
      }
    }
  }
  $.ajax(options)
}
