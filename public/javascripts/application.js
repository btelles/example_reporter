function hoverDetailReports() {
  $("#reports table tbody tr").click(function(){
      $.getScript('/reports/'+$(this).attr('rel')+'.js');
      $("#reports table tbody tr").removeClass('highlight');
      $(this).addClass("highlight");
  });
}
$(document).ready( function() {
   hoverDetailReports();
})
