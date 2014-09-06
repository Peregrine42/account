class App
  get '/transaction/:id' do
    @transaction = Transaction.find(params[:id])
    erb :'transaction/show'
  end
end
