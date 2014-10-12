$(document).ready (function() {
  $.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null){
       return null;
    }
    else{
       return results[1] || 0;
    }
  }

  var tema = $.urlParam('tema');

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

    // if (objetivo && univ) {
    if (objetivo && tipo_grafico && fxid && univ && area && sexo && cor)
    {
      var params = 'tema=' + tema + '&objetivo=' + objetivo + '&tipo_grafico=' + tipo_grafico + '&fxid=' + fxid + '&univ=' + univ + '&area=' + area + '&sexo=' + sexo + '&cor=' + cor;
      $.ajax({ url: '/pnad/show', data: params });
    }
    else
    {
      if (!objetivo) $('#select_pnads_objetivo').css('border', '2px solid #EC1C23');
      if (!univ) $('.pnads_univ').css('border', '2px solid #EC1C23');

      $('#dados').html('<br/><br/><b>Informe Todos as Opções de Pesquisa</b><br/><br/>');

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

  if ($.urlParam('objetivo') && $.urlParam('tipo_grafico') && $.urlParam('fxid') && $.urlParam('univ') && $.urlParam('area') && $.urlParam('sexo') && $.urlParam('cor')) {
    $('#select_pnads_objetivo').val($.urlParam('objetivo'));
    $('#select_pnads_tipo_grafico').val($.urlParam('tipo_grafico'));
    $('#select_pnads_fxid').val($.urlParam('fxid').split(","));
    $('#select_pnads_univ').val($.urlParam('univ').split(","));
    $('#select_pnads_area').val($.urlParam('area').split(","));
    $('#select_pnads_cor').val($.urlParam('cor').split(","));
    $('#select_pnads_sexo').val($.urlParam('sexo').split(","));
    $(".select_pnads").trigger('change');
  }

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
});
