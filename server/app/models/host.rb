class Host < ActiveRecord::Base
before_save :update_datetime
before_update :update_datetime

 def update_datetime
   self.updated_at = Time.now
 end

end
