json.paginator do
  json.has_next !@members.last_page? ? true : false
  json.total_count @members.total_count
  json.page @members.current_page
end

json.members do
  json.array! @members do |member|
    json.call(member, :id, :name, :email, :twitter, :facebook, :connpass,
      :grade, :grade_i18n, :school_type, :school_type_i18n,
      :school_name, :department, :phone_number, :note)
  end
end
