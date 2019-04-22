# frozen_string_literal: true

class Group < ApplicationRecord
  validates :number, :color, :name, presence: true
  validates :name, uniqueness: { scope: :flr_id,
                                 message: ': Группа с таким названием уже существует' }
  validates :number, uniqueness: { scope: :flr_id,
                                   message: ': Группа с таким номером уже существует' }
  validates :color, uniqueness: { scope: :flr_id,
                                  message: ': Группа с таким цветом уже существует' }
  belongs_to :flr

  belongs_to :user
  has_many :stories, dependent: :destroy
  accepts_nested_attributes_for :stories, reject_if: :all_blank

  has_many :reviews, through: :stories

  def all_stories
    stories.map(&:name).join("\r\n\r\n")
  end

  def all_stories=(names)
    self.stories = []
    names.split("\r\n\r\n").map do |name|
      if Story.find_by(name: name.strip).nil?
        story = Story.create!(name: name.strip)
        stories << story
      end
    end
  end
end
