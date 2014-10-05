class App
  get '/transaction/new' do
    @transaction = Transaction.new
    @categories = Category.all.order('column')

    erb :'transaction/new'
  end

  get 'transaction/:id/edit' do
    @transaction = Transaction.find(params[:id])
    erb :'transaction/edit'
  end

  get '/transaction/:id' do
    @transaction = Transaction.find(params[:id])
    erb :'transaction/show'
  end

  post '/transaction' do
    @transaction = Transaction.new(params['transaction'])
    @categories = Category.all.order('column')
    if @transaction.save
      redirect '/'
    else
      erb :'transaction/new'
    end
  end
end
