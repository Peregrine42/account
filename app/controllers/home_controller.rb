class App
  get '/' do
    page_size = 20
    params[:page] = (Transaction.all.count / page_size.to_f).ceil unless params[:page]
    params[:page] = 1 if (params[:page].to_i) < 1
    @transactions = Transaction.paginate(page: params[:page], per_page: page_size).table_order
    @categories = Category.all
    @total = Transaction.all.inject(0) { |total, transaction| transaction.amount + total }
    erb :'home'
  end
end
