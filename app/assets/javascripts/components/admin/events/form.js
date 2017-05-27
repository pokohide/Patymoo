$('.Admin.events.new, .Admin.events.create, .Admin.events.edit, .Admin.events.update').ready(() => {

  /* バリデーション */
  $('.ui.form').form({
    fields: {
      name: {
        identifier: 'event_name',
        rules: [
          { type: 'empty', prompt: 'イベント名を入力してください' }
        ]
      }
    },
    inline: true,
    on: 'blur'
  })

  $('#calendar').calendar({
    text: {
      days: ['日', '月', '火', '水', '木', '金', '土'],
      months: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
      monthsShort: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
      today: '今日',
      now: '今',
      am: 'AM',
      pm: 'PM'
    }
  })
})
