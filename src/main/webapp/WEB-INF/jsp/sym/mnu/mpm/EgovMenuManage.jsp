<%--
  Class Name : EgovMenuManage.jsp
  Description : 메뉴관리 조회 화면
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
<title>메뉴관리리스트</title>
<!--
/* ********************************************************
 * 모두선택 처리 함수
 ******************************************************** */
function fCheckAll() {
    var checkField = document.menuManageForm.checkField;
    if(document.menuManageForm.checkAll.checked) {
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
function fDeleteMenuList() {
    var checkField = document.menuManageForm.checkField;
    var menuNo = document.menuManageForm.checkMenuNo;
    var checkMenuNos = "";
    var checkedCount = 0;
    if(checkField) {

        if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkMenuNos += ((checkedCount==0? "" : ",") + menuNo[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkMenuNos = menuNo.value;
            }
        }
    }   

    document.menuManageForm.checkedMenuNoForDel.value=checkMenuNos;
    document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageListDelete.do'/>";
    document.menuManageForm.submit(); 
}

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
//  document.menuManageForm.searchKeyword.value = 
    document.menuManageForm.pageIndex.value = pageNo;
    document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>";
    document.menuManageForm.submit();
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectMenuManageList() { 
    document.menuManageForm.pageIndex.value = 1;
    document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>";
    document.menuManageForm.submit();
}

/* ********************************************************
 * 입력 화면 호출 함수
 ******************************************************** */
function insertMenuManage() {
    document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuRegistInsert.do'/>";
    document.menuManageForm.submit();   
}

/* ********************************************************
 * 일괄처리 화면호출 함수
 ******************************************************** */
/* function bndeInsertMenuManage() {
        document.menuManageForm.action = "<c:url value='/sym/mpm/EgovMenuRegistInsert.do'/>";
        document.menuManageForm.submit();   
    }
 */
function bndeInsertMenuManage() {
    document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuBndeRegist.do'/>";
    document.menuManageForm.submit();
} 
/* ********************************************************
 * 상세조회처리 함수
 ******************************************************** */
function selectUpdtMenuManageDetail(menuNo) {
    document.menuManageForm.req_menuNo.value = menuNo;
    document.menuManageForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuManageListDetailSelect.do'/>";
    document.menuManageForm.submit();   
}
/* ********************************************************
 * 최초조회 함수
 ******************************************************** */
function fMenuManageSelect(){ 
    document.menuManageForm.action = "<c:url value='/sym/mpm/EgovMenuManageSelect.do'/>";
    document.menuManageForm.submit();
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
                            <li>내부시스템관리</li>
                            <li>&gt;</li>
                            <li>메뉴관리</li>
                            <li>&gt;</li>
                            <li><strong>메뉴목록관리</strong></li>
                        </ul>
                    </div>
            </div>
            <div id="content_field"><!--contents start-->
        
        
            <!-- sub title start -->
            <div><h2>메뉴관리리스트</h2></div>
            <!-- sub title end -->
            
	        <!-- content start -->
	        <form name="menuManageForm" action ="<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>" method="post">
	        <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
			<input name="checkedMenuNoForDel" type="hidden" />
			<input name="req_menuNo" type="hidden"  />
	        
	        <!-- search area start-->
            <div class="search_service">
                <div class="search_area">
                <div class="search_conditions" >                   
                    <label for="searchKeyword">메뉴명 : </label>
                    <input name="searchKeyword" id="searchKeyword" title="검색" type="text" value="<c:out value="${userSearchVO.searchKeyword}"/>" />
                </div>
                <div class="search_buttons">
                    <a href="#LINK" onclick="javascript:selectMenuManageList(); return false;" ><img src="<c:url value='/images/img_search.gif' />" alt="search" />조회 </a>
                    <a href="<c:url value='/sym/mpm/EgovMenuRegistInsert.do'/>" onclick="bndeInsertMenuManage(); return false;">일괄등록</a>                              
                    <a href="<c:url value='/sym/mpm/EgovMenuRegistInsert.do'/>" onclick="insertMenuManage(); return false;"><spring:message code="button.create" /></a>
                    <a href="#LINK" onclick="fDeleteMenuList(); return false;"><spring:message code="button.delete" /></a>
                </div>
                </div> 
            </div>
            <!-- search area end -->
            
	        <div>갯수 : <strong><c:out value="${paginationInfo.totalRecordCount}"/></strong></div>

            <!-- search result start -->
            <div class="search_result_div">
            
                <table width="98%" cellpadding="0" cellspacing="0" summary="회원목록">
                <caption>메뉴관리 목록</caption>
                    <colgroup>
                        <col width="4%" >
                        <col width="13%" >  
                        <col width="20%" >
                        <col width="20%" >
                        <col width="30%" >
                        <col width="13%" >
                    </colgroup>
                
                <thead>
                <tr>
                        <th scope="col" class="f_field" nowrap="nowrap"><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fCheckAll();" title="전체선택"/></th>
                        <th scope="col" nowrap="nowrap">메뉴번호</th>
                        <th scope="col" nowrap="nowrap">메뉴명</th>
                        <th scope="col" nowrap="nowrap">프로그램파일명</th>
                        <th scope="col" nowrap="nowrap">메뉴설명</th>
                        <th scope="col" nowrap="nowrap">상위메뉴번호</th>
                    </tr>
                </thead>
                
                <tbody>
                <c:if test="${fn:length(list_menumanage) == 0}">
                <tr> 
                      <td class="lt_text3" colspan="8">
                          <spring:message code="common.nodata.msg" />
                      </td>
                </tr>                                                 
                </c:if>
                <c:forEach var="result" items="${list_menumanage}" varStatus="status">
                    <tr>
                        <td nowrap="nowrap">
					       <input type="checkbox" name="checkField" class="check2" title="선택"/>
					       <input name="checkMenuNo" type="hidden" value="<c:out value='${result.menuNo}'/>"/>
					    </td>
					    <td nowrap="nowrap"><c:out value="${result.menuNo}"/></td>
					    <td nowrap style="cursor:hand;">
					       <span class="link"><a href="<c:url value='/sym/mpm/EgovMenuManageListDetailSelect.do?req_menuNo='/>${result.menuNo}" onclick="selectUpdtMenuManageDetail('<c:out value="${result.menuNo}"/>'); return false;"><c:out value="${result.menuNm}"/></a></span>
					    </td>
					    <td nowrap="nowrap"><c:out value="${result.progrmFileNm}"/></td>
					    <td nowrap="nowrap"><c:out value="${result.menuDc}"/></td>  
					    <td nowrap="nowrap"><c:out value="${result.upperMenuId}"/></td>  
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
