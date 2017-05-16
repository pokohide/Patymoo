// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require chartkick
//= require semantic-ui

import 'libs/base'
import 'components/base'

$(document).ready(() => {
  $('.ui.dropdown').dropdown({ on: 'hover' })
  //$('.ui.checkbox').checkbox()
  $('.ui.accordion').accordion()

  /* notificationの閉じるをクリックしたら閉じる */
  $('.ui.message .close.icon').on('click', function() {
    $(this).parent().fadeOut()
  })

  /* notificationは何もしなくても10秒後に消滅する */
  setTimeout(() => {
    $('.ui.message').each(function() {
      if(!$(this).attr('data-flash')) $(this).fadeOut('normal')
    })
  }, 10000)

  // $('img.lazy').lazyload({ effect : "fadeIn" })
})
