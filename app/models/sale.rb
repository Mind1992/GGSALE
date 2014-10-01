class Sale < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  def format_time
  	unless self.start_time == nil || self.end_time == nil
      start_time = self.start_time.to_s.split(" ")[1].slice(0..4)
  	 end_time = self.end_time.to_s.split(" ")[1].slice(0..4)
  	 time = "from " + start_time + " to " + end_time
    end
  end

  def format_date
    unless self.start_date == nil || self.end_date == nil
    	start_date = self.start_date.to_s.split("-")
    	end_date = self.end_date.to_s.split("-")
    	formatted_start_date = start_date[1].to_s + "/" + start_date[2].to_s + "/" + start_date[0].to_s.slice(2..4)
    	formatted_end_date = end_date[1].to_s + "/" + end_date[2].to_s + "/" + end_date[0].to_s.slice(2..4)
    	formatted_start_date + " - " + formatted_end_date
    end
  end
end
