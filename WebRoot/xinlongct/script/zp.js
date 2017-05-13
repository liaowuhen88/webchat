/****************************************************
 *	 Author :	xuyw					            *
 *	 Version:   v1.0								*
 *   Email  :   xyw10000@163.com                    *
****************************************************/

function randomnum(smin, smax) {// 获取2个值之间的随机数
	var Range = smax - smin;
	var Rand = Math.random();
	return (smin + Math.round(Rand * Range));
}
   
function runzp(time) {
    var start = 1;
	var end = 200 ;
	
	
	var lottery = new Array();
	
	for(var i=start;i<=end;i++){
		lottery.push(i);
	}
	var first = 1 ;
	var sencond = 5 ;
	var three = 15 ;
	var four = 20 ;
	var five = 200 ; 
	var six = 500 ;  
	var fistrprise = 0 ; 
	var sencondprise = 10 ;
	var threeprise = 10 ;
	var fourprise = 10 ;  
	var fiveprise = 20 ;  
	var sixprise = 20 ;   
	  
	//var data = '[{"id":1,"prize":"590大洋","v":1.0},{"id":2,"prize":"100RMB","v":2.0},{"id":3,"prize":"安慰奖","v":48.0}]';// 奖项json
	var data = '[{"id":1,"prize":"'+fistrprise+'","v":'+first+'},{"id":2,"prize":"'+sencondprise+'","v":'+sencond+'},{"id":3,"prize":"'+threeprise+'","v":'+three+'},{"id":4,"prize":"'+fourprise+'","v":'+four+'},{"id":5,"prize":"'+fiveprise+'","v":'+five+'},{"id":6,"prize":"'+sixprise+'","v":'+six+'}]';
	 
	var obj = eval('(' + data + ')');
	  
	//var a = new Date();
	
	//if((a.getMonth()+""+a.getDate()) == time){
		//end = "200";
	//} 
	 
	var result = randomnum(start, end)*1; 
	
	var flag = $.inArray(result, lottery);
	
	while(flag == -1){
		result = randomnum(start, end)*1;
		flag = $.inArray(result, lottery);
	}
	
	//lottery.splice($.inArray(result,lottery),1); 
	 
	  
	var returnobj = "0";
	//result = 110*1;
	var index = 0;
	//result = 1200; 
	
    if(0*1<result && result<=first*1){
    	index = 5 ; 
    }
    if(first*1<result && result<=sencond*1){
    	index = 4 ;
    }
    if(sencond*1<result && result<=three*1){
    	index = 3 ;
    }
    if(three*1<result && result<=four*1){
    	index = 2 ;
    } 
    if(four*1<result && result<=five*1){
    	index = 1 ; 
    } 
    if(five*1<result && result<=six*1){
    	index = 0 ; 
    }
     // alert(index);  
    //var obj2 = obj[index];  
    	
    returnobj = obj[index];
     
    //alert(index);
	//alert("随机数"+result);
	//for ( var i = 0; i < obj.length; i++) {
		//var line = 0;
		//var temp = 0; 
	//	var obj2 = obj[i]; 
		//var c = parseFloat(obj2.v);
		//temp = temp + c;
	//	line = sum - temp;  

		//if (c != 0) {
		//	if (result > line && result <= (line + c)) {
		//		index = i;
				// alert(i+"中奖"+line+"<result"+"<="+(line + c));
		//		returnobj = obj2;
		//		break;
		//	}
		//}
	//}  
	//var angle = 330;
    
	var message = "";
	var myreturn = new Object;
	if (returnobj != "0") {// 有奖
		message = "恭喜中奖了"; 
		var angle0 = [ 330, 340]; 
		
		var angle1 = [ 220, 230 ];
		
		var angle2 = [ 105, 110 ]; 
		
		var angle3 = [ 10, 15 ];
		var angle4 = [ 40, 45 ];
		var angle5 = [ 320, 322 ];  
		switch (index) {
		case 0:// 一等奖
			var r0 = randomnum(angle0[0], angle0[1]);
			angle = r0;
			break;
		case 1:// 二等奖
			var r1 = randomnum(angle1[0], angle1[1]);
			angle = r1; 
			break;
		case 2:// 三等奖
			var r2 = randomnum(angle2[0], angle2[1]);
			angle = r2;
			break;
		case 3:// 三等奖
			var r2 = randomnum(angle3[0], angle3[1]);
			angle = r2;
			break;
		case 4:// 三等奖
			var r2 = randomnum(angle4[0], angle4[1]);
			angle = r2;
			break;
		case 5:// 三等奖 
			var r2 = randomnum(angle5[0], angle5[1]);
			angle = r2;
			break;
		} 
		myreturn.prize = returnobj.prize;
	} else {// 没有
		message = "再接再厉";
		var angle3 = [ 17, 103 ];
		var angle4 = [ 197, 220 ];
		var angle5 = [ 259, 340 ];
		var r = randomnum(3, 5);
		var angle;
		switch (r) {
		case 3: 
			var r3 = randomnum(angle3[0], angle3[1]);
			angle = r3;
			break;
		case 4:
			var r4 = randomnum(angle4[0], angle4[1]);
			angle = r4;
			break;
		case 5:
			var r5 = randomnum(angle5[0], angle5[1]);
			angle = r5;
			break;
		}
		myreturn.prize = "继续努力!";

	} 
	
	myreturn.angle = angle;
	myreturn.message = message;
	return myreturn;
}