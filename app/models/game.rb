class Game < ApplicationRecord
  serialize :questions
  scope :question, -> { select(:questions).last[:questions].sample }

  after_initialize do |b|
    b.questions = [] if b.questions == nil
  end
end
