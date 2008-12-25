class Game < ActiveRecord::Base
  belongs_to :group
  
  def type_to_s
    self.game_type=='cash' ? I18n.t('game_type_cash'):I18n.t('game_type_tourney')
  end
  
end
