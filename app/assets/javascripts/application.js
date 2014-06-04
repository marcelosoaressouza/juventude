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
//= require_tree .
//= require chartkick

// On Change #select_filtros for filtros
$(document).ready (
  function()
  {
    $("#select_filtros").change (
      function()
      {
        var id = $(this).children(":selected").val();
        if (id) {
          var params = 'filtro=' + id;
          $.ajax({ url: "/dados/show", data: params });
        }
        else {
          $.ajax({ url: "/dados/index", data: params });

        }
      }
    )

    $("#select_temas").change (
      function()
      {
        var id = $(this).children(":selected").val();
        if (id) {
          var params = 'tema=' + id;
          $.ajax({ url: "/dados/show", data: params });
        }
        else {
          $.ajax({ url: "/dados/index", data: params });

        }
      }
    )

    $(".select_pnads").change (
      function()
      {
        $("#select_pnads_objetivo").css("border", "1px solid #000");

        var objetivo = $("#select_pnads_objetivo").val();
        var fxid = $("#select_pnads_fxid").val();
        var univ = $("#select_pnads_univ").val();
        var area = $("#select_pnads_area").val();
        var sexo = $("#select_pnads_sexo").val();
        var cor  = $("#select_pnads_cor").val();

        if (objetivo) {
          var params = 'objetivo=' + objetivo + '&fxid=' + fxid + '&univ=' + univ + '&area=' + area + '&sexo=' + sexo + '&cor=' + cor;
          $.ajax({ url: "/pnads/show", data: params });
        }
        else {
          $("#select_pnads_objetivo").css("border", "2px solid #EC1C23");
          $('#dados').html("<br/><br/><b>Informe o Objetivo</b>");
          $.ajax({ url: "/pnads/index", data: params });

        }
      }
    )

    $(".link_tema").on('click', 
      function(event)
      {
        var id = $(this).attr('data-href');
        if (id) {
          var params = 'tema=' + id;
          $.ajax({ url: "/dados/show", data: params });
        }
        else {
          $.ajax({ url: "/dados/index", data: params });

        }
      }
    )

    $('#select_filtros').val("");
    $('#select_temas').val("");
    $("#select_pnads_objetivo").val("");

    $("#select_pnads_fxid").val("1524");
    $("#select_pnads_univ").val("0");
    $("#select_pnads_area").val("0");
    $("#select_pnads_sexo").val("0");
    $("#select_pnads_cor").val("0");

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
