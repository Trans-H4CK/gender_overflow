Ninja.behavior({
    '.error_explanation, .errorExplanation, #error_explanation, #errorExplanation': {
      transform: function(elem) {
        $(elem).append('<a href="#" class="close">&times;</a>');
        $(elem).attr("data-alert", true);
      }
    }
  });