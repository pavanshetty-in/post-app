json.extract! topic, :id, :name, :subtopic, :link, :created_at, :updated_at
json.url topic_url(topic, format: :json)
