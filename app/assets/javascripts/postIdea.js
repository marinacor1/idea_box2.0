function postIdea(){
  $('#submit-button').click(function(){
    var ideaParams = {title: $('#idea-title').val(), body: $('#idea-body').val()}
    $.ajax({
      type: "POST",
      url: "api/v1/ideas",
      data: ideaParams,
      success: function (newIdea){
        noReload(newIdea)
        clearTextfields();
    }
  });
})
};

function noReload(idea){
  $('.new-idea-parent').prepend(formatIdea(idea))
}

function clearTextfields(){
  $('#idea-title').val('');
  $('#idea-body').val('');
}
function formatIdea(idea) {
  return '<div class="new-idea"><ul id="idea-title-show" data-title-id =' +
  idea.id +' contentEditable="true">' + idea.title +
  '</ul><ul id="idea-body-show" data-body-id =' + idea.id +
  ' contentEditable="true">' + idea.body + '</ul><ul>Quality:' +idea.quality  +
  '</ul><ul><button id="plus-quality" type="button"> Thumbs Up </button>' +
  '<button id="minus-quality" type="button"> Thumbs Down </button></ul>' +
  '<ul><div class="delete-button"><input type="submit" value="Delete">' +
  '</div></ul></div>'
}
