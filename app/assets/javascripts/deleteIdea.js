function deleteIdea(){
  $('.any-idea').delegate('.delete-button', 'click', function(){
    var ideaId = $(this).closest('.new-idea').data('idea-id')
  var call = {
    type: "DELETE",
    url: "api/v1/ideas/" + ideaId,
    success: function(data) {
      $('.new-idea' + ideaId).remove();
    }
  }
   $.ajax(call)
  })
}
