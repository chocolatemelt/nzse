from pytrends.request import TrendReq

kw_list = ["asuka", "asuka langley", "asuka evangelion"]
trends = TrendReq(hl='en-US', tz=360, timeout=(10,25))
trends.build_payload(kw_list, cat=0, timeframe='now 1-d', geo='', gprop='')
df = trends.interest_over_time()
print(trends)