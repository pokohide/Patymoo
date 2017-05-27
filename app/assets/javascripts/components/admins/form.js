$('.Object.admins.new, .Object.admins.create').ready(() => {

  /* バリデーション */
  $('.ui.form').form({
    fields: {
      username: {
        identifier: 'admin_username',
        rules: [
          { type: 'empty', prompt: '組織名を入力してください' }
        ]
      },
      email: {
        identifier: 'admin_email',
        rules: [
          { type: 'empty', prompt: 'メールアドレスを入力してください' },
          { type: 'email', prompt: 'メールアドレスが不適切です' }
        ]
      },
      password: {
        identifier: 'admin_password',
        rules: [
          { type: 'empty', prompt: 'パスワードを入力してください' },
          { type: 'length[6]', prompt: 'パスワードは6文字以上で入力してください' }
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
