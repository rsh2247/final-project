/*
function objectMap(event) {
    var eventData = new Map();
    for (var key in event) {
    	eventData.set(key,event[key]);
        console.log("["+key+"]"+" : "+event[key]);
        
    }
    console.log(eventData);
    return eventData;
}			

*/
/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event, element, view) {
	
	$('#deleteEvent').data('id', event._id); //클릭한 이벤트 ID
	
	$('.popover.fade.top').remove();
	$(element).popover("hide");
	
	if (event.allDay === true) {
		editAllDay.prop('checked', true);
	} else {
		editAllDay.prop('checked', false);
	}
	
	if (event.end === null) {
		event.end = event.start;
	}
	
	if (event.allDay === true && event.end !== event.start) {
		editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
	} else {
		editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
	}

	//event에 이미 데이터가 담겨있고 edit.val에 입력
	modalTitle.html('일정 수정');
	editTitle.val(event.title);
	editStart.val(event.start.format('YYYY-MM-DD HH:mm'));
	editType.val(event.type);
	editDesc.val(event.description);
	editColor.val(event.backgroundColor).css('color', event.backgroundColor);
	
	addBtnContainer.hide();		//추가 저장 버튼 숨기고
	
	if(event.username == "admin"){
		alert('공통 시험 일정은 수정 불가능 합니다.');
	}else{
		modifyBtnContainer.show();	//수정 보튼 보이게		
		eventModal.modal('show');
	}
	
	
	//수정 버튼 클릭시
	$('#updateEvent').unbind();
	$('#updateEvent').on('click', function () {
		
		if (editStart.val() > editEnd.val()) {
			alert('끝나는 날짜가 앞설 수 없습니다.');
			return false;
		}
		if (editTitle.val() === '') {
			alert('일정명은 필수입니다.')
			return false;
		}
		
		var statusAllDay;
		var startDate;
		var endDate;
		var displayDate;

		//수정할 데이터 입력 
		if (editAllDay.is(':checked')) {
			statusAllDay = true;
			startDate = moment(editStart.val()).format('YYYY-MM-DD');
			endDate = moment(editEnd.val()).format('YYYY-MM-DD');
			displayDate = moment(editEnd.val()).add(1, 'days').format('YYYY-MM-DD');
		} else {
			statusAllDay = false;
			startDate = editStart.val();
			endDate = editEnd.val();
			displayDate = endDate;
		}
		
		eventModal.modal('hide');
		//event 객체에 덮어씌움.
		event.allDay = statusAllDay;
		event.title = editTitle.val();
		event.start = startDate;
		event.end = endDate;
//		event.end = displayDate;
		event.type = editType.val();
		event.backgroundColor = editColor.val();
		event.description = editDesc.val();
		
		$("#calendar").fullCalendar('updateEvent', event);
		

		//수정 ajax, object에서 데이터 한번에 뽑기.. 실패..
		console.log("ajax");
		$.ajax({
			type: "get",
			async: false,	
			url: getContextPath()+"/calendar_modifyEvent.cal",
			data: {
				_id : event._id,
				title: event.title,
				description : event.description,
				start : event.start,
				end : event.end,
				type : event.type,
				backgroundColor : event.backgroundColor,
				allDay : event.allDay
			},
			success: function (response) {
				location.reload();
			},
			error: function(response){
				alert('에러에러');
			}
		});
		
	});
};

// 삭제버튼, 일정번호 필요 cal_id
$('#deleteEvent').on('click', function () {
	$('#deleteEvent').unbind();
	$("#calendar").fullCalendar('removeEvents', $(this).data('id'));
	eventModal.modal('hide');
	
	//삭제 ajax
	$.ajax({
		type: "get",
		url: getContextPath()+"/calendar_deleteEvent.cal",
		data: {
			_id :  $(this).data('id')
		},
		success: function (response) {
			location.reload();
		},
			error: function(response){
			alert('에러에러');
		}
	});
});