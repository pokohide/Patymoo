module ApplicationHelper

  def default_meta_tags
    {
      site: 'ユーザ管理サービス Ptymoo',
      reverse: true,
      separator: '|',
      keywords: '大学生,管理サービス,Ptymoo',
      title: '',
      charset: 'utf-8',
      viewport: 'width=device-width, initial-scale=1.0',
      description: 'Partyは簡単にユーザの管理をできるサービスです。',
      open_graph: {
        title: 'ユーザ管理サービス Ptymoo',
        url: 'https://patymoo.herokuapp.com/'
      },
      og: {
        title: 'ユーザ管理サービス Ptymoo',
        type: 'website',
        url: request.original_url,
        image: '',
        site_name: 'Patymoo',
        description: 'Patymooは簡単にユーザの管理をできるサービスです。',
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary',
        site: '@OthloTech',
        title: 'ユーザ管理サービス Patymoo',
        description: 'Patymooは簡単にユーザの管理をできるサービスです。',
        image: ''
      }
    }
  end
end
