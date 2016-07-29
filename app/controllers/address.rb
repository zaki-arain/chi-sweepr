post '/address' do
  @address = Address.new(params[:address])
  @address.user_id = current_user
  @address.save

  redirect '/'
end
