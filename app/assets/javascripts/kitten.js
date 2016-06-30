function kittenImage(){
  $('.any-idea').delegate('kitten-button', 'click', (function(){
    debugger
    var ideaId = $(this).closest('#idea').data('idea-id')
    var ideaDiv = $(this).closest('#idea')
    var kittenCall = {
      type: "PATCH",
      url: "api/v1/ideas/" + ideaId,
      data: {
        kitten: 'http://placekitten.com/200/' + ideaId
      },
      dataTpe: "json",
      success: function(datum){
        addKittenTime();
      }
   $.ajax(kittenCall)
  })
  function addKittenTime(data){
    return '<div class="new-idea"><ul id="idea-title-show" data-title-id =' +
    idea.id +' contentEditable="true">' + 'Title: ' +idea.title +
    '</ul><ul id="idea-body-show" data-body-id =' + idea.id +
    ' contentEditable="true">' + 'Body: ' + idea.body + '</ul><ul>Quality: ' +idea.quality  +
    '</ul><ul><button id="plus-quality" type="button"> Thumbs Up </button>' +
    '<button id="minus-quality" type="button"> Thumbs Down </button></ul>' +
    '<ul><div class="kitten-button"><input type="submit" value="Add a Kitten"</ul'+
    '<ul><div class="delete-button"><input type="submit" value="Delete">' +
    '</div></ul></div>'
  }

  })
}
