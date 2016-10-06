# == Schema Information
#
# Table name: tracks
#
#  id          :integer          not null, primary key
#  title       :string
#  lyrics      :text
#  bonus_track :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Track < ActiveRecord::Base
  validates :title, :album_id, presence: true

  belongs_to :album
  has_many :notes
end
