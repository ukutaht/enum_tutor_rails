$(document).ready(function(){
  $('#challenge-nav a').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
  })

  $(document).on('click', '#doc-click', function(){
    $("#docs").slideToggle();
  });

  $(document).on("click",'#run-it', function(event){
    event.preventDefault();
    $('#attempt_attempt_text').val(editor.getValue());
    $(this).closest("form").submit();
  });
})
