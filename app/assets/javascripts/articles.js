$(function() {
    $('.edit_article input[type=checkbox]').click(function(){
        $(this).parents('form:first').submit();
    });
});