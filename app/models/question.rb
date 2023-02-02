class Question < ApplicationRecord
  serialize :questions
  scope :question, -> { select(:questions)
                        .last[:questions]
                        .sample
                         }
end
