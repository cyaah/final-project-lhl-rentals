json.extract! booking, :id, :from_date, :to_date, :owner_rating, :owner_comments, :rentor_rating, :rentor_comments, :rent_status, :user_id, :item_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
