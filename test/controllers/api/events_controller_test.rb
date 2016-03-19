# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  type       :string           default("EventText"), not null
#  kind       :integer          default("enter"), not null
#  active     :boolean          default(FALSE), not null
#  beacon_id  :integer
#  payload    :text
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

module Api
  class EventsControllerTest < ActionController::TestCase
    setup do
      @beacon = beacons(:estimote)
    end

    test "returns collection of beacon events" do
      get :index, params: { unique_identifier: @beacon.unique_identifier }
      assert_response :success
    end

    test "returns event" do
      beacon = beacons(:estimote)

      get :show, params: { unique_identifier: beacon.unique_identifier, kind: 'enter' }

      assert_json_match(
          {
              type: 'EventText',
              kind: 'enter',
              payload: 'EventText enter payload',
              active: true
          }.ignore_extra_keys!,
          @response.body
      )

      assert_response :success
    end
  end
end
