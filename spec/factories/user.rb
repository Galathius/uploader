FactoryGirl.define do
  factory :user do
    name  'John Doe'
    uid   1
    token 1

    factory :user_with_videos do
      transient do
        videos_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:video, evaluator.videos_count, user: user)
      end
    end
  end

end
