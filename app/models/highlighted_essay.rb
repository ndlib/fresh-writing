class HighlightedEssay < ActiveRecord::Base
  store :data, accessors: [ :body, :biography ]

  belongs_to :issue
  belongs_to :essay_style
  belongs_to :essay

  validates_presence_of :essay

  delegate :title, :friendly_id, to: :essay
end