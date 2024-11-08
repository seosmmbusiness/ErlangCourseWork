-module(exam).

-export([listPrices/1]).


listPrices(Currency) ->
  CarList = ["BMW", "Lam", "Fer"],
  
  printPriceList({CarList, Currency}).

getCarPriceInUsd(CarName) ->
  MapPricesUsd = #{"BMW" => 150000, "Lam" => 500000, "Fer"=> 700000},
  maps:get(CarName,MapPricesUsd).

calcPrice({CarName, CurrencyToGetThePrice}) ->
  if
    CurrencyToGetThePrice == gbp -> round(getCarPriceInUsd(CarName)*0.75) ;
    CurrencyToGetThePrice == eur -> round(getCarPriceInUsd(CarName)*0.9);
    true -> getCarPriceInUsd(CarName)
  end.

printPriceList({[],Currency})->
  Currency,
  true;
printPriceList({[First | Rest], Currency}) ->
  ConvertedPriceList = integer_to_list(calcPrice({First, Currency})), 
  io:fwrite("Price for " ++ First ++ " is " ++ ConvertedPriceList ++ "\n"),
  printPriceList({Rest, Currency}).

