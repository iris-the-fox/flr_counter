json.extract! review, :id, :story_id, :text, :link, :author, :created_at, :updated_at
json.url review_url(review, format: :json)
