json.array!(@attachments) do |attachment|
  json.extract! attachment, :id, :title, :user_id
  json.url attachment_url(attachment, format: :json)
end
