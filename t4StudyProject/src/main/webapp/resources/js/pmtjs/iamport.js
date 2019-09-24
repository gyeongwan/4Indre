//$("#check_module").click(function () {

var IMP = window.IMP;
		IMP.init('imp75761841');
		

function request_pay() {
	
	var dnuMny = $('.dntMny').val();

		IMP.request_pay({ //param
			pg : 'html5_inicis', 
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '주문명:결제테스트',
			amount : 100,
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
			m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {  //callback
			if (rsp.success) { 
				jQuery.ajax({
			          url: "https://www.myservice.com/payments/complete", // 가맹점 서버
			          method: "POST",
			          headers: { "Content-Type": "application/json" },
			          data: {
			              imp_uid: rsp.imp_uid,
			              merchant_uid: rsp.merchant_uid
			              
			          }
			          
			          
			      }).done(function(data) { // 응답 처리
			    	//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
			    		if ( everythings_fine ) {
			    			var msg = '결제가 완료되었습니다.';
			    			msg += '\n고유ID : ' + rsp.imp_uid;
			    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
			    			msg += '\결제 금액 : ' + rsp.paid_amount;
			    			msg += '카드 승인번호 : ' + rsp.apply_num;

			    		} else {
			    			//[3] 아직 제대로 결제가 되지 않았습니다.
			    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
			    		}
		    		
		    	});
				
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			console.log(msg);
			alert(msg);
		});
		
		
}

var payment = document.payment;
var amountCk = payment.dntMny.value;

if(!amountCk){
    alert("금액을 입력해주세요.")
}else{
    payment.submit();
}
// });

		
		