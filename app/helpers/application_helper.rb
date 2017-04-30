module ApplicationHelper

  def default_meta_tags
    {
      site: 'ユーザ管理サービス Party',
      reverse: true,
      separator: '|',
      keywords: '大学生,管理サービス,Party',
      title: '',
      charset: 'utf-8',
      viewport: 'width=device-width, initial-scale=1.0',
      description: 'Partyは簡単にユーザの管理をできるサービスです。',
      open_graph: {
        title: '名古屋のサークル・イベント情報サイト BeeApp',
        url: 'http://www.beeapp.be'
      },
      og: {
        title: 'ユーザ管理サービス Party',
        type: 'website',
        url: 'http://www.beeapp.be',
        #url: request.original_url,
        image: '',
        site_name: 'BeeApp',
        description: 'Partyは簡単にユーザの管理をできるサービスです。',
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary',
        site: '@OthloTech',
        title: 'ユーザ管理サービス Party',
        description: 'Partyは簡単にユーザの管理をできるサービスです。',
        image: ''
      }
    }
  end
end
