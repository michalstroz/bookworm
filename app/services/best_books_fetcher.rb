class BestBooksFetcher
  def initialize(min)
    @min = min
  end

  def fetch
    fetch_books
  end

  private

  def global_average
    ActiveRecord::Base.connection.select_all('SELECT SUM(books.rate)/COUNT(*) AS S FROM books').first['s']
  end

  def fetch_books
     Book.select("books.*, ").where("books.votes_quantity > #{@min}").order('wa desc').limit(10)
  end

  def weighted_average_column
    <<-SQL
    (((CAST(books.votes_quantity AS FLOAT)/(books.votes_quantity + '#{@min}')) * books.rate) + (('#{@min}'/(CAST(books.votes_quantity AS FLOAT) + '#{@min}')) * '#{global_average}')) AS wa
    SQL
  end
end
