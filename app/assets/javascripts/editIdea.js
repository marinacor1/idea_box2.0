function editTitle() {
  $("#idea-title-show").on('blur keydown', function(event){
    event.stopPropagation();
    if (event.type ==="blur" || event.keyCode === 13) {
      editContent(this, {title: $(this).text()})
    }
  })
}

function editBody(){
  $("#idea-body-show").on('blur keydown', function(event){
    event.stopPropagation();
    if (event.type === "blur" || event.keyCode === 13) {
      editContent(this, {body: $(this).text()})
    }
  })
}
