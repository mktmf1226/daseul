const daysTag = document.querySelector(".days"),
currentDate = document.querySelector(".current-date"),
prevNextIcon = document.querySelectorAll(".icons span");


//새로 만든 코드

/*
var concertDate = "<c:out value='${concert.date}'/>";
alert(concertDate);

var dateSplit = concertDate.split('-');


var concertYear = dateSplit[0]*1; //2022
var concertMonth = dateSplit[1]*1; //12
var concertDay = dateSplit[2]*1; 	//24

alert(concertDay);




var dateSplit = concertDate.split('-');


var concertYear = dateSplit[0];
var concertMonth = dateSplit[1];
var concertDay = dateSplit[2];

//alert(concertMonth);

let testDate = new Date();
testYear = new Date(concertYear, concertMonth - 1, concertDay); // Sat Dec 24 2022 00:00:00 GMT+0900 (한국 표준시)
//alert(testYear);

let concertdateYear = testYear.getFullYear(); //2022
let concertdateMonth = testYear.getMonth() + 1; //12월
let concertdateDate = testYear.getDate(); //
alert(concertdateDate);
*/


// 새로운 날짜를 가져온다. 현재 년도와 월 
let date = testYear,
currYear = testYear.getFullYear(), // 2022년
currMonth = testYear.getMonth();  //  12월



// 저장한다. 배열에 모든 월과 이름을 전체적으로
const months = ["01", "02", "03", "04", "05", "06", "07",
              "08", "09", "10", "11", "12"];

const renderCalendar = () => {
    let firstDayofMonth = new Date(currYear, currMonth, 1).getDay(), // 달의 첫번째 일수 (1일) // 2022년, 11월 , 1일) 
    lastDateofMonth = new Date(currYear, currMonth + 1, 0).getDate(), // 달의 마지막 일수 (30일 or 31일) //2022년 12월 0일 ?
    lastDayofMonth = new Date(currYear, currMonth, lastDateofMonth).getDay(), // 달의 마지막 일수를 가져온다. //달의마지막날 - 2022년 11월 , 
    lastDateofLastMonth = new Date(currYear, currMonth, 0).getDate(); // getting last date of previous month
    
    
    let liTag = "";

    for (let i = firstDayofMonth; i > 0; i--) { // creating li of previous month last days
        liTag += `<li class="inactive">${lastDateofLastMonth - i + 1}</li>`;
    }

    for (let i = 1; i <= lastDateofMonth; i++) { // creating li of all days of current month
        // adding active class to li if the current day, month, and year matched
        
        let isToday = i === concertdateDate  && currMonth === (concertdateMonth) 
                     && currYear === concertdateYear ? "active" : "";
        liTag += `<li class="${isToday}">${i}</li>`;
        /*
        if(i==concertDay){
			alert("currMonth: "+currMonth); //현재 보여지는 달력의 월-1
			alert("new Date().getMonth(): "+new Date().getMonth()); //고정적으로 오늘의 월-1
			alert("currYear: "+currYear); //현재 보여지는 달력의 년
			alert("new Date().getFullYear(): "+new Date().getFullYear()); //고정적으로 오늘 년
		}
		*/
		/*
		if(i==concertDay){
			alert("currMonth: "+currMonth); //현재 보여지는 달력의 월-1
			alert("(concertMonth-1): "+(concertMonth-1)); //고정적으로 오늘의 월-1
			alert("currYear: "+currYear); //현재 보여지는 달력의 년
			alert("concertYear: "+concertYear); //고정적으로 오늘 년
		}
		*/
		
        /*
        let isToday = "";
        if(i == 17){
			
		}else{
			liTag += `<li class="${isToday}">${i}</li>`;
		}//if end
        */
    }//for end
    
    
    //liTag  += `<li class="active"> 17 </li>`;
    
    

    for (let i = lastDayofMonth; i < 6; i++) { // creating li of next month first days
        liTag += `<li class="inactive">${i - lastDayofMonth + 1}</li>`
    }
    currentDate.innerText = `${currYear}. ${months[currMonth]}`; // passing current mon and yr as currentDate text
    daysTag.innerHTML = liTag;
}
renderCalendar();

prevNextIcon.forEach(icon => { // getting prev and next icons
    icon.addEventListener("click", () => { // adding click event on both icons
        // if clicked icon is previous icon then decrement current month by 1 else increment it by 1
        currMonth = icon.id === "prev" ? currMonth - 1 : currMonth + 1;

        if(currMonth < 0 || currMonth > 11) { // if current month is less than 0 or greater than 11
            // creating a new date of current year & month and pass it as date value
            date = new Date(currYear, currMonth);
            currYear = date.getFullYear(); // updating current year with new date year
            currMonth = date.getMonth(); // updating current month with new date month
        } else {
            date = new Date(); // pass the current date as date value
        }
        renderCalendar(); // calling renderCalendar function
    });
});