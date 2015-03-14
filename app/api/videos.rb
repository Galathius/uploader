class Videos < Grape::API

  desc 'Get videos'
  params do
    optional :page, type: Integer, default: 0
    optional :per_page, type: Integer, values: 1..100
  end
  get '/videos' do
    authenticate!
    current_user.videos.page(params[:page]).per(params[:per_page])
  end
end
