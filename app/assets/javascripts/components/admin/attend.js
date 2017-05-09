$('.Admin').ready(() => {

  /* フィールドを追加する */
  $('.ui.form').on('click', '.remove_fields', function(e) {
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('section.ui.segment').fadeOut()
    e.preventDefault()
  })

  /* フィールドを削除する */
  $('.ui.form').on('click', '.add_fields', function(e) {
    const time = new Date().getTime()
    const regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    $('.ui.dropdown').dropdown({ on: 'hover' })
    $('.ui.accordion').accordion()
    e.preventDefault()
  })

  /* メンバーを名前から検索 */
  $('.ui.search').search({
    minCharacters: 2,
    debug: true,
    apiSettings: {
      url: '/api/v1/members/search?q={query}',
      onResponse: (res) => {
        console.log(response)
        let response = { results: [] }
        const maxResults = 8
        $.each(res.members, (index, member) => {
          if (index > maxResults) return false
          console.log(member)
          response.results.push({
            title: member.name,
            price: member.email,
            description: `${member.school_name} ${member.grade_i18n}`,
            //id: member.id,
            twitter: member.twitter,
            facebook: member.facebook,
            connpass: member.connpass,
            grade: member.grade,
            school_type: member.school_type,
            school_name: member.school_name,
            department: member.department,
            phone_number: member.phone_number,
            note: member.note
          })
        })
        return response
      }
    },
    onSelect: (result, response) => {
      console.log(result)
    }
  })
})
