class Video < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :video, :user_id

  mount_uploader :video, VideoUploader

  delegate :url, to: :video

  def as_json(options = {})
    super(options.merge(only: [:id, :name], methods: [:url]))
  end
end
