class Group < ActiveRecord::Base
	has_many :users, :through=>:memberships#, :select => "opinions.rating, opinions.comment, movies.*"
end
