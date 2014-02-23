Ninja.behavior({
    'Select.category_selector': {
      transform: function(elem) {
         $(elem).selectBoxIt({});
      }
    },
    'body.categories.index .category-expand': {
      click: function(evnt, elem) {
        evnt.preventDefault();

        $elem = $(elem);

        $elem.parents('li').first().find('.children').first().toggle();

        if ($elem.text() == $elem.data('text-show')) {
          $elem.text($elem.data('text-hide'));
        } else {
          $elem.text($elem.data('text-show'));
        }
      }
    }
  });