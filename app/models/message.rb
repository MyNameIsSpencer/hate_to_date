class Message < ApplicationRecord

  # validates :user_id, :receiver_id, presence: true;

  belongs_to :sender, :class_name=>'User', :foreign_key=>'user_id'
  belongs_to :receiver, :class_name=>'User', :foreign_key=>'receiver_id'
end
