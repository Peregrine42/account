class App
  get '/transaction/new' do
    @transaction = Transaction.new
    @categories = Category.all.order('column')
    erb :'transaction/new'
  end

  get '/transaction/:id' do
    @transaction = Transaction.find(params[:id])
    erb :'transaction/show'
  end

  post '/transaction' do
    @category = Category.find(params['category'])
    @transaction = @category.transactions.new(params['transaction'])
    if @transaction.save
      redirect '/'
    else
      erb :'transaction/new'
    end
  end
end
