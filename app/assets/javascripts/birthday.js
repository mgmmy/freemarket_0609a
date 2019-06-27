setDate(1950); // 関数の呼び出し

function setDate(startyear, endyear){
  var date = new Date();
  var nowyear = date.getFullYear();
  var month = 1;
  var day = 1;
  var yearOptions = '';
  var monthOptions = '';
  var dayOptions = '';
  if(!startyear || startyear == ""){
      startyear = nowyear - 30;
  }
  if(!endyear || endyear == ""){
      endyear = nowyear;
  }
  if(startyear < endyear){
      return;
  }
  for (var i=startyear; i <= endyear; i++){
      if(i == nowyear){
          yearOptions += '<option value="' + i + '" selected="selected">' + i + '</option>';
      }else{
          yearOptions += '<option value="' + i +'">' + i + '</option>';
      }
  }
  for (i=1; i<=12; i++){
      if(month == i){
          monthOptions += '<option value="' + zeroPadding(i,2) + '" selected="selected">' + zeroPadding(i,2) + '</option>';
      }else{
          monthOptions += '<option value="' + zeroPadding(i,2) +'">' + zeroPadding(i,2) + '</option>';
      }
  }
  for (i=1; i<=31; i++){
      if(day == i){
          dayOptions += '<option value="' + zeroPadding(i,2) + '" selected="selected">' + zeroPadding(i,2) + '</option>';
      }else{
          dayOptions += '<option value="' + zeroPadding(i,2) +'">' + zeroPadding(i,2) + '</option>';
      }
  }
  $('#year').html(yearOptions);
  $('#month').html(monthOptions);
  $('#day').html(dayOptions);
}