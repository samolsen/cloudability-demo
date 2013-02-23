$(function(){

  var ajaxCallback = function(sel) {
    return function(ev, data) {
        var form = $(this);
        form.find('input[type=text],select').val("");
        form.find('ul.errors').empty();
    
        $(sel).append('<option value="' + data.id + '">' + data.name + '</option>');
        $(".chzn-select").trigger("liszt:updated"); // Update chosen
      }
  };
  
  $('#new_actor_form').on('ajax:success', ajaxCallback('#dvd_actor_ids'));
  $('#new_director_form').on('ajax:success', ajaxCallback('#dvd_director_id'));
  
});
