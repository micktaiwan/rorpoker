class GroupSettings
  attr_accessor :default_place
  
  def initialize
    @default_place = 'none'
  end
  
end


class Group < ActiveRecord::Base
  has_many :memberships
	has_many :users, :through=>:memberships #, :select => "opinions.rating, opinions.comment, movies.*"
  has_many :games
 
  serialize :settings, GroupSettings
  
  def init_settings
    if self.settings == nil
      self.settings = GroupSettings.new 
      self.save
    end
  end

  # return users ordered by winners
  # type is either :cash or :tourney
  def rankings(type)
    users.sort_by {|u| u.virtual_rank(type,self)}
  end
  
end
