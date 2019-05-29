# frozen_string_literal: true

class Flr < ApplicationRecord
  validates_uniqueness_of :number
  default_scope { order :number }
  has_many :groups, -> { joins(:flr).order('flrs.number') }, dependent: :destroy

  has_many :pages, dependent: :destroy


  def self.retrieve_last_page
    @flr = Flr.find_by(current: true)
    @flr.last_page = ForumPages.new(@flr.link).last_page
    @flr.save
  end


end
