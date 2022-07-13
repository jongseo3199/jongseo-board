
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
	
	
}