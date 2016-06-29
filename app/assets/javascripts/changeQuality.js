function increaseQuality(){
  $('.any-idea').delegate('#plus-quality', 'click', function(){
    var ideaId = $(this).closest('#idea').data('idea-id')
    var ideaDiv = $(this).closest('#idea')
    // pass the quality
    // create a variable for specific div/id
  $.ajax({
    type: "PATCH",
    url: "/api/v1/ideas/" + ideaId,
    data: {changeValue: "increase"},
    dataType: "json",
    success: function(data){
    ideaDiv.find('#idea-quality-show').text('Quality: ' + data.quality)
    }
    })
    // create an ajax call for patch to specific idea
})
}
