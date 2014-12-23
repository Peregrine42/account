require 'spec_helper'

describe App, 'GET /categories' do

  let(:category1) { double(:category1, name: 'food')  }
  let(:category2) { double(:category2, name: 'drink') }

  it 'gets all the categories' do
    allow(Category).to receive(:all).and_return([category1, category2])

    get '/categories'

    expect(last_response.body).to match('food')
    expect(last_response.body).to match('drink')
  end

end
