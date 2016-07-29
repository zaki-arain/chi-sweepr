get '/' do
  @address = Address.last
  erb :'index'
end
