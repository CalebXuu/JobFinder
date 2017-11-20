json.extract! post, :id, :job_title, :company, :location, :your_name, :phone, :created_at, :updated_at
json.url post_url(post, format: :json)
