require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  before(:each) do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'Google' do
    context 'Success handling' do
      let!(:google_oauth_hash) { OmniAuth::AuthHash.new(Faker::Omniauth.google) }
      before(:each) do
        request.env['omniauth.auth'] = google_oauth_hash
        get :google_oauth2
      end

      let(:user) { User.find_by(email: google_oauth_hash[:info][:email]) }

      it 'should set :notice flash' do
        expect(flash[:notice]).to eq('Successfully authenticated from Google account.')
      end

      it 'should set current_user to proper user' do
        expect(subject.current_user).to eq(user)
      end
    end
    context 'Non-persisting User' do

      before(:each) do
        request.env['omniauth.auth'] = FactoryBot.create(
            :auth_hash, :google, :does_not_persist
        )
        get :google_oauth2
      end

      it 'should redirect to new user registration' do
        expect(response).to redirect_to new_user_registration_url
      end

      it 'should set flash :alert' do
        expect(flash[:alert]).to eq("Email can't be blank")
      end
    end
  end
end
