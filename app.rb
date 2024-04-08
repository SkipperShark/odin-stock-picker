def stock_picker(stocks)

  # > stock_picker([17,3,6,9,15,8,6,1,10])
  # => [1,4]  # for a profit of $15 - $3 == $12
  
  stock_performances = []
  last_day_index = stocks.length - 1

  stocks.each.with_index(0) do |buy_price, buy_day_index|

    buy_price
    profit_estimations = []

    num_next_days = last_day_index - buy_day_index

    (buy_day_index..last_day_index).each do |i|
      sell_price = stocks[i]
      estimated_profit = sell_price - buy_price
      profit_estimations << {
        :estimated_profit => estimated_profit,
        :day_pair => [buy_day_index, i]
      }
    end

    max_profit_estimation = profit_estimations.max { |a,b| a[:estimated_profit] <=> b[:estimated_profit]}

    stock_performances << max_profit_estimation
  end

  answer = stock_performances.max{ |a,b| a[:estimated_profit] <=> b[:estimated_profit]}
  answer[:day_pair]

end

pp stock_picker([17,3,6,9,15,8,6,1,10])

