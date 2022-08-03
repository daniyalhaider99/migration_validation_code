class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.name.start_with? 'N'
      record.errors.add :name, "Need a name starting with N please!"
    end
    unless record.email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors.add :email, "is not valid"
    end
  end
end

class Player < ApplicationRecord
  belongs_to :team

  after_create do
    puts "You Created a new Player"
  end

  validates_with MyValidator
  validates :name, :team, presence: true
  validates_each :name do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end

  validates :age, numericality: {greater_than_or_equal_to: 18}, presence: true
  validates :ratings, numericality: true
  validates :games_played, numericality: {only_integer: true}

  validate :start_with_n




  def start_with_n
    unless record.name.start_with? 'N'
      record.errors.add :name, "Need a name starting with N please!"
    end
  end
end
