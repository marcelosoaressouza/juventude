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
