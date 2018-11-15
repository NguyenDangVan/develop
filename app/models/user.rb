class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save :downcase_email
  before_create :create_activation_digest
  has_many :favorite_for_song, class_name: "Favorite", dependent: :destroy
  has_many :favorite_songs, through: :favorite_for_song, source: :song,
    dependent: :destroy
  has_many :playlists, dependent: :destroy
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, :email, presence: true
  validates :name, length: {maximum: Settings.user.max_name_size}
  validates :age, numericality: true, :inclusion => 15..80,
    length: {maximum: Settings.user.maximum_age}
  validates :email, length: {maximum: Settings.user.maximum_email},
    uniqueness: {case_sensitive: false},
    format: {with: VALID_EMAIL_REGEX}
  # has_secure_password
  # validates :password, presence: true,
    #length: {minimum: Settings.user.minimum_password}, allow_nil: true
  has_many :comments, dependent: :destroy

  scope :search_user_name, -> (name_user) {where("name LIKE ?", "%#{name_user}%")}

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.name = auth.extra.raw_info.name
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.password_confirmation = user.password
      user.admin = true
      user.activated = true
      user.age = 21
      user.save!
    end
  end

  def User.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
    BCrypt::Password.create string, cost: cost
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update remember_digest: User.digest(remember_token)
  end

  def authenticated? attribute, token
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password? token
  end

  def forget
    update remember_digest: nil
  end

  def activate
    update activated: true, activated_at: Time.zone.now
  end

  def favorite song
    favorite_songs << song
  end

  def unfavorite song
    favorite_songs.delete(song)
  end

  def favorited? song
    favorite_songs.include? song
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private
    def downcase_email
      email.downcase!
    end

    def create_activation_digest
      self.activation_token = User.new_token
      self.activation_digest = User.digest activation_token
    end
end
