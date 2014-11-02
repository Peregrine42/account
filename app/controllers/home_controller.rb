class App
  get '/' do
    page_size = 2
    params[:page] = (Transaction.all.count / page_size.to_f).ceil unless params[:page]
    @transactions = Transaction.paginate(page: params[:page], per_page: page_size).table_order
    @categories = Category.all.order('column')
    @total = Transaction.all.inject(0) { |total, transaction| transaction.amount + total }
    erb :'home'
  end
end
