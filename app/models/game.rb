class Game < ActiveRecord::Base
  belongs_to :group
  has_many :particips
  has_many :players, :through=>:particips, :source=>:user, :select=>"users.*, particips.rank, particips.chips gchips"
  
  def type_to_s
    game_type=='cash' ? I18n.t('game_type_cash'):I18n.t('game_type_tourney')
  end
  
  def calcul_ranks
    players.sort_by {|p| -p.gchips.to_i }.each_with_index {|p,i| 
      # this simply does not work....
      # p.rank = (i+1)
      pa = Particip.find(:first, :conditions=>"user_id=#{p.id} and game_id=#{self.id}")
      pa.rank = (i+1)
      pa.save
      }
  end
  
end
