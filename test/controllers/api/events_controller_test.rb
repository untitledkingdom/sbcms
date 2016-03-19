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
