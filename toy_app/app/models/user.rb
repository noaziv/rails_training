class User < ActiveRecord::Base
	has_many :microposts

	validates :name, presence: true, 
					 length: { minimum: 2 }

end
