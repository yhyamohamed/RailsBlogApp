class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_writer :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :name, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true,message: 'pls enter a valid name '
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'pls enter a valid email address' }

  def login
    @login || self.name || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup

    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(email)= :value OR lower(name)= :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:name) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
