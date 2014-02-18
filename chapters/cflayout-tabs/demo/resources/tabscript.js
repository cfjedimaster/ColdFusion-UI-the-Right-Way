$(document).ready(function () {
    $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
      var $target = $(e.target)
          , href = $target.attr("href")
          , tData = $target.data()
          , isRemote = tData.remoteTarget;
        
      if (isRemote != undefined && isRemote) {
          $(tData.target).load(href);
      }
    });
});