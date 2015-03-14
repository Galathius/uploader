class API < Grape::API
  helpers ::Helpers::AuthHelpers

  prefix 'api'
  version 'v1', using: :header, vendor: 'uploader'

  content_type :json, 'application/json'
  default_format :json

  rescue_from(::Helpers::AuthHelpers::Unauthorized) do |e|
    error_response({
        status: 401,
        message: 'unauthorized'
      })
  end

  mount Videos
end
