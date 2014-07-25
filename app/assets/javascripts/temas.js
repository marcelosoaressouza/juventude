$(document).ready (function() {
  $('#select_temas').change (function() {
    var id = $(this).children(':selected').val();
    if (id) {
      var params = 'tema=' + id;
      $.ajax({ url: '/dados/show', data: params });
    }
    else {
      $.ajax({ url: '/dados', data: params });
    }
  })
});
