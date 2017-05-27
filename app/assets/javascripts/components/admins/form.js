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
})
