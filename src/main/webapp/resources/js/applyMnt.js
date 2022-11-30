window.onload = function () {
 	$("#mntDate").flatpickr({
    dateFormat: "Y년 m월 d일",
	 minDate: "today",
	"locale": "ko",
 });
 
 
 $('#stTimepicker').timepicker({
    timeFormat: 'H:00',
    interval: 60,
    minTime: '09:00am',
    maxTime: '11:00pm',
    startTime: '09:00am',
    dynamic: false,
    dropdown: true,
    scrollbar: true
});	    		
        
        


}
