function searchIdeas(){
  $(".search-form").keyup(function(event){
    binding.pry
    var searchParam = $(this).val().toLowerCase();
    var currentIdeas = $('#index').children();
    currentIdeas.removeClass('invisible');

    var hideIdeas = allExisitingIdeas.filter(function(){
    var ideaBodyAndText = $(this).find("#idea-title-show, #idea-body-show").text().toLowerCase()
    return !(ideaBodyAndText.includes(searchParam))
  })
  hideIdeas.addClass('invisible');
  })
}
