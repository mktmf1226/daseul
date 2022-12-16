const daysTag = document.querySelector(".days"),
currentDate = document.querySelector(".current-date"),
prevNextIcon = document.querySelectorAll(".icons span");

var concertDate = `<c:out value="${concert.date}"/>`;
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
//alert("날짜" + concertdateDate);
//alert(concertdateMonth);

const months = ["01", "02", "03", "04", "05", "06", "07",
    "08", "09", "10", "11", "12"];
    
const renderCalendar = () => {
	let firstDayofMonth = new Date(concertdateYear, concertdateMonth, 2).getDay();
	//alert(firstDayofMonth); //1
	let lastDateofMonth = new Date(concertdateYear, concertdateMonth - 1, 0).getDate();
	//alert(lastDateofMonth); //30
	let lastDayofMonth = new Date(concertdateYear, concertdateMonth, lastDateofMonth).getDay();
	//alert(lastDayofMonth); //1
	let lastDateofLastMonth = new Date(concertdateYear, concertdateMonth, 0).getDate();
	//alert(lastDateofLastMonth); //31


	let liTag = "";
	
	for (let i = firstDayofMonth; i > 0; i--) { // creating li of previous month last days
		//alert(i);
		liTag += `<li class="inactive">${lastDateofLastMonth - i + 1}</li>`; // 1- 31까지 출력하는듯
	}
	//alert(liTag); 
	
	//alert("testYear.getMonth()+1 =" + (testYear.getMonth()+1)); //11월
	//alert(concertdateMonth);
	
	//alert("testYear.getDate() =" + testYear.getDate()); //11월
	
	for (let i = 1; i <= lastDateofMonth; i++) { 
	    let isToday = i === testYear.getDate() && concertdateMonth === testYear.getMonth()+1
	                 && concertdateYear === testYear.getFullYear() ? "active" : "";
	    liTag += `<li class="${isToday}">${i}</li>`;  
	}
	
	for (let i = lastDayofMonth; i < 6; i++) { // creating li of next month first days
		 liTag += `<li class="inactive">${i - lastDayofMonth + 1}</li>`
	}
    currentDate.innerText = `${concertdateYear}. ${months[concertdateMonth]}`; // passing current mon and yr as currentDate text
    daysTag.innerHTML = liTag;
}	
renderCalendar();

prevNextIcon.forEach(icon => { // getting prev and next icons
    icon.addEventListener("click", () => { // adding click event on both icons
        // if clicked icon is previous icon then decrement current month by 1 else increment it by 1
        concertdateMonth = icon.id === "prev" ? concertdateMonth - 1 : concertdateMonth + 1;

        if(concertdateMonth < 0 || concertdateMonth > 11) { // if current month is less than 0 or greater than 11
            // creating a new date of current year & month and pass it as date value
            date = new Date(concertdateYear, concertdateMonth);
            concertdateYear = testYear.getFullYear(); // updating current year with new date year
            concertdateMonth = testYear.getMonth()+1; // updating current month with new date month
        } else {
            date = new Date(); // pass the current date as date value
        }
        renderCalendar(); // calling renderCalendar function
    });
});




