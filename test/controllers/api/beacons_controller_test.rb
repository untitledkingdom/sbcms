# == Schema Information
#
# Table name: beacons
#
#  id                :integer          not null, primary key
#  name              :string           default(""), not null
#  model             :string           default(""), not null
#  uuid              :string           default(""), not null
#  major             :integer          default(1), not null
#  minor             :integer          default(1), not null
#  created_at        :datetime
#  updated_at        :datetime
#  unique_sync_id    :string           default("")
#  unique_identifier :string           not null
#

require 'test_helper'

module Api
  class BeaconsControllerTest < ActionController::TestCase

    test "returns collection" do
      get :index

      matcher = assert_json_match(
          :beacons,
          @response.body
      )

      fixtures_count = @loaded_fixtures['beacons'].fixtures.count

      assert_equal fixtures_count, matcher.captures[:beacons].size

      assert_response :success
    end

    test "returns beacon" do
      beacon = beacons(:estimote)

      get :show, params: { unique_identifier: beacon.unique_identifier }

      assert_json_match(
          {
              uuid: beacon.uuid.to_s
          }.ignore_extra_keys!,
          @response.body
      )

      assert_response :success
    end
  end
end
