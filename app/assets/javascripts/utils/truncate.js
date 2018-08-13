var truncateText = function(length) {
  $('.truncate').each(function() {
    var originalText = $(this).text();
    var readMoreText = $(this).data('read-more') || '...';
    var maxLength = $(this).data('max-length') - readMoreText.length;
    var readMoreSpan = "<span href='' class='read-more' data-original-text='" + originalText + "'>" + readMoreText + "</span>";
    var truncatedText = originalText.substr(0, maxLength) + readMoreSpan;

    $(this).html(truncatedText);
  });

  $('.read-more').click(function() {
    var originalText = $(this).data('original-text');
    var truncatedElement = $(this).parent();

    truncatedElement.text(originalText);
  });
};
