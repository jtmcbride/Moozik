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

require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
