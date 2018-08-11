//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require tinymce
//= require_tree .

$(document).on('turbolinks:load', function() {
  tinymce.remove();
  tinymce.init({
    selector: '.tinymce',
    language: 'pt_BR',
    toolbar: 'undo redo | bold italic underline | ' +
      'fontselect fontsizeselect forecolor backcolor | ' +
      'alignleft aligncenter alignright alignjustify | ' +
      'bullist numlist outdent indent'
  });
});
