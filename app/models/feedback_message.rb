class FeedbackMessage < ActiveRecord::Base
   attr_accessible :email, :subject, :body
end
