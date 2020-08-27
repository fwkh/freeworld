$(document).ready(function(){

$('.count').each(function() {
  var $this = $(this),
      countTo = $this.attr('data-count').replace(/,/g, '');

  $({ countNum: $this.text()}).animate({
    countNum: countTo
  },

  {

    duration: 1000,
    easing:'linear',
    step: function() {
      $this.text(Math.floor(this.countNum));
    },
    complete: function() {
      $this.text(freemon.string.formatComma(this.countNum));
      //alert('finished');
    }
  });
});
});
