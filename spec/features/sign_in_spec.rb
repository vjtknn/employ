require 'rails_helper'

describe 'log in', type: :feature do
  let(:user) { create(:user) }

  context 'log in normal way' do
    context 'with correct passoword' do
        it 'logs in successfully' do
        visit new_user_session_path
        expect(page).to have_content 'Log in'
        expect(page).to have_http_status :ok
          within('#new_user') do
            fill_in 'Email', with: user.email
            fill_in 'Password', with: user.password
          end
        click_button 'Log in'
        expect(page).to have_content 'Signed in successfully.'
        expect(page).to have_http_status :ok
      end
    end
    context 'without correct password' do
      it 'logs in process fails' do
        visit new_user_session_path
        expect(page).to have_content 'Log in'
        expect(page).to have_http_status :ok
          within('#new_user') do
            fill_in 'Email', with: user.email
            fill_in 'Password', with: 'asdfasdf'
          end
        click_button 'Log in'
        expect(page).to have_content 'Invalid Email or password.'
        expect(page).to have_http_status :ok
      end
    end
  end

  context 'using google oauth2' do
    before do
      OmniAuth.config.mock_auth[:google_oauth2] = google_oauth_hash
      visit root_path
    end
    context 'with correct credentials' do
      let(:google_oauth_hash) { OmniAuth::AuthHash.new(Faker::Omniauth.google) }
      it 'logs in successfully' do
        expect(page).to have_link 'Log in with Google'
        click_link 'Log in with Google'
        expect(page).to have_link 'Log out'
        expect(page).to have_content 'Successfully authenticated from Google account.'
        visit jobs_path
        expect(current_path).to eq(jobs_path)
      end
    end

    context 'without correct credentials' do
      let(:google_oauth_hash) { create(:auth_hash, :google, :does_not_persist) }
      it 'does not log in' do
        expect(page).to have_link 'Log in with Google'
        click_link 'Log in with Google'
        expect(page).not_to have_link 'Log out'
        expect(page).not_to have_content 'Successfully authenticated from Google account.'
        expect(page).to have_link 'Log in with Google'
        visit jobs_path
        expect(current_path).to eq(new_user_session_path)
      end
    end
  end
end
