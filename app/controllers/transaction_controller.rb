class App
  get '/transaction/new' do
    @transaction  = Transaction.new
    @transactions = Transaction.all
    @categories   = Category.all
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
    @categories = Category.all
    if @transaction.valid?
      flash[:success] = 'Transaction updated successfully.'
      redirect '/'
    else
      erb :'transaction/edit'
    end
  end

  get '/transaction/:id/delete' do
    Transaction.find(params[:id]).destroy
    redirect '/'
  end

  post '/transaction' do
    @transaction = Transaction.new(params['transaction'])
    @transactions = Transaction.all
    @categories = Category.all
    if @transaction.save
      flash[:success] = 'Transaction created successfully.'
      redirect '/'
    else
      flash.now[:error] = 'That last transcation was not created. Please check the errors below.'
      erb :'transaction/new'
    end
  end
end
