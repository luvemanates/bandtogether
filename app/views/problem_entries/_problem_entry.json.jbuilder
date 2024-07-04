json.extract! problem_entry, :id, :title, :description, :creator_id, :website_url, :created_at, :updated_at
json.url problem_entry_url(problem_entry, format: :json)
