$(document).ready(function() {
  $('#next-story').click(function(event) {
    event.preventDefault();

    $.get('/books/' + currentStoryId + '/next',
      { format: 'json' })
      .done(function(data){
        console.log("data", data);
        $('#title').text(data.title);
        $('#narrative').text(data.narrative);

        currentStoryId = data.id;

        $('#previous-story').show();
      })
      .fail(function() {
        $('#title').text('No More Stories!');
        $('#narrative').text('Come back soon!');
        $('#next-story').hide();
      });
  });
});
