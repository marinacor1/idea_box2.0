function allIdeas(){
  $.ajax({
    type: 'GET',
    url: '/api/v1/idea',
    success: function(ideas) {
      showIdeas(ideas);
    }
  });
}

function showIdeas(ideas){
  $.each(ideas, function(index, idea){
    noReload(idea);
  })
}
