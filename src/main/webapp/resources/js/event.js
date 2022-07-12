
window.onload = function(){
	
	
	if(document.getElementById("writeBoard")) {
		const $writeBoard = document.getElementById("writeBoard");
		$writeBoard.onclick = function() {
			location.href = "/board/boardRegist";
			
			console.log("값 확인");
		}
	}
	
	
	
	
	
}