$('.Admin').ready(() => {
  $('#toc-open-button').on('click', (e) => {
    e.preventDefault()
    $('.ui.sidebar#sidebar').sidebar('toggle')
  })

  $('.ui.dropdown').dropdown()
  $('.ui.table').tablesort()
  $('.ui.table').on('tablesort:start', function(event, tablesort) {
  	console.log("Starting the sort...");
  });
  $('.ui.table').on('tablesort:complete', function(event, tablesort) {
  	console.log("Sort finished!");
  });
})
