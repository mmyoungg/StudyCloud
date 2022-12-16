<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.content {
	width: 1000px;
	margin: 40px auto;
}

.payTable {
	margin: 30px auto;
	width: 900px;
}

.payTable tr {
	height: 50px;
}

.payth {
	background-color: #e3eff9;
	font-weight: bold;
	font-size: 18px;
	text-align: center;
}

.paytitle {
	font-weight: bold;
	color: #3f92b7;
	text-align: center;
}

.moveMainpage { display: inline-block; border: none; padding: 10px; background-color: #6cc4dc; color: white; border-radius: 5px; }
</style>
</head>
<body>

	<div class="content">
		<h1>🧾 결제가 성공적으로 완료 되었습니다!</h1>
		<div id="payedPage">
			<table class="payTable">
				<tr></tr>
				<tr>
					<td colspan="5" class="payth">🧑 예약자 정보</td>
				</tr>
				<tr>
					<td class="paytitle">이름</td>
					<td colspan="4">${payResult.MEMBER_NAME }</td>
				</tr>
				<tr>
					<td class="paytitle">연락처</td>
					<td colspan="4">${payResult.MEMBER_PHONE }</td>
				</tr>
				<tr>
					<td class="paytitle">요청사항</td>
					<td colspan="4">${payResult.SROOMPAY_MSG }</td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr>
					<td colspan="5" class="payth">💳 결제 정보</td>
				</tr>
				<tr>
					<td class="paytitle">결제 번호</td>
					<td colspan="4">${payResult.SROOMPAY_UID }</td>
				</tr>
				<tr>
					<td class="paytitle">결제 수단</td>
					<td colspan="4">${payResult.SROOMPAY_METHOD }</td>
				</tr>
				<tr>
					<td class="paytitle">카드 승인번호</td>
					<td colspan="4">${payResult.SROOMPAY_APPLY }</td>
				</tr>
				<tr>
					<td class="paytitle">결제 금액</td>
					<td colspan="4">${payResult.SROOMPAY_PRICE }</td>
				</tr>
				<tr>
					<td class="paytitle">결제 일시</td>
					<td colspan="4">${payResult.SROOMPAY_DATE }</td>
				</tr>

				<tr></tr>
				<tr></tr>
				<tr>
					<td colspan="5" class="payth">📖 스터디룸 예약 정보</td>
				</tr>
				<tr>
					<td class="paytitle">스터디룸 이름</td>
					<td colspan="4">${payResult.SROOM_NAME }</td>
				</tr>
				<tr>
					<td class="paytitle">이용날짜</td>
					<td colspan="4">${payResult.RESERVE_DATE }</td>
				</tr>
				<tr>
					<td class="paytitle">시작시간</td>
					<td colspan="4">${payResult.RESERVE_STIME }</td>
				</tr>
				<tr>
					<td class="paytitle">종료시간</td>
					<td colspan="4">${payResult.RESERVE_ETIME }</td>
				</tr>
				<tr>
					<td class="paytitle">이용인원</td>
					<td colspan="4">${payResult.RESERVE_PEOPLE }</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="payResultOk" style="text-align: center;">
		<button type="button" class="moveMainpage" onclick="location.href='/mainpage'">
			메인으로
		</button>
	</div>
<%@ include file="../layout/footer.jsp"%>	
</body>
</html>