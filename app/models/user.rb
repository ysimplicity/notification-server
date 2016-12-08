class User
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  
  field :uid, type: String
  field :email, type: String
  field :token, type: String
  field :invalid_token, type: Boolean, default: false
  
  validates :uid, uniqueness: {scope: :token}, allow_blank: true
  validates :email, presence: true, if: 'uid.present?'.freeze
  validates :token, presence: true, uniqueness: true
  
  def iid
    @iid ||= GoogleInstanceIdClient.new(self)
  end
end
