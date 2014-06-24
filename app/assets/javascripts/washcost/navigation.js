$(document).ready(function() {

  'use strict';

  var warning = true;

  function navigateAway () {
    if (window.location.pathname.indexOf('/service_level') > -1) {

      $('.footer--link-save,.navigation--subcategory--link').on('click', function () {
        warning = false;
      });

      window.onbeforeunload = function () { 
        var total = 0;

        $('input[data-percentage]').each(function (val, i) {
          var value = $(this).val().replace(/[^0-9]+/g, '');
        
          if (value)
            total = total + parseInt(value);
        });

        var text = $("div[data-alert]").attr('data-alert');

        if (parseInt(total) != 100 && warning)
          return text;
      }
    }
  }

  var _navigation = $('.navigation--subcategory'),
    _list = _navigation.find('ul'),
    _items = _navigation.find('li'),
    _active_item = _items.find('.navigation--subcategory--link-active').parent(),
    _active_index;

  function sizeNav() {

    if (_navigation.length && $(window).width() > 800) {

      _list.css({
        width: _items.width() * _items.length
      });

      _active_index = _items.index(_active_item);
      _navigation[0].scrollLeft = _active_index * _items.width() - _navigation.width() / 2;

    } else if (_navigation.length) {

      _list.css({
        width: '100%'
      });

    }

  }

  function init() {

    sizeNav();

    $(window).smartresize(function () {

      sizeNav();

    });

    navigateAway();

  }

  $('.report-delete').on('click', function() {
    return confirm('Are you sure?');
  });

  init();

});

(function($,sr){

  var debounce = function (func, threshold, execAsap) {
      var timeout;

      return function debounced () {
          var obj = this, args = arguments;
          function delayed () {
              if (!execAsap)
                  func.apply(obj, args);
              timeout = null;
          };

          if (timeout)
              clearTimeout(timeout);
          else if (execAsap)
              func.apply(obj, args);

          timeout = setTimeout(delayed, threshold || 100);
      };
  }
  // smartresize 
  jQuery.fn[sr] = function(fn){  return fn ? this.bind('resize', debounce(fn)) : this.trigger(sr); };

})(jQuery,'smartresize');