# +
fundamentals <- read.csv("fundamentals.csv")
securities <- read.csv("securities.csv")
prices <- read.csv("prices-split-adjusted.csv")


prices = subset(prices, select = c(date, symbol, close))
securities = subset(securities, select = c(Ticker.symbol, GICS.Sector, Address.of.Headquarters))
# -

merged = merge(x = securities, y = prices, by.x='Ticker.symbol', by.y='symbol')
merged = merge(x = merged, y = fundamentals, by.x=c('Ticker.symbol','date'),by.y =c('Ticker.Symbol','Period.Ending'))

write.csv(merged, "processed.csv", row.names=TRUE)
