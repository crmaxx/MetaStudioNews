module NewsHelper
  def get_user_email_by_id(id)
    User.find(id).email
  end
end
