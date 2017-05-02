$('.Admin').ready(() => {
  $('#toc-open-button').on('click', (e) => {
    e.preventDefault()
    $('.ui.sidebar#sidebar').sidebar('toggle')
  })
})
