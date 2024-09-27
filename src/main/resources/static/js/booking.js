let basePrice = 0;
$(function () {
	// booking_select 달력 동적으로 삽입
	var today = new Date();
	var date = new Date();
	
	// 이전달 버튼 클릭시
	$("input[name=preMonth]").click(function () {
	    $("#calendar > tbody > td").remove();
	    $("#calendar > tbody > tr").remove();
	    today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
	    buildCalendar();
	});
	
	// 다음달 버튼 클릭시
	$("input[name=nextMonth]").click(function () {
	    $("#calendar > tbody > td").remove();
	    $("#calendar > tbody > tr").remove();
	    today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
	    buildCalendar();
	});
	
	// 달력 만들기
	function buildCalendar() {
	    let nowYear = today.getFullYear();
	    let nowMonth = today.getMonth();
		// 1일이 무슨 요일인지
	    let firstDay = new Date(nowYear, nowMonth, 1).getDay(); 
		// 그 달의 마지막 날
	    let lastDate = new Date(nowYear, nowMonth + 1, 0).getDate(); 
	
	    // 년.월 작성
	    $(".year_month").text(nowYear + ". " + (nowMonth + 1));
	
	    // 날짜 채우기
	    $("#calendar tbody").empty(); // 이전에 있던 내용을 비워줌
	    let row = $("<tr></tr>");
	
	    // 첫번째 줄 1일 시작 전까지 빈칸으로 채우기
	    for (let i = 0; i < firstDay; i++) {
	        row.append("<td></td>");
	    }
		// 가격과 인원 선택 UI를 기본적으로 숨김
		$(".select_count, .count_wrap, .selected-date-container").hide();
	
	    // 날짜 채우기
	    for (let i = 1; i <= lastDate; i++) {
	        const dateCell = $("<td class='date'>" + i + "</td>");
	        
			
	        // 날짜 셀 클릭 이벤트 추가
	        dateCell.on("click", function() {
	            // 모든 날짜에서 colToday 클래스 제거하고 selectday 클래스 추가
	            $(".date").removeClass("colToday").removeClass("selectday");
	            $(this).addClass("selectday");
				
				// 선택한 날짜 텍스트 가져오기
				let selectedDate = $(this).text();
				let nowYear = today.getFullYear();
				let nowMonth = today.getMonth() + 1; // 월은 0부터 시작하므로 +1
				// 선택한 날짜를 readonly input에 표시
				$("#selectedDate").val(`${nowYear}-${nowMonth}-${selectedDate}`);
		
				// 가격 및 인원 선택 UI 표시
				$(".select_count, .count_wrap, .selected-date-container").show();
				// 가격 및 인원 수 업데이트
				updateDisplay();
	        });
	
	        row.append(dateCell);
	
	        // 7일째 되면 새로운 줄을 추가
	        if ((i + firstDay) % 7 === 0) {
	            $("#calendar tbody").append(row);
	            row = $("<tr></tr>"); // 새로운 행 시작
	        }
	    }
	
	    // 남은 날짜 처리
	    if (row.children().length > 0) {
	        $("#calendar tbody").append(row); // 남은 row를 추가
	    }
	
	    // 오늘 날짜 표시
	    let todayDate = today.getDate();
	    $(".date").each(function (index) {
	        if (nowYear == date.getFullYear() && nowMonth == date.getMonth() 
				&& $(this).text() == todayDate) {
	            $(this).addClass('colToday');
	        }
	    });
	}
	
	buildCalendar();
	
	// 인원 수에 따른 가격 업데이트 함수
	function updatePrice() {
	    let totalPrice = basePrice * headcount; // 총 가격 계산
	    $("#price").val(totalPrice); // 총 가격을 input 필드에 반영
	}
	
	// 인원 수 조절 버튼 클릭 이벤트
	$(".plus_btn").on('click', function() {
		if(headcount < 10) {
	    	headcount++;
		}
	    $("input[name='headcount']").val(headcount); // 입력 필드의 값 업데이트
		updatePrice();
	});
	
	$(".min_btn").on('click', function() {
		if(headcount > 1 ) {
			headcount--;
		}
		    $("input[name='headcount']").val(headcount); // 입력 필드의 값 업데이트
			updatePrice();
	});
	

	$(".bs_booking_btn").on('click', function() {
	    // 입력값 가져오기 및 유효성 검사
	    const visitDate = $("#selectedDate").val();
	    const headcount = parseInt($("#headcount").val());
	    const price = parseInt($("#price").val());
		
		console.log("headcount:", $("#headcount").val(), "price:", $("#price").val());

	    // Ajax 요청
	    $.ajax({
	        url: '/popupBoard/select.do',
	        type: 'POST',
	        data: {
	            popup_idx: null,
	            visit_date: visitDate,
	            headcount: headcount,
	            price: price
	        },
	        success: function(response) {
	            alert("예약이 완료되었습니다" + "마이페이지에서 예약내역을 확인하세요");
	            // 예약 성공 후 이동할 페이지로 리디렉션
	            window.location.href = '/popupBoard/select.do';
				console.log("예약 완료");
	        },
	        error: function(error) {
	            alert("예약 중 오류 발생");
				console.log("예약실패")
	        }
	    });
	});
	updatePrice();
});

	