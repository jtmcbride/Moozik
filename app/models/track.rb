# == Schema Information
#
# Table name: tracks
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  lyrics      :text
#  bonus_track :boolean
#  album_id    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Track < ActiveRecord::Base
  validates :title, :album_id, presence: true

  belongs_to :album
  has_many :notes
end
