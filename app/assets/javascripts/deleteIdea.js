function deleteIdea(){
  $('.any-idea').delegate('.delete-button', 'click', function(){
    var ideaId = $(this).closest('#idea').data('idea-id')
    var ideaDiv = $(this).closest('#idea')
  var call = {
    type: "DELETE",
    url: "api/v1/ideas/" + ideaId,
    success: function(data) {
      $(ideaDiv).remove();
    }
  }
   $.ajax(call)
  })
}
