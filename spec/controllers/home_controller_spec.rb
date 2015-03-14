require 'spec_helper'

describe HomeController do
  describe 'GET index' do
    context 'user unauthorized' do
      before { get :index }

      it { expect(response).to render_template(:index)  }
    end

    context 'user authorized' do
      before do
        allow(controller).to receive(:current_user) { build :user }
        get :index
      end

      it { expect(response).to redirect_to(videos_path) }
    end
  end
end
