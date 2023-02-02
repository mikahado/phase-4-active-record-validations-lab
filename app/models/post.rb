class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }

    validate :clickbate?

    # below code i had to look up. was not at all in lesson on validations, but learned from it anyway

    # regexp 

    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]

    def clickbate?
        if CLICKBAIT_PATTERNS.none? { |p| p.match title }
            errors.add(:title, "must be clickbait")
        end
    end
end
