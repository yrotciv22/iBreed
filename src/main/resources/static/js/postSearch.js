

 $(document).ready(function() {
 	console.log("postSearch.js");
 	
 	    $('#postSearchForm').on('submit', function(event) {
        
        const keyword =  $.trim($('#keyword').val()); // 검색어에서 공백 제거
       
         if (keyword === "") {
                alert("검색어를 입력하세요.");
                event.preventDefault(); // 폼 제출 막기
            }
        });
    
 
 });