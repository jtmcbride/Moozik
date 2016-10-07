# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string
#  live_album :boolean
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  validates :title, :band_id, presence: true

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
