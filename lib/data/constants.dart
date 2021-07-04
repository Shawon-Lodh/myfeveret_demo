//all api url

const String new_arrivals_api_url = 'https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=newArrivals';
const String new_shops_api_url = 'https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=newShops';
const String products_api_url = 'https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=stories';
const String trending_products_api_url = 'https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=trendingProducts';
const String trending_sellers_api_url = 'https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=trending_seller';

//All enums

enum HorizontalScrollingPageName{
  TrendingSellersPage,TrendingProductsPage,NewArrivalsPage
}
enum VerticalScrollingPageName{
  ProductsPage,NewShopsPage
}



