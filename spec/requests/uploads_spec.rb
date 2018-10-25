require 'rails_helper'

RSpec.describe 'Uploads API', type: :request do
  let(:user) { create(:user) }
  let!(:uploads) { create_list(:upload, 10, user_id: user.id) }
  let(:upload_id) { upload.first.id }
  let(:headers) { valid_headers }

  describe 'GET /uploads' do
    before { get '/uploads', params: {}, headers: headers }

  end


  describe 'POST /uploads/upload' do
    let(:valid_attributes) do
      { photo: Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg'), 'image/jpeg'), user: user.id }.to_json
    end

    context 'when request is valid' do
      before { post '/uploads/upload', params: valid_attributes, headers: headers }
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { user: user.id }.to_json }

      it 'raises validation error in create_upload' do
        expect{ post '/uploads/upload', params: invalid_attributes, headers: headers }
          .to raise_error(ActiveInteraction::InvalidInteractionError, /Photo is required/)
      end
    end
  end
end