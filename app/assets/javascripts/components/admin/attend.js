import axios from 'axios'

$('.Admin').ready(() => {

  /* メンバーを名前から検索 */
  const setSearch = () => {
    $('.ui.search').search({
      minCharacters: 2,
      debug: true,
      apiSettings: {
        url: '/api/v1/members/search?q={query}',
        onResponse: (res) => {
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
  }

  /* メンバーを出席させる */
  const attendMember = (eventId, member) => {

  }

  /* メンバーを出席停止させる */
  const disattendMember = (eventId, memberId) => {
    const csrf_token = $('meta[name="csrf-token"]').attr('content')
    axios.delete('/api/v1/members/attend', {
      params: {
        event_id: eventId,
        member_id: memberId
      },
      headers: { 'X-CSRF-Token': csrf_token }
    })
    .then((response) => {
      console.log(response)
    })
    .catch((error) => {
      console.log(error)
    })
  }

  disattendMember(1, 2)

  /* 出席のチェックボックスを監視 */
  $('.members-field').on('change', '#attend-check', function() {
    if ($(this).prop('checked')) {
      console.log('出席')
      const $fields = $(this).parent().parent().parent('#member-fields')
      console.log($fields)
    } else {
      console.log('出席停止')
    }
  })

  /* フィールドを追加する */
  $('.ui.form').on('click', '.remove_fields', function(e) {
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('#member-fields').fadeOut()
    e.preventDefault()
  })

  /* フィールドを削除する */
  $('.ui.form').on('click', '.add_fields', function(e) {
    const time = new Date().getTime()
    const regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    $('.ui.dropdown').dropdown({ on: 'hover' })
    $('.ui.accordion').accordion()
    setSearch()
    e.preventDefault()
  })

  setSearch()
})
