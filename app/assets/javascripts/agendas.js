$(document).ready (function() {
  //
  // Dados Agenda
  //
  $('.select_agendas').change (function() {
    $('#select_agendas_indicador').css('border', '1px solid #fff');

    if ($('#select_agendas_fxid').val().length > 1) {
      vFxid = $('#select_agendas_fxid').val();

      if (vFxid.indexOf('65534') == 0) {
        vFxid.splice(vFxid.indexOf('65534'), 1);
      }

      $('#select_agendas_fxid').val(vFxid);
      $('#select_agendas_fxid').multiselect('refresh');
    }

    var indicador = $('#select_agendas_indicador').val();
    var tipo_grafico = $('#select_agendas_tipo_grafico').val();
    var fxid  = $('#select_agendas_fxid').val();
    var area  = $('#select_agendas_area').val();
    var sexo  = $('#select_agendas_sexo').val();
    var cor   = $('#select_agendas_cor').val();
    var renda = $('#select_agendas_renda').val();
    var escolaridade = $('#select_agendas_escolaridade').val();

    if (indicador) {
      var params = 'indicador=' + indicador + '&tipo_grafico=' + tipo_grafico + '&fxid=' + fxid + '&area=' + area + '&sexo=' + sexo + '&cor=' + cor + '&renda=' + renda  + '&escolaridade=' + escolaridade;
      $.ajax({ url: '/agenda/show', data: params });
    }
    else {
      if (!indicador) $('#select_agendas_indicador').css('border', '2px solid #EC1C23');

      $('#dados').html('<br/><br/><b>Informe Todos as Opções de Pesquisa</b>');

      $.ajax({ url: '/agenda', data: params });

    }
  })

  $('#select_temas').val('');
  $('#select_agendas_indicador').val('');
  $('#select_agendas_tipo_grafico').val('column');
  $('#select_agendas_fxid').val('65534');
  $('#select_agendas_area').val('65535');
  $('#select_agendas_sexo').val('65536');
  $('#select_agendas_cor').val('65537');
  $('#select_agendas_renda').val('65538');
  $('#select_agendas_escolaridade').val('65539');

  $('#select_agendas_fxid').multiselect({classes: 'agendas_fxid', selectedText: '# F. Etária'});
  $('#select_agendas_fxid').multiselect('enable');

  $('#select_agendas_area').multiselect({classes: 'agendas_area', selectedText: '# Área'});
  $('#select_agendas_area').multiselect('enable');

  $('#select_agendas_sexo').multiselect({classes: 'agendas_sexo', selectedText: '# Sexo'});
  $('#select_agendas_sexo').multiselect('enable');

  $('#select_agendas_renda').multiselect({classes: 'agendas_renda', selectedText: '# Renda'});
  $('#select_agendas_renda').multiselect('enable');

  $('#select_agendas_escolaridade').multiselect({classes: 'agendas_escolaridade', selectedText: '# Educação'});
  $('#select_agendas_escolaridade').multiselect('enable');

  $('#select_agendas_cor').multiselect({classes: 'agendas_cor', selectedText: '# Cor'});
  $('#select_agendas_cor').multiselect('enable');

});
