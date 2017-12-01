class Post < ActiveRecord::Base
  belongs_to :user
  def self.search(search)
    where("job_title ILIKE ? OR company ILIKE ? OR location ILIKE ?", "%#{search}%","%#{search}%","%#{search}%")
  end
end
