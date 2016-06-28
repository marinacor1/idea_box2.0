function postIdea(){
  $('#submit-button').click(function(){
    var ideaParams = {title: $('#idea-title').val(), body: $('#idea-body').val()}
    debugger
    $.ajax({
      type: "POST",
      url: "api/v1/ideas",
      data: ideaParams,
      success: noReload(ideaParams)
    })
  });
};

function noReload(ideaParams){
  $('.new-idea-parent').prepend(ideaParams)
}
