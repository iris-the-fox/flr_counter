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

  def all_pages
    range = (self.first_page..self.last_page).to_a - self.pages.pluck(:number)
    range.each do |page|
      some_page = PageWS.new(page, self.link)
      @page = self.pages.find_or_create_by(body: some_page.body, link: some_page.link, number: some_page.number)
    end
    self.save
  end


end
