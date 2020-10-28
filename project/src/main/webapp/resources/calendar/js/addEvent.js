var eventModal = $('#eventModal');  //일정 추가 모달

var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay');
var editTitle = $('#edit-title');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editType = $('#edit-type');     //카테고리 선택
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');

var addBtnContainer = $('.modalBtnContainer-addEvent'); //취소, 저장
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent'); //닫기, 삭제, 저장


/* ****************
 *  새로운 일정 생성 o
 * ************** */
var newEvent = function (start, end, eventType) {

    $("#contextMenu").hide(); //메뉴 숨김

    modalTitle.html('새로운 일정');
    editType.val(eventType).prop('selected', true); //구분, 카테고리 선택
    editTitle.val('');      //일정명
    editStart.val(start);   //시작
    editEnd.val(end);       //끝
    editDesc.val('');       //설명
    
    addBtnContainer.show();             //취소, 저장버튼 보임
    modifyBtnContainer.hide();          //닫기, 삭제, 저장 버튼 숨김
    eventModal.modal('show');           //모달 바로실행

    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
    var eventId = 1 + Math.floor(Math.random() * 1000);
    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/

    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();      //이벤트 핸들러 요소제거
    $('#save-event').on('click', function () {

        var eventData = {
            _id: eventId,           //임시지정(Controller에서 재지정)
            title: editTitle.val(),
            start: editStart.val(),
            end: editEnd.val(),
            description: editDesc.val(),
            type: editType.val(),
            username: 'sjbn',
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            allDay: false           //default : false
        };

        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }
        if (eventData.title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }

        var realEndDay;
        //체크시에 종일 일정
        if (editAllDay.is(':checked')) {
            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
            //render시 날짜표기수정
     //	    eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
            eventData.end = moment(eventData.end).format('YYYY-MM-DD');
            //DB에 넣을때(선택)
            realEndDay = moment(eventData.end).format('YYYY-MM-DD');

            eventData.allDay = true;    //체크시
        }

        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        editAllDay.prop('checked', false);
        eventModal.modal('hide');

        //새로운 일정 저장
        console.log("새로운 일정 저장 : ", eventData);
        $.ajax({
            type: "get",
            url: getContextPath()+"/calendar_insertEvent.cal",
            data: {
            	eventData: eventData
            },
            success: function (response) {
                //DB연동시 중복이벤트 방지를 위한??
                //$('#calendar').fullCalendar('removeEvents');
                //$('#calendar').fullCalendar('refetchEvents');
            	location.reload();
            	alert('일정 등록 완료');
            	 
            }
        });  //ajax
    }); //save-event 끝
};