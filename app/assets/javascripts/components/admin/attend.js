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
    console.log('出席中...')

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
    console.log('出席中止中...')

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

  /* ローディング表示 */
  const showLoading = $field => {
    $field.find('.ui.dimmer#loading').dimmer('show')
  }

  /* ローディング非表示 */
  const hideLoading = $field => {
    $field.find('.ui.dimmer#loading').dimmer('hide')
  }

  /* 表示を状態で調整 */
  const changeState = ($field, state, memberId) => {
    if (state === 'attend') {
      $field.find('.ui.dimmer#attending').dimmer('show')
      $field.find('.member-id').val(memberId)
    } else if (state === 'disattend') {
      $field.find('.ui.dimmer#attending').dimmer('hide')
    }
  }

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

  const setCheckbox = () => {
    $('.Admin.attends .members-field .attend-checkbox').checkbox({
      onChecked: function() {
        const $field = $(this).parent().parent().parent('#member-fields')
        const eventId = $('#event_id').val()
        const member = getMember($field)
        showLoading($field)
        attendMember(eventId, member)
        .then((response) => {
          const { data: { member_id, messages } } = response
          hideLoading($field)
          changeState($field, 'attend', member_id)
          console.log(messages)
        })
        .catch((error) => {
          hideLoading($field)
          console.log(error)
        })
      },
      onUnchecked: function() {
        const $field = $(this).parent().parent().parent('#member-fields')
        const eventId = $('#event_id').val()
        const memberId = $field.find('.member-id').val()
        showLoading($field)
        disattendMember(eventId, memberId)
        .then((response) => {
          hideLoading($field)
          changeState($field, 'disattend')
          console.log(response)
        })
        .catch((error) => {
          hideLoading($field)
          console.log(error)
        })
      }
    })
  }

  $('.attend-true .ui.dimmer#attending').dimmer('show')
  $('.attend-true .attend-checkbox').checkbox('set checked')
  setSearch()
  setCheckbox()
})
