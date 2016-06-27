function postIdea(){
  $('#submit-button').click(function(){
    // When this button is clicked we want to grab the values of our form
    // After we grab values we send values to the api
    var ideaParams = {title: $('#idea-title').val(), body: $('#idea-body').val()}
    $.ajax({
      type: "POST",
      url: "api/v1/ideas",
      data: ideaParams,
      success: alert("Idea posted!")
    })
  });
};
