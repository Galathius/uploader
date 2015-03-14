FactoryGirl.define do
  factory :video do
    name 'Video'
    video File.open(File.join(Rails.root, 'spec', 'support', 'video.avi'))
    user
  end
end
