require 'rails_helper'

describe EntriesController, type: :controller do

  describe '#show' do
    let!(:entry) { FactoryGirl.create :entry, uuid: '000-000-000', major: '1', minor: '1' }

    context 'valid params' do
      it 'finds entry and renders show' do
        get :show, uuid: '000-000-000', major: '1', minor: '1'
        expect(assigns(:entry)).to eq entry
        expect(response).to render_template(:show)
      end

      it 'renders json of entry' do
        get :show, uuid: '000-000-000', major: '1', minor: '1', format: :json
        expect(JSON.parse(response.body)).to eq(JSON.parse({ status: 'success', entry: entry.as_json }.to_json))
      end
    end

    context 'invalid params' do
      it 'cannot find anything' do
        get :show, uuid: '0000', major: '1', minor: '0'
        expect(response.status).to redirect_to(root_path)
      end

      it 'cannot renders json errors' do
        get :show, uuid: '0000', major: '1', minor: '0', format: :json
        expect(JSON.parse(response.body)).to eq({ 'status' => 'failed', 'error' => 'Not found' }) 
      end
    end
  end

end