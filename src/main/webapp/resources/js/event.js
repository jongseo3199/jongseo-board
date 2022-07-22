
window.onload = function(){
	
	
	if(document.getElementById("regist")) {
		const $regist = document.getElementById("regist");
		$regist.onclick = function() {
			location.href = "/board/boardRegist";
			
			console.log("값 확인");
		}
	}
	
	
	function aa(){
		document.f.submit();
	}
	
	
	
	/* 유효성 체크*/
	document.querySelector('#form').onsubmit = function(){ 
			 
			 let title = document.getElementById('title');
			 let writer = document.getElementById('writer');
			 
			 
			 if(title.value.trim().length < 1 || title.value.trim().length > 24 ) {
				 alert('제목은 1글자 이상 25자 이내로 적어주세요');
				 title.value='';
				 title.focus();
				 return false;
			 }
			 
			 if(writer.value.trim().length < 1 || writer.value.trim().length > 5 ) {
				 alert('작성자는 1글자 이상 5자 이내로 적어주세요');
				 writer.value='';
				 writer.focus();
				 return false;
			 }
			 
			 else{
				 alert("글이 등록 되었습니다. 처음으로 돌아갑니다.")
				 return true;
			 }
		 }
		  
	
	
	
	
	
}