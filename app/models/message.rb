# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :page
  belongs_to :review, optional: true
  validates_uniqueness_of :body
  validates_presence_of :body
end
