function deleteIdea(){
  $('.any-idea').delegate('.delete-button', 'click', function(){
    debugger
    var ideaId = $(this).closest('#idea').data('idea-id')
    debugger
  var call = {
    type: "DELETE",
    url: "api/v1/ideas/" + ideaId,
    success: function(data) {
      debugger
      $('.new-idea-' + ideaId).remove();
    }
  }
   $.ajax(call)
  })
}
