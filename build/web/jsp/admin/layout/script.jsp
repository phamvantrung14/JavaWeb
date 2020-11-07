<script src="/Project_Shop_Computer_005/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/Project_Shop_Computer_005/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="/Project_Shop_Computer_005/ckeditor/ckeditor.js" type="text/javascript"></script>
<script src="/Project_Shop_Computer_005/ckfinder/ckfinder.js" type="text/javascript"></script>
<script src="/Project_Shop_Computer_005/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<!--<script src="/Poject_Shop_Computer_004/plugins/chart.js/Chart.min.js"></script>-->
<!-- Sparkline -->
<!--<script src="/Poject_Shop_Computer_004/plugins/sparklines/sparkline.js"></script>-->
<!-- JQVMap -->
<!--<script src="/Poject_Shop_Computer_004/plugins/jqvmap/jquery.vmap.min.js"></script>-->
<!--<script src="/Poject_Shop_Computer_004/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>-->
<!-- jQuery Knob Chart -->
<!--<script src="/Poject_Shop_Computer_004/plugins/jquery-knob/jquery.knob.min.js"></script>-->
<!-- daterangepicker -->
<script src="/Project_Shop_Computer_005/plugins/moment/moment.min.js"></script>
<script src="/Project_Shop_Computer_005/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="/Project_Shop_Computer_005/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="/Project_Shop_Computer_005/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="/Project_Shop_Computer_005/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="/Project_Shop_Computer_005/dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<!--<script src="/Poject_Shop_Computer_004/dist/js/pages/dashboard.js"></script>-->
<!-- AdminLTE for demo purposes -->
<script src="/Project_Shop_Computer_005/dist/js/demo.js"></script>

<script type="text/javascript" language="javascript" src="/Poject_Shop_Computer_004/dist/js/paginate.js"></script>
<script type="text/javascript" src="/Poject_Shop_Computer_004/dist/js/custom.js"></script>
 
<script type="text/javascript">
    var editorDes = CKEDITOR.replace('desId');
    CKFinder.setupCKEditor(editorDes,'../ckfinder/');
</script>
<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true,
      "autoWidth": false,
    });
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>
</body>
</html>