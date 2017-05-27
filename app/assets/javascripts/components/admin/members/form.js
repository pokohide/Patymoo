$('.Admin.members.new, .Admin.members.create').ready(() => {

  /* バリデーション */
  $('.ui.form').form({
    fields: {
      name: {
        identifier: 'member_name',
        rules: [
          { type: 'empty', prompt: '名前を入力してください' }
        ]
      }
    },
    inline: true,
    on: 'blur'
  })
})
