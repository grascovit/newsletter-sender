//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap
//= require tinymce
//= require_tree .

$(document).ready(function () {
  tinymce.remove();
  tinymce.init({
    selector: '.tinymce',
    language: 'pt_BR',
    plugins: 'code',
    toolbar: 'undo redo | bold italic underline | ' +
      'fontselect fontsizeselect forecolor backcolor | ' +
      'alignleft aligncenter alignright alignjustify | ' +
      'bullist numlist outdent indent code'
  });
});
