class App
  get '/' do
    @transactions = Transaction.all.table_order
    @categories = Category.all.order('column')
    @total = Transaction.all.inject(0) { |total, transaction| transaction.amount + total }
    erb :'home'
  end
end
