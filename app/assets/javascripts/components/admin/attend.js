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
              memberId: member.id,
              twitter: member.twitter,
              facebook: member.facebook,
              connpass: member.connpass,
              grade: member.grade,
              grade_i18n: member.grade_i18n,
              school_type: member.school_type,
              school_type_i18n: member.school_type_i18n,
              school_name: member.school_name,
              department: member.department,
              phone_number: member.phone_number,
              note: member.note
            })
          })
          return response
        }
      },
      onSelect: function(result, response) {
        const $elem = $(this).parent().parent().parent()
        $elem.find('.member-id').val(result.memberId)
        $elem.find('.member-school-type').val(result.school_type)
        $elem.find('.member-school-type-selection .text').text(result.school_type_i18n)
        $elem.find('.member-school-name').val(result.school_name)
        $elem.find('.member-department').val(result.department)
        $elem.find('.member-grade').val(result.grade)
        $elem.find('.member-grade-selection .text').text(result.grade_i18n)
        $elem.find('.member-email').val(result.price)
        $elem.find('.member-phone-number').val(result.phone_number)
        $elem.find('.member-twitter').val(result.twitter)
        $elem.find('.member-facebook').val(result.facebook)
        $elem.find('.member-connpass').val(result.connpass)
        $elem.find('.member-note').val(result.note)
      }
    })
  }

  /* メンバーを出席させる */
  const attendMember = (eventId, member) => {
    const authenticity_token = $('input[name="authenticity_token"]').val()
    const csrf_token = $('meta[name="csrf-token"]').attr('content')
    return axios.post('/api/v1/members/attend', {
      event_id: eventId,
      member: member
    }, {
      headers: { 'X-CSRF-Token': csrf_token }
    })
  }

  /* メンバーを出席停止させる */
  const disattendMember = (eventId, memberId) => {
    const csrf_token = $('meta[name="csrf-token"]').attr('content')
    return axios.delete('/api/v1/members/attend', {
      params: {
        event_id: eventId,
        member_id: memberId
      },
      headers: { 'X-CSRF-Token': csrf_token }
    })
  }

  /* メンバー要素を取得する */
  const getMember = ($elem) => {
    return {
      id: $elem.find('.member-id').val(),
      name: $elem.find('.member-name').val(),
      school_type: $elem.find('.member-school-type').val(),
      school_name: $elem.find('.member-school-name').val(),
      department: $elem.find('.member-department').val(),
      grade: $elem.find('.member-grade').val(),
      email: $elem.find('.member-email').val(),
      twitter: $elem.find('.member-twitter').val(),
      facebook: $elem.find('.member-facebook').val(),
      connpass: $elem.find('.member-connpass').val(),
      note: $elem.find('.member-note').val()
    }
  }

  /* 出席のチェックボックスを監視 */
  $('.members-field').on('change', '#attend-check', function() {
    const $fields = $(this).parent().parent().parent('#member-fields')
    const eventId = $('#event_id').val()
    if ($(this).prop('checked')) {
      console.log('出席')
      const $fields = $(this).parent().parent().parent('#member-fields')
      const member = getMember($fields)
      $fields.find('.ui.dimmer').dimmer('show')
      attendMember(eventId, member)
      .then((response) => {
        // ここでresponseにmemberIdが含まれていれば、memberIdを更新する。
        $fields.find('.ui.dimmer').dimmer('hide')
        console.log(response)
      })
      .catch((error) => {
        $fields.find('.ui.dimmer').dimmer('hide')
      })
    } else {
      const memberId = $fields.find('.member-id').val()
      $fields.find('.ui.dimmer').dimmer('show')
      disattendMember(eventId, memberId)
      .then((response) => {
        $fields.find('.ui.dimmer').dimmer('hide')
      })
      .catch((error) => {
        $fields.find('.ui.dimmer').dimmer('hide')
        console.log(error)
      })
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
