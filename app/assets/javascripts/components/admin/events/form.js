$('.Admin.events.new, .Admin.events.create').ready(() => {

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
})
