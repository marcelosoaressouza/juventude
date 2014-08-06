$(document).ready (function() {
  //
  // Dados Agenda
  //
  $('.select_agendas').change (function() {
    $('#select_agendas_indicador').css('border', '1px solid #fff');

    var indicador = $('#select_agendas_indicador').val();
    var tipo_grafico = $('#select_agendas_tipo_grafico').val();
    var fxid = $('#select_agendas_fxid').val();
    var area = $('#select_agendas_area').val();
    var sexo = $('#select_agendas_sexo').val();
    var cor  = $('#select_agendas_cor').val();
    var renda  = $('#select_agendas_renda').val();

    if (indicador) {
      var params = 'indicador=' + indicador + '&tipo_grafico=' + tipo_grafico + '&fxid=' + fxid + '&area=' + area + '&sexo=' + sexo + '&cor=' + cor + '&renda=' + renda;
      $.ajax({ url: '/agendas/show', data: params });
    }
    else {
      if (!indicador) $('#select_agendas_indicador').css('border', '2px solid #EC1C23');

      $('#dados').html('<br/><br/><b>Informe Todos as Opções de Pesquisa</b>');

      $.ajax({ url: '/agendas', data: params });

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
});
