class Game < ActiveRecord::Base
  belongs_to :group
  has_many :particips
  has_many :players, :through=>:particips, :source=>:user, :select=>"users.*, particips.rank, particips.chips"
  
  def type_to_s
    self.game_type=='cash' ? I18n.t('game_type_cash'):I18n.t('game_type_tourney')
  end
  
end
