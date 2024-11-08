-module(carDealer).

-export([listPrices/1]).


listPrices(Currency) -> 
  CarList = getCarList(),
  printPrice(CarList, Currency).
  
printPrice([],Currency) ->
  true;
printPrice([Car | Rest], Currency) ->
  CarMap = getCarMap(),
  Price = maps:get(Car, CarMap),
  ConvertedPrice = convertPrice(Price, Currency),
  io:fwrite("Price for " ++ Car ++ " is " ++ integer_to_list(ConvertedPrice) ++ "\n"),
printPrice(Rest,Currency).

convertPrice(Price, Currency) -> 
  case Currency of
    eur -> round(Price * 0.9);
    gbp -> round(Price * 0.75);
    usd -> 1
  end.
  
getCarList() -> 
  ["BMW", "Lam", "Fer"].

getCarMap() -> 
  #{"BMW" => 150000, "Lam" => 500000, "Fer"=> 700000}.
