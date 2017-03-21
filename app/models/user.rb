class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :rental_lists
  has_many :films, through: :rental_lists

  def self.search(search)
    where("email LIKE ?", "%#{search}%")
  end

  def archive
    self.update(archived_at: Time.now)
  end

  def unarchive
    self.update(archived_at: '')
  end

  def make_admin
    self.update(admin: true)
  end

  def undo_admin
    self.update(admin: false)
  end

  ## override devise method
  def active_for_authentication?
    super && archived_at.nil?
  end

  ## override devise method, see config -> locales -> devise.en.yml
  ## look at user: archived: for message
  def inactive_message
    archived_at.nil? ? super : :archived
  end
end