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
})
