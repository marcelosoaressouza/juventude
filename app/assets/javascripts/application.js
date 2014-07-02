// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require_tree .
//= require chartkick

$(document).ready (
  function()
  {
    $('#select_temas').change (
      function()
      {
        var id = $(this).children(':selected').val();
        if (id) {
          var params = 'tema=' + id;
          $.ajax({ url: '/dados/show', data: params });
        }
        else {
          $.ajax({ url: '/dados', data: params });

        }
      }
    )

    //
    // Dados Agenda
    //
    $('.select_agendas').change (
      function()
      {
        $('#select_agendas_indicador').css('border', '1px solid #fff');

        var indicador = $('#select_agendas_indicador').val();
        var fxid = $('#select_agendas_fxid').val();
        var area = $('#select_agendas_area').val();
        var sexo = $('#select_agendas_sexo').val();

        if (indicador) {
          var params = 'indicador=' + indicador + '&fxid=' + fxid + '&area=' + area + '&sexo=' + sexo;
          $.ajax({ url: '/agendas/show', data: params });
        }
        else {
          if (!indicador) $('#select_agendas_indicador').css('border', '2px solid #EC1C23');

          $('#dados').html('<br/><br/><b>Informe Todos as Opções de Pesquisa</b>');

          $.ajax({ url: '/agendas', data: params });

        }
      }
    )

    $('#select_temas').val('');
    $('#select_agendas_indicador').val('');
    $('#select_agendas_fxid').val('1');
    $('#select_agendas_area').val('1');
    $('#select_agendas_sexo').val('1');

    //
    // Dados PNAD
    //
    $('.select_pnads').change (
      function()
      {
        $('#select_pnads_objetivo').css('border', '1px solid #fff');
        $('.pnads_univ').css('border', '1px solid #fff');

        var objetivo = $('#select_pnads_objetivo').val();
        var fxid = $('#select_pnads_fxid').val();
        var univ = $('#select_pnads_univ').val();
        var area = $('#select_pnads_area').val();
        var sexo = $('#select_pnads_sexo').val();
        var cor  = $('#select_pnads_cor').val();

        if (sexo == 3 || cor == 3)
        {
          $('#select_pnads_univ').val('0');
          $('#select_pnads_univ').multiselect('refresh');
          $('#select_pnads_univ').multiselect('disable');
          univ = '0';
        }
        else
        {
          $('#select_pnads_univ').multiselect('enable');
        }

        if (objetivo && univ) {
          var params = 'objetivo=' + objetivo + '&fxid=' + fxid + '&univ=' + univ + '&area=' + area + '&sexo=' + sexo + '&cor=' + cor;
          $.ajax({ url: '/pnads/show', data: params });
        }
        else {
          if (!objetivo) $('#select_pnads_objetivo').css('border', '2px solid #EC1C23');
          if (!univ) $('.pnads_univ').css('border', '2px solid #EC1C23');

          $('#dados').html('<br/><br/><b>Informe Todos as Opções de Pesquisa</b>');

          $.ajax({ url: '/pnads', data: params });

        }
      }
    )

    $('#select_pnads_univ').val('0');
    $('#select_temas').val('');
    $('#select_pnads_objetivo').val('');
    $('#select_pnads_fxid').val('1524');
    $('#select_pnads_area').val('0');
    $('#select_pnads_sexo').val('0');
    $('#select_pnads_cor').val('0');

    $('#select_pnads_univ').multiselect({classes: 'pnads_univ'});
    $('#select_pnads_univ').multiselect('enable');

    // Antigo - Ajax
    /*
    $('.link_tema').on('click', 
      function(event)
      {
        var id = $(this).attr('data-href');
        if (id) {
          var params = 'tema=' + id;
          $.ajax({ url: '/pnads', data: params });
        }
        else {
          $.ajax({ url: '/dados', data: params });

        }
      }
    );
    */
  }
);

Highcharts.setOptions({
  lang: {
    months: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
    shortMonths: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
    weekdays: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
    loading: ['Atualizando o gráfico...aguarde'],
    contextButtonTitle: 'Exportar gráfico',
    decimalPoint: ',',
    thousandsSep: '.',
    downloadJPEG: 'Download imagem JPEG',
    downloadPDF: 'Download arquivo PDF',
    downloadPNG: 'Download imagem PNG',
    downloadSVG: 'Download vetor SVG',
    printChart: 'Imprimir gráfico',
    rangeSelectorFrom: 'De',
    rangeSelectorTo: 'Para',
    rangeSelectorZoom: 'Zoom',
    resetZoom: 'Limpar Zoom',
    resetZoomTitle: 'Voltar Zoom para nível 1:1',
  }
});
