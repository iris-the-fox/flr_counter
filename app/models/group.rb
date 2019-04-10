class Group < ApplicationRecord
	validates :number, :color, :name, presence: true
	validates :name, uniqueness: { scope: :flr_id,
    message: ": Группа с таким названием уже существует" }
    validates :number, uniqueness: { scope: :flr_id,
    message: ": Группа с таким номером уже существует" }
    validates :color, uniqueness: { scope: :flr_id,
    message: ": Группа с таким цветом уже существует" }
	belongs_to :flr, dependent: :destroy
	belongs_to :user, dependent: :destroy
	has_many :stories

	def all_stories
      self.stories.map(&:name).join("\r\n\r\n")
    end

    def all_stories=(names)
      self.stories = names.split("\r\n\r\n").map do |name|
        self.stories.where(name: name.strip).first_or_create!
      end
    end


end
