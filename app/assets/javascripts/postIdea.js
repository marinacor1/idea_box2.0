function postIdea(){
  $('#submit-button').click(function(){
    var ideaParams = {title: $('#idea-title').val(), body: $('#idea-body').val()}
    $.ajax({
      type: "POST",
      url: "api/v1/ideas",
      data: ideaParams,
      success: function (newIdea){
        noReload(newIdea)
    }
  });
})
};

function noReload(idea){
  $('.new-idea-parent').prepend(formatIdea(idea))
}

function formatIdea(idea) {
  return '<div class="new-idea"><ul id="idea-title-show" data-title-id =' + idea.id +' contentEditable="true">' + idea.title + '</ul><ul id="idea-body-show" data-body-id =' + idea.id +' contentEditable="true">' + idea.body + '</ul><ul>Quality:' +idea.quality  +'</ul></div>'
}
