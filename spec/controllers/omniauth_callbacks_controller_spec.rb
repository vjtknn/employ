require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  before(:each) do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'Google' do
    before(:each) do
      request.env['omniauth.auth'] = google_oauth_hash
      get :google_oauth2
    end

    context 'Success handling' do
      let(:google_oauth_hash) { OmniAuth::AuthHash.new(Faker::Omniauth.google) }

      let(:user) { User.find_by(email: google_oauth_hash[:info][:email]) }

      it 'sets :notice flash' do
        expect(flash[:notice]).to eq('Successfully authenticated from Google account.')
      end

      it 'sets current_user to proper user' do
        expect(subject.current_user).to eq(user)
      end
    end

    context 'Non-persisting User' do
      let(:google_oauth_hash) { create(:auth_hash, :google, :does_not_persist) }

      it 'redirects to new user registration' do
        expect(response).to redirect_to new_user_registration_url
      end

      it 'sets flash :alert' do
        expect(flash[:alert]).to eq("Email can't be blank")
      end
    end

  end
end
