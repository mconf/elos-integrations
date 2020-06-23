# frozen_string_literal: true

key_name = ENV['OMNIAUTH_BBBLTIBROKER_KEY']
secret = ENV['OMNIAUTH_BBBLTIBROKER_SECRET']

default_keys = [
  { key: key_name, secret: secret }
]

default_keys.each do |default_key|
  key = RailsLti2Provider::Tool.find_by(uuid: default_key[:key])
  attrs = {
    uuid: default_key[:key],
    shared_secret: default_key[:secret],
    lti_version: 'LTI-1p0',
    tool_settings: 'none'
  }
  if key.present?
    puts "Updating key #{default_key[:key]}"
    key.update_attributes(attrs)
  else
    puts "Creating key #{default_key[:key]}"
    RailsLti2Provider::Tool.create!(attrs)
  end
end

default_tools = [
  {
    name: 'tool',
    uid: key_name,
    secret: secret,
    redirect_uri: "#{ENV['APP_ROOMS_URL']}/apps/rooms/auth/bbbltibroker/callback",
    scopes: 'api'
  }
]

default_tools.each do |default_tool|
  app = Doorkeeper::Application.find_by(name: default_tool[:name])
  if app.present?
    puts "Creating app #{default_tool[:name]}"
    app.update_attributes(default_tool)
  else
    puts "Updating app #{default_tool[:name]}"
    Doorkeeper::Application.create!(default_tool)
  end
end
