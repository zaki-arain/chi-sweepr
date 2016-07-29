require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  # has_many :restaurants, foreign_key: :creator_id
  # has_many :reviews, foreign_key: :author_id
  # has_many :reviewed_restaurants, through: :reviews, source: :restaurant

  validates_presence_of :username, :email, :password_hash
  validates :username, {uniqueness: true}

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def create(params)
    @user = User.new(username: params[:username], email: params[:email])
    @user.password = params[:password]
    @user.save!
  end

  def self.authenticate(email, password)
    @user = User.find_by_email(email)
    return nil unless @user

    if @user.password == password
      return @user
    end
  end

end
