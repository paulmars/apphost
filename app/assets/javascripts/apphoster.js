$(function() {
  $('.apps-show,.apps-index').on('dragover', function(e) {
    e.stopPropagation();
    e.preventDefault();
    $('body').addClass('file-dragover');
  })

  $('.apps-show,.apps-index').on('dragleave', function(e) {
    e.stopPropagation();
    e.preventDefault();
    $('body').removeClass('file-dragover');
  })

  $('.apps-show,.apps-index').on('drop', function(e) {
    console.log('dropped');
    e.preventDefault();

    if(e.originalEvent.dataTransfer){
      if(e.originalEvent.dataTransfer.files.length) {
        e.preventDefault();
        /*UPLOAD FILES HERE*/
        file = e.originalEvent.dataTransfer.files[0];
        console.log(file);
        postIPA(file);
      }
    }
  });
});

function postIPA(ipa) {
  $('.file-upload-message h1').html('Uploading.  Stay put.')

  var data = new FormData();
  data.append('build[ipa]', ipa);

  $.ajax({
    type: 'POST',
    url: "/builds.json",
    data: data,
    processData: false,
    contentType: false,
    xhr: function() {
      var myXhr = $.ajaxSettings.xhr();
      if (myXhr.upload) {
        if (myXhr.upload.addEventListener) {
          // myXhr.upload.addEventListener('progress', function(e){
          //   var percentComplete = e.loaded / e.total;
          //   $('.upload-progress').circleProgress({ value: percentComplete - .1 });
          // }, false);
        } else if(myXhr.upload.attachEvent) {
          // myXhr.upload.attachEvent('progress', function(e) {
          //   var percentComplete = e.loaded / e.total;
          //   $('.upload-progress').circleProgress({ value: percentComplete - .1 });
          // });
        }
      }
      return myXhr;
    },
    success: function(data){
      console.log(data);
      // $('.upload-progress').circleProgress({ value: 1.0 });
      window.location.reload();
    }
  });

}
