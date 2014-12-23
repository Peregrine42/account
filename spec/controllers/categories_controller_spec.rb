require 'spec_helper'

describe App, 'GET /category' do

  let(:category1) { double(:category1, name: 'food', id: 1)  }
  let(:category2) { double(:category2, name: 'drink', id: 2) }

  it 'gets all the categories' do
    allow(Category).to receive(:all).and_return([category1, category2])

    get '/category'

    expect(last_response.body).to match('food')
    expect(last_response.body).to match('drink')
  end

end

describe App, 'GET /category/new' do

  it 'shows the form for creating a new category' do
    get '/category/new'

    expect(last_response.body).to match('New Category')
  end

end

describe App, 'POST /category' do

  context 'good input' do
    it 'creates a new category with the given name' do
      expect_any_instance_of(Category).to receive(:save).and_return true
      post '/category', params: { category: {name: 'foo'} }
    end
  end

  context 'bad input' do
    it 'shows the form again' do
      allow_any_instance_of(Category).to receive(:save).and_return false
      post '/category', params: { category: {name: ''} }
      expect(last_response.body).to match 'New Category'
    end
  end

end

describe App, 'GET /delete' do

  let(:category1) { double(:category1, name: 'food', id: 1)  }

  it 'deletes the category' do
    allow(Category).to receive(:find).and_return(category1)
    expect(category1).to receive(:destroy)
    get '/category/1/delete'
  end
end
