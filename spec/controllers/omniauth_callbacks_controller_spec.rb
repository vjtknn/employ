require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do

  before(:each) do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'Google' do

    context 'Success handling' do

      before(:each) do
        request.env['omniauth.auth'] = FactoryBot.create(:auth_hash, :google)
        get :google_oauth2
      end

      let(:user) { User.find_by(email: 'testuser@gmail.com') }

      it 'should set :notice flash' do
        expect(flash[:notice]).to eq('Successfully authenticated from Google account.')
      end

      it 'should set current_user to proper user' do
        expect(subject.current_user).to eq(user)
      end

    end

  end
end
