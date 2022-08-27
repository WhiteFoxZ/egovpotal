<%--
  Class Name : EgovProgramListManage.jsp
  Description : 프로그램목록(조회,삭제) JSP
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.02  JJY          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 JJY
    since    : 2009.03.02
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">
<link rel="stylesheet" href="<c:url value='/'/>css/default.css" type="text/css" >
<title>프로그램목록리스트</title>
<script language="javascript1.2" type="text/javaScript">
<!--
/* ********************************************************
 * 모두선택 처리 함수
 ******************************************************** */
function fCheckAll() {
    var checkField = document.progrmManageForm.checkField;
    if(document.progrmManageForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}

/* ********************************************************
 * 멀티삭제 처리 함수
 ******************************************************** */
function fDeleteProgrmManageList() {
    var checkField = document.progrmManageForm.checkField;
    var ProgrmFileNm = document.progrmManageForm.checkProgrmFileNm;
    var checkProgrmFileNms = "";
    var checkedCount = 0;
    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkProgrmFileNms += ((checkedCount==0? "" : ",") + ProgrmFileNm[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkProgrmFileNms = ProgrmFileNm.value;
            }
        }
    }   

    document.progrmManageForm.checkedProgrmFileNmForDel.value=checkProgrmFileNms;
    document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgrmManageListDelete.do'/>";
    document.progrmManageForm.submit(); 
}

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
//  document.menuManageForm.searchKeyword.value = 
    document.progrmManageForm.pageIndex.value = pageNo;
    document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramListManageSelect.do'/>";
    document.progrmManageForm.submit();
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectProgramListManage() { 
    document.progrmManageForm.pageIndex.value = 1;
    document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramListManageSelect.do'/>";
    document.progrmManageForm.submit(); 
}
/* ********************************************************
 * 입력 화면 호출 함수
 ******************************************************** */
function insertProgramListManage() {
    document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramListRegist.do'/>";
    document.progrmManageForm.submit(); 
}
/* ********************************************************
 * 상세조회처리 함수
 ******************************************************** */
function selectUpdtProgramListDetail(progrmFileNm) {
    document.progrmManageForm.tmp_progrmNm.value = progrmFileNm;
    document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramListDetailSelectUpdt.do'/>";
    document.progrmManageForm.submit(); 
}
/* ********************************************************
 * focus 시작점 지정함수
 ******************************************************** */
 function fn_FocusStart(){
        var objFocus = document.getElementById('F1');
        objFocus.focus();
    }

<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>
</head>
<body>
<!-- login status start -->
<div id="login_area"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncTborder" /></div>
<!-- //login status end -->
<!-- wrap start -->
<div id="wrap"> 
    <!-- header start -->
    <div id="subheader"><c:import url="/sym/mms/EgovMainMenuHead.do" /></div>  
    <!-- //header end -->
    <!--  타이틀 이미지 시작 -->
    <div id="title_img_div"><img src="<c:url value='/'/>images/title_image/img_title06.gif" alt="" /></div>
    <!--  //타이틀 이미지 끝 -->
    <div id="bodywrap">
        <div id="leftmenu_div"><c:import url="/sym/mms/EgovMainMenuLeft.do" /></div>
        <div id="middle_content">
            <!-- 현재위치 네비게이션 시작 -->
            <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            <li>&gt;</li>
                            <li>포털시스템관리</li>
                            <li>&gt;</li>
                            <li>프로그램목록</li>
                            <li>&gt;</li>
                            <li><strong>회원관리</strong></li>
                        </ul>
                    </div>
            </div>
            <div id="content_field"><!--contents start-->
        
        
            <!-- sub title start -->
            <div><h2>프로그램관리</h2></div>
            <!-- sub title end -->
            
	        <!-- content start -->
	        <form name="progrmManageForm" action ="<c:url value='/sym/prm/EgovProgramListManageSelect.do'/>" method="post">
            <input type="submit" id="invisible" class="invisible"/>
	        <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
			<input name="checkedProgrmFileNmForDel" type="hidden" />
			<input type="hidden" name="cmd">
			<input type="hidden" name="tmp_progrmNm">
				
							
	        <!-- search area start-->
            <div class="search_service">
                <div class="search_area">
                <div class="search_conditions" >                   
                    <ul id="search_first_ul">
                        <li>
                            <label for="F1">프로그램 한글명 : </label>
                            <input name="searchKeyword" type="text" size="60" value="<c:out value='${searchVO.searchKeyword}'/>"  maxlength="60" id="F1" title="검색조건"> 
                        </li>
                    </ul>
                </div>
                <div class="search_buttons">
                    <!-- 검색 -->
                    <input type="submit" value="<spring:message code="button.search" />" onclick="selectProgramListManage(); return false;" />                    
                    <!-- 목록 -->
                    <a href="<c:url value='/sym/prm/EgovProgramListManageSelect.do'/>" ><spring:message code="button.list" /></a>
                    <!-- 등록 -->
                    <a href="<c:url value='/sym/mpm/EgovProgramListRegist.do'/>" onclick="insertProgramListManage(); return false;"><spring:message code="button.create" /></a>
                </div>
                </div> 
            </div>
            <!-- search area end -->
            
	        <div>사용자수 <strong><c:out value="${paginationInfo.totalRecordCount}"/></strong></div>

            <!-- search result start -->
            <div class="search_result_div">
            
                <table width="98%" cellpadding="0" cellspacing="0" summary="회원목록">
                <caption>프로그램목록관리 목록</caption>
                    <colgroup>
                        <col width="3%" >
                        <col width="20%" >  
                        <col width="20%" >
                        <col width="40%" >
                        <col width="17%" >
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" class="f_field" nowrap="nowrap"><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fCheckAll();" title="전체선택"></th>
                        <th scope="col" nowrap="nowrap">프로그램파일명</th>
                        <th scope="col" nowrap="nowrap">프로그램 한글명</th>
                        <th scope="col" nowrap="nowrap">URL</th>
                        <th scope="col" nowrap="nowrap">프로그램설명</th>
                    </tr>
                    </thead>
                
                <tbody>
                <c:if test="${fn:length(list_progrmmanage) == 0}">
                <tr> 
                      <td class="lt_text3" colspan="5">
                          <spring:message code="common.nodata.msg" />
                      </td>
                </tr>                                                 
                </c:if>
                <c:forEach var="result" items="${list_progrmmanage}" varStatus="status">
                    <tr>
                        <td class="lt_text3" ><c:out value="${status.count}"/></td>
                        <td class="lt_text3" >
                            <input type="checkbox" name="checkField" class="check2" title="선택">
					       <input name="checkProgrmFileNm" type="hidden" value="<c:out value='${result.progrmFileNm}'/>"/>
                        </td>
                        <td style="cursor:hand;" nowrap="nowrap">                                 
					            <span class="link"><a href="<c:url value='/sym/prm/EgovProgramListDetailSelectUpdt.do'/>?tmp_progrmNm=<c:out value="${result.progrmFileNm}"/>"  onclick="selectUpdtProgramListDetail('<c:out value="${result.progrmFileNm}"/>'); return false;"><c:out value="${result.progrmFileNm}"/></a></span>
					    </td>
					    <td nowrap="nowrap"><c:out value="${result.progrmKoreanNm}"/></td>
					    <td nowrap="nowrap"><c:out value="${result.URL}"/></td>
					    <td nowrap="nowrap"><c:out value="${result.progrmDc}"/></td>
                    </tr>
                    </c:forEach>
                </tbody>
                  
                </table>
            </div>
            <!-- search result end -->
            
	        
	        <!--  page start -->
	        <div id="paging_div">
	                <div id="pagination"><ul class="paging_align">
	                <ui:pagination paginationInfo = "${paginationInfo}"
	                    type="image"
	                    jsFunction="fnLinkPage"
	                    /></ul>
	                </div>  
	        </div>
	        <br/>
	        <!--  page end -->
	        </form>
        
           </div><!-- contents end -->
        </div>
    </div>
    <!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
    <!-- //footer 끝 -->
</div>
<!-- //wrap end -->
</body>
</html>
