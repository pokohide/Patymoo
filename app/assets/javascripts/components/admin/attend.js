$('.Admin').ready(() => {

  /* フィールドを追加する */
  $('.ui.form').on('click', '.remove_fields', function(e) {
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('section.ui.segment').fadeOut()
    e.preventDefault()
  })

  /* フィールドを削除する */
  $('.ui.form').on('click', '.add_fields', function(e) {
    const time = new Date().getTime()
    const regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    $('.ui.dropdown').dropdown({ on: 'hover' })
    $('.ui.accordion').accordion()
    e.preventDefault()
  })
})
