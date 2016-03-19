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

class Event < ActiveRecord::Base
  belongs_to :beacon, optional: true

  EVENT_TYPES = %w(EventImage EventText EventUrl)

  enum kind: {
      enter:      0,
      exit:       1,
      far:        2,
      near:       3,
      immediate:  4
  }

  validates :type, inclusion: { in: EVENT_TYPES }

  scope :active, -> { where(active: true) }

  def event_type
    self.class.name.sub(/^Event/, '').downcase
  end

  def serialized
    ActiveModel::SerializableResource.new(self, include: EventSerializer.includes).serializable_hash
  end

  class << self
    def available_types
      unless Settings.service_enabled?(:imgur)
        return EVENT_TYPES[1..2]
      end

      EVENT_TYPES
    end

    def types
      EVENT_TYPES
    end
  end
end
