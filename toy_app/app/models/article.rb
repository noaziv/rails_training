class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy

	scope :titled_article, -> { where("title LIKE 'Article%'") }
	#default_scope { where("title LIKE 'Article%'") }

  	validates :title, presence: true,
                      length: { minimum: 5,
                      		   	too_short: "%{count} chars is the minimum allowed darling" }
   	#validates :text, presence: true, 
   	#				 uniqueness: true, 
   	#				 strict: TextGenerationException
   	
   	validates_each :title, :text do |record, attr, value|
    	record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  	end

 #  	after_initialize do |article|
	# 	puts "You have initialized an object!"
	# end

	# after_find do |article|
	# 	puts "You have found an object!"
	# end

	after_destroy :log_destroy_action
 
	def log_destroy_action
		puts 'Article destroyed'
	end
end
