class Action < ApplicationRecord
  belongs_to :user
  belongs_to :action_type
  belongs_to :article
end
