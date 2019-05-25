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
  before_save :all_stories_save, if: :new_record?



  accepts_nested_attributes_for :stories, reject_if: :all_blank

  has_many :reviews, through: :stories

  def all_stories
    stories.map(&:name).join("\r\n\r\n")
  end

  def all_stories=(names)
    @stories = []
    names.split("\r\n\r\n").map do |name|
      story_name = Story.find_or_create_by(name: name.strip)
     @stories << name
    end
  end

  def all_stories_save
    self.stories = []
    @stories.map do |name|
      story = Story.find_or_create_by(name: name.strip)
      self.stories << story
    end
  end

end
