class Question < ApplicationRecord
  serialize :questions
  scope :question, -> { select(:questions)
                        .last[:questions]
                        .shuffle.first(3)
                         }
end
