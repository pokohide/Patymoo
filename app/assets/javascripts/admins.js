$(document).ready(function() {
  $('.ui.form').form({
    fields: {
      email: {
        identifier: 'email',
        rules: [
          { type: 'empty', prompt: 'メールアドレスを入力してください' },
          { type: 'email', prompt: 'メールアドレスが不適切です' }
        ]
      },
      username: {
        identifier: 'username',
        rules: [
          { type: 'empty', prompt: '組織名を入力してください' }
        ]
      },
      password: {
        identifier: 'password',
        rules: [
          { type: 'empty', prompt: 'パスワードを入力してください' },
          { type: 'length[6]', prompt: 'パスワードは6文字以上で入力してください' }
        ]
      }
    },
    inline: true,
    on: 'blur'
  })


  $('.toc-open-button').on('click', function(e) {
    e.preventDefault()
    $('.ui.sidebar#sidebar').sidebar('push page')
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
