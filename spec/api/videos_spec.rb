require 'spec_helper'

describe API::Videos do
  let(:user) { create(:user) }

  describe 'GET /api/videos' do
    context 'with valid token' do
      let(:params) { { token: user.token } }
      before { get '/api/videos', params }

      context 'user has a lot of videos' do
        let(:user) { create :user_with_videos }
        it { expect(response.body).to eq(user.videos.to_json) }
      end

      context 'user not have videos' do
        it { expect(response.body).to eq([].to_json) }
      end
    end

    context 'with wrong token' do
      let(:params) { { token: 'wrong_token' } }

      before { get '/api/videos', params }
      it { expect(response.status).to eq(401) }
    end
  end
end
