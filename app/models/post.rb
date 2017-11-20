class Post < ActiveRecord::Base
  def self.search(search)
    where("job_title ILIKE ? OR company ILIKE ? OR location ILIKE ?", "%#{search}%","%#{search}%","%#{search}%")
  end
end
