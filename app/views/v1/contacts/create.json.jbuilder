json.data do
  json.user do
    json.partial! 'contact', contact: @contact
  end
end