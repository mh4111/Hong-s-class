
//====전역변수:각각 체크여부
	var flag = false;//null체크여부
	var flagS = false;//사번중복체크여부
	var flagE = false;//email체크여부
	var flagN = false;//번호 체크여부
	  
 	var now_utc = Date.now() // 지금 날짜를 밀리초로
	// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
	var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
	// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];

function startday(){
	document.getElementById("lsdate").setAttribute("min", today);
}

function endday(){
	document.getElementById("ledate").setAttribute("min", document.getElementById("lsdate").value);
	
}

//====다 체크하고 submit
	function check(){
		var lid = iform.lid.value;
		var lname = iform.lname.value;
		var lnum1 = iform.lnum1.value;
		var lnum2 = iform.lnum2.value;
		var lnum3 = iform.lnum3.value;
		var lurl = iform.lurl.value;
		var limg = iform.limg.value;
		var lcode = iform.lcode.value; /*우편번호*/
		var llocation = iform.llocation.value;
		var llocation2 = iform.llocation2.value;
		var ltitle = iform.ltitle.value;
		var lcontents = iform.lcontents.value;
		var lsdate = iform.lsdate.value;
		var ledate = iform.ledate.value;
		var lprice = iform.lprice.value;
		var lpeople = iform.lpeople.value; 
		
		if (lid==null||lid==""){
			alert('ID을 입력하세요.');
			iform.lid.focus();
			return;
		}
		if (lname==null||lname==""){
			alert('이름을 입력하세요');
			iform.lname.focus();
			return;
		}
		if (lnum1==null||lnum1==""||lnum2==null||lnum2==""||lnum3==null||lnum3==""){
			alert('전화번호를 입력하세요.');
			iform.lnum1.focus();
			return;
		}	
		if (limg==null||limg==""){ //파일선택널체크
			alert('파일선택을 하셔야 합니다.');
			iform.limg.focus();
			return;
		}		
		if (lcode==null||lcode==""||llocation==null||llocation==""||llocation2==null||llocation2==""){
			alert('주소를 입력하세요.');
			iform.lcode.focus();
			return;
		}
		if (ltitle==null||ltitle==""){
			alert('강의제목을 입력하세요.');
			iform.ltitle.focus();
			return;
		}
		if (lcontents==null||lcontents==""){
			alert('강의내용을 입력하세요.');
			iform.lcontents.focus();
			return;
		}
		
		if (lsdate==null||lsdate==""){
			alert('시작날짜를 입력하세요.');
			iform.lsdate.focus();
			return;
		}
		
		if (ledate==null||ledate==""){
			alert('종료날짜를 입력하세요.');
			iform.ledate.focus();
			return;
		}
		
		if (lprice==null||lprice==""){
			alert('가격을 입력하세요.');
			iform.lprice.focus();
			return;
		}
		if (lpeople==null||lpeople==""){
			alert('강의인원을 입력하세요.');
			iform.lpeople.focus();
			return;
		}
		
		//위에 해당 되는 거 없으면 널 체크 true
		flag=true;
		num(); //숫자체크 정규식 
		if(iform.lid.value != null){
			flagS=true; 
			console.log("입력");
		}
		if(flagS==false){	//사번중복체크 안됐을때
			alert('사번 중복체크 하세요');
			return;
		}
		
		if(flagN==false){	//전화번호 올바르지 않을때
			alert('전화번호를 올바르게 입력하세요.');
			iform.num1.focus();
			return;
		}
		
		
		if(flag==true){
			alert("강의가 등록되었습니다!");
			document.iform.submit();
		} else { return; }
	}//check end
	
	
	//====사번 체크
	function checkSb(){//사번 입력체크하고 중복확인 팝업창 열어주기
		var lid = iform.lid.value;
		var label = document.getElementById("lidlabel");
		var sabun_reg = /^[0-9a-zA-Z]*$/;//4자리 영문+숫자
		if(lid==""||lid==null){
			label.innerHTML = "<font color='red'>ID를 입력하세요(숫자+영문4자리)</font>";
			iform.lid.focus();
			return;
		} else {
			if(sabun_reg.test(lid)==false){
				label.innerHTML = "<font color='red'>4자리 영문+숫자 입력</font>";
				iform.lid.value="";
				iform.lid.focus();
				return;
			}
		}
		label.innerHTML = "";
		open('openSb.jsp','oepnSb','width=600, height=140, left=100, top=200');
		
	}//checkSb end

//openSbSave.jsp문서에서 사용
function flagS_t(){ 
	flagS= true;
}
	
//====각각 데이터 입력 자리수제한(db오류 안나게 바이트로 처리)

	function checklen(obj)	{	//db데이터 사이즈에 맞는 길이 체크
		var strValue = obj.value;
		var strLen = strValue.length;
		var str2 ="";
		
		for (var i = 0; i < strLen; i++) {	//한글자씩 가져와서
			oneChar = strValue.charAt(i);
		}
		
		if (strLen > 4)	{	//길이가 4초과=유니코드/한글이면
				alert("자리수가 4자리를 넘습니다.");
				str2 = strValue.substr(0, strLen-1);	//아까 기억한 자리수까지만큼 잘라서 넣어주기
				obj.value = str2;
		} 
		
	}//end

	   
//====우편번호
	function DaumPostcode() {
		new daum.Postcode({
      	oncomplete: function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var fullAddr = ''; // 최종 주소 변수
        var extraAddr = ''; // 조합형 주소 변수


        // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            fullAddr = data.roadAddress;

        } else { // 사용자가 지번 주소를 선택했을 경우(J)
            fullAddr = data.jibunAddress;
        }

        // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
     /*  
        if(data.userSelectedType === 'R'){
            //법정동명이 있을 경우 추가한다.
            if(data.bname !== ''){
                extraAddr += data.bname;
            }
            // 건물명이 있을 경우 추가한다.
            if(data.buildingName !== ''){
                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
            fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
        }
		*/
		
        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('lcode').value = data.zonecode; //5자리 새우편번호 사용
        document.getElementById('llocation').value = fullAddr;
        // 커서를 상세주소 필드로 이동한다.
        document.getElementById('llocation2').focus();
      }
		}).open();
	}//end
	
	
	
	
	
	
	
	
	
	
	
	
	
//====전화번호 입력확인
	function num(){
		var str1=iform.lnum1.value;
		var str2=iform.lnum2.value;
		var str3=iform.lnum3.value;
		var num_reg=/[(0-9)]{3,4}/;
		var label=document.getElementById("numlabel");
		var test1=num_reg.test(str1);
		var test2=num_reg.test(str2);
		var test3=num_reg.test(str3);
		if(test1==false||test2==false||test3==false){
			label.innerHTML = "&nbsp;&nbsp;숫자3~4자리 입력하세요";
		} else {
			label.innerHTML = "";
			flagN=true;
		}
	}//end
	
//====이미지 파일 미리보기
	function handleFileSelect() {
    var files = document.getElementById('limg').files[0]; //파일 객체
    var reader = new FileReader();
    //파일정보 수집        
    reader.onload = (function(theFile) {
      return function(e) {
        //이미지 뷰
        var img_view = ['<img src="', e.target.result, '" name="', escape(theFile.name), '"  width=60%; height=60%;/>'].join('');                
        document.getElementById('preview').innerHTML = img_view;
        
      };
    })(files);
    reader.readAsDataURL(files);
    
      
  }//end

  
  

  
  
  
  
  
  
  
  
  
  
  