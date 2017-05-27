import './events/form'
import './members/form'
import './attend'

$('.Admin').ready(() => {
  $('#toc-open-button').on('click', (e) => {
    e.preventDefault()
    $('.ui.sidebar#sidebar').sidebar('toggle')
  })

  $('.ui.dropdown').dropdown()
  $('.ui.table.sortable').tablesort()
  $('.ui.table.sortable').on('tablesort:start', function(event, tablesort) {
  	console.log("Starting the sort...");
  });
  $('.ui.table.sortable').on('tablesort:complete', function(event, tablesort) {
  	console.log("Sort finished!");
  });
})
