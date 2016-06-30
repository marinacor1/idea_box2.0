function searchIdeas(){
  $(".search").keyup(function(event){
    var searchParam = $(this).val().toLowerCase();
    var currentIdeas = $('.new-idea').children();
    debugger
    currentIdeas.removeClass('invisible');

    var hideIdeas = currentIdeas.filter(function(){
    var ideaBodyAndText = $(this).find("#idea-title-show, #idea-body-show").text().toLowerCase()
    return !(ideaBodyAndText.includes(searchParam))
  })
  hideIdeas.addClass('invisible');
  })
}
