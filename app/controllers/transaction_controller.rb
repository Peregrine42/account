class App
  get '/transaction/new' do
    @transaction = Transaction.new
    @categories = Category.all

    erb :'transaction/new'
  end

  get '/transaction/:id/edit' do
    @transaction = Transaction.find(params[:id])
    @categories = Category.all
    erb :'transaction/edit'
  end

  get '/transaction/:id' do
    @transaction = Transaction.find(params[:id])
    erb :'transaction/show'
  end

  post '/transaction/:id/update' do
    @transaction = Transaction.update(params[:id], params[:transaction])
    if @transaction.valid?
      redirect '/'
    else
      erb :'transaction/edit'
    end
  end

  post '/transaction/:id/delete' do
    Transaction.find(params[:id]).destroy
    redirect '/'
  end

  post '/transaction' do
    @transaction = Transaction.new(params['transaction'])
    @categories = Category.all
    if @transaction.save
      redirect '/'
    else
      erb :'transaction/new'
    end
  end
end
