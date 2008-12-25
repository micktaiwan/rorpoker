require 'digest/sha1'

# this model expects a certain database layout and its based on the name/login pattern. 
class User < ActiveRecord::Base
  has_many :memberships
	has_many :groups, :through=>:memberships, :select => "memberships.chips, groups.*" # chips is for cash games
  
  #validates_uniqueness_of :email, :case_sensitive => false
  validates_presence_of :password, :password_confirmation, :if => :validate_password_confirmation?
  validates_confirmation_of :password,:if => :validate_password_confirmation?

  before_create :crypt_password
  before_update :crypt_password_on_update

  def self.authenticate(email, pass)
    find(:first, :conditions=>["email=? AND password=?", email, sha1(pass)])
  end  
  
  # just return a number does not return a rank, just sort all the users to have a rank
  # type is either :cash or :tourney
  def virtual_rank(type, group)
    return Membership.find(:first,:conditions=>"user_id=#{self.id} and group_id=#{group.id}").chips if type == :cash
    return tourney_rank(group) if type == :tourney
    raise "invalid type for rankings (#{type.to_s}})"
  end
  
  def chips(group_id)
    Membership.find(:first,:conditions=>"user_id=#{self.id} and group_id=#{group_id}").chips
  end
  
  def tourney_rank(group)
    return 1 # TODO
  end
  
  protected
  
  def self.sha1(pass)
    Digest::SHA1.hexdigest("laphrasedelamort#{pass}quitue")
  end
  
  def crypt_password
    write_attribute("password", self.class.sha1(password))
  end
  
  
  def crypt_password_on_update
    crypt_password if validate_password_confirmation?
  end
  
  def validate_password_confirmation?
    (password and password_confirmation)
  end  
  
end

