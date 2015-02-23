module Api::SessionsHelper

  def encodeJWT(user, exp=2.hours.from_now)
    payload = { user_id: user.id}
    payload[:exp] = exp

    JWT.encode( payload, Rails.application.secrets.secret_key_base, "HS512")
  end

  def decodeJWT(token)
    payload = JWT.decode(token, Rails.application.secrets.secret_key_base, "HS512")

    if payload[0]["exp"] >= Time.now.to_i
      payload
    else
      puts 'time is out.'
      false
    end

    rescue => error
      puts error
      nil
  end
end