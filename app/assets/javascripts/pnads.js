$(document).ready (function() {
  $('.select_pnads').change (function() {
    $('#select_pnads_objetivo').css('border', '1px solid #fff');
    $('.pnads_univ').css('border', '1px solid #fff');

    var objetivo = $('#select_pnads_objetivo').val();
    var tipo_grafico = $('#select_pnads_tipo_grafico').val();
    var fxid = $('#select_pnads_fxid').val();
    var univ = $('#select_pnads_univ').val();
    var area = $('#select_pnads_area').val();
    var sexo = $('#select_pnads_sexo').val();
    var cor  = $('#select_pnads_cor').val();

    if (objetivo && univ) {
      var params = 'objetivo=' + objetivo + '&tipo_grafico=' + tipo_grafico + '&fxid=' + fxid + '&univ=' + univ + '&area=' + area + '&sexo=' + sexo + '&cor=' + cor;
      $.ajax({ url: '/pnad/show', data: params });
    }
    else {
      if (!objetivo) $('#select_pnads_objetivo').css('border', '2px solid #EC1C23');
      if (!univ) $('.pnads_univ').css('border', '2px solid #EC1C23');

      $('#dados').html('<br/><br/><b>Informe Todos as Opções de Pesquisa</b>');

      $.ajax({ url: '/pnad', data: params });
    }
  })

  $('#select_pnads_univ').val('0');
  $('#select_temas').val('');
  $('#select_pnads_objetivo').val('');
  $('#select_pnads_tipo_grafico').val('column');
  $('#select_pnads_fxid').val('9999');
  $('#select_pnads_area').val('0');
  $('#select_pnads_sexo').val('0');
  $('#select_pnads_cor').val('0');

  $('#select_pnads_univ').multiselect({classes: 'pnads_univ', selectedText: '# Região'});
  $('#select_pnads_univ').multiselect('enable');

  $('#select_pnads_fxid').multiselect({classes: 'pnads_fxid', selectedText: '# F. Etária'});
  $('#select_pnads_fxid').multiselect('enable');

  $('#select_pnads_area').multiselect({classes: 'pnads_area', selectedText: '# Área'});
  $('#select_pnads_area').multiselect('enable');

  $('#select_pnads_sexo').multiselect({classes: 'pnads_sexo', selectedText: '# Sexo'});
  $('#select_pnads_sexo').multiselect('enable');

  $('#select_pnads_cor').multiselect({classes: 'pnads_cor', selectedText: '# Cor'});
  $('#select_pnads_cor').multiselect('enable');

  // Antigo - Ajax
  /*
  $('.link_tema').on('click', function(event) {
    var id = $(this).attr('data-href');
    if (id) {
      var params = 'tema=' + id;
      $.ajax({ url: '/pnad', data: params });
    }
    else {
      $.ajax({ url: '/dados', data: params });

    }
  });
  */
});
