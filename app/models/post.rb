class Post < ApplicationRecord
   validates :title, presence: true
   validates :content, length: { minimum: 250 }
   validates :summary, length: { maximum: 250 }
   validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
   validate :clickbait

   def clickbait
      # possible_title = %w([Wont Believe Secret Top Guess])
      unless self.title.match?(/(won't|believe|secret|top0-9|guess)/i)
         self.errors.add(:title, "invalid title")
      end
   end
end
