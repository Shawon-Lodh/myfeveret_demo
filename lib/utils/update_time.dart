class UpdateTime{
  List checkForUpdateTime(DateTime uploadTime){
    int day = 0;
    int hour = 0;
    int minute = 0;
    // DateTime endDate = DateTime.parse(singleProductDoc["products_auction_TotalTime"].toDate().toString());
    int difference = uploadTime.difference(DateTime.now()).inMinutes;
    // print(endDate);
    print("This is difference : ${difference}");
    if(difference/(60*24) == 0){
      day = difference~/(60*24);
      hour = 0;
      minute = 0;
    }else if((difference%(60*24))/60 == 0){
      day = difference~/(60*24);
      hour = (difference%(60*24))~/60;
    }else{
      day = difference~/(60*24);
      hour = (difference%(60*24))~/60;
      minute = (difference%(60*24))%60;
    }
    // print("${day} day - ${hour} hour - ${minute} minute");
    // Map <String, dynamic> remainingTime = {
    //   "day" : day,
    //   "hour" : hour,
    //   "minute" : minute,
    // };
    // return "${day}day ${hour}h ${minute}m";
    return [day,hour,minute];
  }
}