module MembersHelper

  def twitter_link tw
    return '未登録' if tw.blank?
    twitter = tw.delete('@')
    link_to "@#{twitter}", "https://twitter.com/#{twitter}",
      target: "_blank", class: 'twitter-link'
  end

  def facebook_link fb
    return '未登録' if fb.blank?
    link_to fb, "https://www.facebook.com/#{fb}/",
      target: "_blank", class: 'facebook-link'
  end

  def mail_link mail
    return '未登録' if mail.blank?
    mail_to mail, mail, class: 'mail-link'
  end

  def connpass_link connpass
    return '未登録' if connpass.blank?
    link_to connpass, "https://connpass.com/user/#{connpass}",
      target: "_blank", class: 'connpass-link'
  end
end
