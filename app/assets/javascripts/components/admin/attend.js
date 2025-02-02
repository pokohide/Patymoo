import axios from 'axios'

$('.Admin.attends.new').ready(() => {

  /* メンバーを名前から検索 */
  const setSearch = () => {
    const eventId = $('#event_id').val()
    $('.ui.search').search({
      minCharacters: 2,
      debug: true,
      apiSettings: {
        url: '/api/v1/members/search?q={query}&event_id=' + eventId,
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
  const changeState = ($field, state, member) => {
    if (state === 'attend') {
      $field.find('.ui.dimmer#attending').dimmer('show')
      $field.find('.ui.dimmer#attending').dimmer({ closable: false })
      $field.find('.ui.dimmer#attending .attending-member-name').text(member.name)
      $field.find('.member-id').val(member.id)
      $field.addClass('attend-true')
    } else if (state === 'disattend') {
      $field.find('.ui.dimmer#attending').dimmer('toggle')
      $field.find('.ui.dimmer#attending').dimmer('hide')
      $field.removeClass('attend-true')
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
    setCheckbox()
    e.preventDefault()
  })

  const setCheckbox = () => {
    $('.Admin.attends .members-field .attend-checkbox').checkbox({
      onChecked: function() {
        const _this = $(this)
        const $field = $(this).parent().parent().parent('#member-fields')
        const eventId = $('#event_id').val()
        const member = getMember($field)
        showLoading($field)
        attendMember(eventId, member)
        .then((response) => {
          const { data: { member_id, messages } } = response
          _this.checkbox('set disabled')
          hideLoading($field)
          changeState($field, 'attend', { id: member_id, name: member.name })
          console.log(messages)
        })
        .catch((error) => {
          _this.checkbox('set unchecked')
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
          _this.checkbox('set checked')
          hideLoading($field)
          console.log(error)
        })
      }
    })
  }

  $('.attend-true .ui.dimmer#attending').dimmer('set active')
  $('.attend-true .attend-checkbox').checkbox('set checked')
  setSearch()
  setCheckbox()
})
