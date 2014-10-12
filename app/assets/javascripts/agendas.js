$(document).ready (function() {
  $('.select_agendas').change (function() {
    $('#select_agendas_indicador').css('border', '1px solid #fff');

    if ($('#select_agendas_fxid').val().length > 1) {
      vFxid = $('#select_agendas_fxid').val();
      if (vFxid.indexOf('65534') == 0) vFxid.splice(vFxid.indexOf('65534'), 1);
      $('#select_agendas_fxid').val(vFxid);
      $('#select_agendas_fxid').multiselect('refresh');
    }

    if ($('#select_agendas_area').val().length > 1) {
      vArea = $('#select_agendas_area').val();
      if (vArea.indexOf('65535') == 0) vArea.splice(vArea.indexOf('65535'), 1);
      $('#select_agendas_area').val(vArea);
      $('#select_agendas_area').multiselect('refresh');
    }

    if ($('#select_agendas_sexo').val().length > 1) {
      vSexo = $('#select_agendas_sexo').val();
      if (vSexo.indexOf('65536') == 0) vSexo.splice(vSexo.indexOf('65536'), 1);
      $('#select_agendas_sexo').val(vSexo);
      $('#select_agendas_sexo').multiselect('refresh');
    }

    if ($('#select_agendas_cor').val().length > 1) {
      vCor = $('#select_agendas_cor').val();
      if (vCor.indexOf('65537') == 0) vCor.splice(vCor.indexOf('65537'), 1);
      $('#select_agendas_cor').val(vCor);
      $('#select_agendas_cor').multiselect('refresh');
    }

    if ($('#select_agendas_renda').val().length > 1) {
      vRenda = $('#select_agendas_renda').val();
      if (vRenda.indexOf('65538') == 0) vRenda.splice(vRenda.indexOf('65538'), 1);
      $('#select_agendas_renda').val(vRenda);
      $('#select_agendas_renda').multiselect('refresh');
    }

    if ($('#select_agendas_escolaridade').val().length > 1) {
      vEscolaridade = $('#select_agendas_escolaridade').val();
      if (vEscolaridade.indexOf('65539') == 0) vEscolaridade.splice(vEscolaridade.indexOf('65539'), 1);
      $('#select_agendas_escolaridade').val(vEscolaridade);
      $('#select_agendas_escolaridade').multiselect('refresh');
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
      $('#dados').html('<br/><br/><b>Informe Todos as Opções de Pesquisa</b><br/><br/>');
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

  $('#select_agendas_escolaridade').multiselect({classes: 'agendas_escolaridade', selectedText: '# Escolar.'});
  $('#select_agendas_escolaridade').multiselect('enable');

  $('#select_agendas_cor').multiselect({classes: 'agendas_cor', selectedText: '# Cor'});
  $('#select_agendas_cor').multiselect('enable');

});
