require 'rubygems'
require 'uuidtools'

# See: http://stackoverflow.com/questions/2487837/uuids-in-rails3
# See: https://github.com/sporkmonger/uuidtools/wiki
module UUIDHelper

  def self.included(base)
    base.class_eval do
      before_create :set_uuid

      def set_uuid
        self.uuid = UUIDTools::UUID.timestamp_create.to_s
      end
    end
  end

end
