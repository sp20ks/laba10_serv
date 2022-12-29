# frozen_string_literal: true

require 'rails_helper'

# testing requests
RSpec.describe ServController, type: :controller do
  it 'returns http success' do
    get :index
    expect(response.status).to eq(200)
  end

  it 'returns http success' do
    get :result, params: { str_arr: '5', length: '1' }
    expect(response.status).to eq(200)
  end

  it 'returns correct result' do
    get :result, params: { str_arr: '1 5 6 0 5 625 625 0 8', length: '9' }
    expect(assigns(:res)[:after]).to eq [[1, 5], [5, 625, 625]]
  end

  it 'returns different result' do
    get :result, params: { str_arr: '10 1 6 5 3 5 9', length: '7' }
    expect(assigns(:res)[:after]).to eq [[1], [5], [5]]
  end

  it 'show in xml' do
    get :result, params: { str_arr: '5 5 6 0 1 4', length: '6', format: :xml }
    expect(response.content_type).to eq('application/xml; charset=utf-8')
  end

  it 'show in html' do
    get :result, params: { str_arr: '5 5 6 0 1 4', length: '6', format: :html }
    expect(response.content_type).to eq('text/html; charset=utf-8')
  end
end
