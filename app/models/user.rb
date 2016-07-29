class User < ActiveRecord::Base
    has_many :my_events, class_name: "Event", foreign_key: :owner_id
end
