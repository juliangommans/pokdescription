
$(document).ready(function(){

  $('#shuffle').on("click",function(e){
    e.preventDefault();
      content = $('#desc').text();
    $.ajax({
        url: '/shuffle/' + content,
        type: 'GET',
        success: function(data,status){
      $('#desc').replaceWith("<span id='desc'>" + data + "</span>")
        }
    });
  });

  $('#sprite').on("click",function(e){
    e.preventDefault();
    $('#loading').append("<h3 id='test'>loading please wait</h3>")
      var dots = "."
        var cycle = setInterval(function() {
        $('#test').replaceWith("<h3 id='test'>loading please wait" + dots + "</h3>");
        dots += ".";
        if(dots.length > 15){
          dots = ""
        }
      },75);
    $("body").load('/find/random', function(){
      clearInterval(cycle);
    });

    $("#search").submit(function(){
      $('#loading').append("<p id='test'>loading please wait</p>")
      var dots = "."
      var cycle = setInterval(function() {
        $('#test').replaceWith("<p id='test'>loading please wait" + dots + "</p>");
          dots += ".";
        if(dots.length > 15){
          dots = ""
        }
      },75);

    });

  });

})
