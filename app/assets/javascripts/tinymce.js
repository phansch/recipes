document.addEventListener("turbolinks:load", function(){
  tinymce.remove();
  tinymce.init({
    selector: '#recipe_instructions',
    toolbar: 'undo redo | bold italic blockquote | link',
    menubar: false,
    branding: false,
    min_height: 100
  });
});
