class Group < ApplicationRecord
	validates :number, :color, :name, presence: true
	validates :name, uniqueness: { scope: :flr_id,
    message: ": Группа с таким названием уже существует" }
  validates :number, uniqueness: { scope: :flr_id,
    message: ": Группа с таким номером уже существует" }
  validates :color, uniqueness: { scope: :flr_id,
    message: ": Группа с таким цветом уже существует" }
	belongs_to :flr
	belongs_to :user
	has_many :stories, dependent: :destroy
  default_scope {order :number}

	def all_stories
    self.stories.map(&:name).join("\r\n\r\n")
  end

  def all_stories=(names)
    self.stories = names.split("\r\n\r\n").map do |name|
      Story.create!(name: name.strip, group_id: self.id)
    end
  end


end
