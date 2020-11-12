// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable();
  console.log(document.getElementById('dataTable_length').childNodes[0].childNodes[0]);
  document.getElementById('dataTable_length').childNodes[0].childNodes[0].nodeValue = ''
  document.getElementById('dataTable_length').childNodes[0].childNodes[2].nodeValue = ' 개씩 보기'
});
