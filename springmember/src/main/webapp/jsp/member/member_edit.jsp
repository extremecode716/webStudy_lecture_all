<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" type="text/css" href="./css/admin.css" />
<link rel="stylesheet" type="text/css" href="./css/member.css" />
<script src="./js/jquery.js"></script>
<script src="./js/member.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
//우편번호, 주소 Daum API
function openDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {				
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
			document.getElementById('join_zip1').value = data.zonecode;
			document.getElementById('join_addr1').value = data.address;				
		}
	}).open();
}
</script>
</head>
<body>
  <div id="join_wrap">
  <h2 class="join_title">회원수정</h2>
  <form name="f" method="post" action="member_edit_ok.nhn"
  		onsubmit="return edit_check()" enctype="multipart/form-data">
   <!-- 이진파일을 업로드 할려면 enctype 속성을 지정 -->
   <table id="join_t">
    <tr>
     <th>회원아이디</th>
     <td>
      ${id}
     </td>
    </tr>
    
    <tr>
     <th>회원비번</th>
     <td>
      <input type="password" name="join_pwd" id="join_pwd1" size="14"
      class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>회원비번확인</th>
     <td>
      <input type="password" name="join_pwd2" id="join_pwd2" size="14"
      class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>회원이름</th>
     <td>
      <input name="join_name" id="join_name" size="14" class="input_box"
      value="${editm.join_name}" />
     </td>
    </tr>
    
    <tr>
     <th>우편번호</th>
     <td>
      <input name="join_zip1" id="join_zip1" size="5" class="input_box"
      		readonly onclick="post_search()" value="${editm.join_zip1}"/>
      <%-- -<input name="join_zip2"  id="join_zip2" size="3" class="input_box" readonly 
      		onclick="post_search()" value="${editm.join_zip2}"/> --%>
      <input type="button" value="우편번호검색" class="input_button"
      		onclick="openDaumPostcode()" />
     </td>
    </tr>
    
    <tr>
     <th>주소</th>
     <td>
      <input name="join_addr1" id="join_addr1" size="50" class="input_box"
      readonly value="${editm.join_addr1}" onclick="post_search()" />
     </td>
    </tr>
    
    <tr>
     <th>나머지 주소</th>
     <td>
      <input name="join_addr2" id="join_addr2" size="37" 
      value="${editm.join_addr2}" class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>집전화번호</th>
     <td>
     <%@ include file="../../jsp/include/tel_number.jsp"%>
      <select name="join_tel1" >      
      <c:forEach var="t" items="${tel}" begin="0" end="16">
      	<option value="${t}" <c:if test="${join_tel1 == t}">${'selected'}
          </c:if>>${t}
        </option>
      </c:forEach>        
      </select>-<input name="join_tel2" id="join_tel2" size="4"
      maxlength="4" class="input_box" value="${join_tel2}"/>-<input  name="join_tel3"
      id="join_tel3" size="4" maxlength="4" class="input_box" 
      value="${join_tel3}"/>
     </td>
    </tr>
    
    <tr>
     <th>휴대전화번호</th>
     <td>
     <%@ include file="../../jsp/include/phone_number.jsp" %>
     <select name="join_phone1">
      <c:forEach var="p" items="${phone}" begin="0" end="5">
       <option value="${p}" <c:if test="${join_phone1 == p}">${'selected'}
          </c:if>>${p}
        </option>
      </c:forEach>
     </select>-<input name="join_phone2" id="join_phone2" size="4"
     maxlength="4" class="input_box" value="${join_phone2}"/>-<input name="join_phone3"
     id="join_phone3" size="4" maxlength="4" class="input_box" 
     value="${join_phone3}"/>
     </td>
    </tr>
    
    <tr>
     <th>전자우편</th>
     <td>
      <input name="join_mailid" id="join_mailid" size="10" 
      class="input_box" value="${join_mailid}"/>@<input name="join_maildomain" 
      id="join_maildomain" size="20" class="input_box" readonly
      value="${join_maildomain}" />
      
      <!--readonly는 단지 쓰기,수정이 불가능하고 읽기만 가능하다 //-->
      <select name="mail_list" onchange="domain_list()">
      <option value="">=이메일선택=</option>
      <option value="daum.net" 
      		<c:if test="${join_maildomain == 'daum.net'}">${'selected'}
            </c:if>>daum.net</option>
      <option value="nate.com" 
      		<c:if test="${join_maildomain == 'nate.com'}">${'selected'}
            </c:if>>nate.com</option>
      <option value="naver.com" 
      		<c:if test="${join_maildomain == 'naver.com'}">${'selected'}
            </c:if>>naver.com</option>
      <option value="hotmail.com" 
            <c:if test="${join_maildomain == 'hotmail.com'}">${'selected'}
            </c:if>>hotmail.com</option>
      <option value="gmail.com" 
            <c:if test="${join_maildomain == 'gmail.com'}">${'selected'}
            </c:if>>gmail.com</option>
      <option value="0">직접입력</option>
     </select> 
     </td>
    </tr>
    
    <tr>
     <th>프로필사진</th>
     <td>
      <input type="file" name="join_profile1" />
     </td>
    </tr>
   </table>
   
   <div id="join_menu">
    <input type="submit" value="회원수정" class="input_button" />
    <input type="reset" value="수정취소" class="input_button" 
    onclick="$('#join_pwd1').focus();" />
   </div>
  </form>
 </div>
</body>
</html>