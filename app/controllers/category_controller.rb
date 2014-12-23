class App

  get '/category' do
    @categories = Category.all

    erb :'category/index'
  end

  get '/category/new' do
    @category = Category.new

    erb :'category/new'
  end

  post '/category' do
    @category = Category.new(params[:category])

    if @category.save
      redirect '/category'
    else
      erb :'category/new'
    end
  end

  get '/category/:id/delete' do
    @category = Category.find(params[:id])
    if @category.destroy
      # flash success
    else
      # flash nope
    end
    redirect '/category'
  end

end
