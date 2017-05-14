json.messages do
  json.array! @messages do |message|
    json.call(message, :body, :type)
  end
end
