class Game < ApplicationRecord
  has_one :questions
  serialize :questions
  scope :question, -> { select(:questions)
                        .last[:questions]
                        .sample
                         }

  # after_initialize do |b|
  #   b.questions = [] if b.questions == nil
  # end
end
