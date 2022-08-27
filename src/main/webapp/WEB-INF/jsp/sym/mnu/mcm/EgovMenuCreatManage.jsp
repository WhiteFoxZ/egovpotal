<%--
  Class Name : EgovMenuCreatManage.jsp
  Description : 메뉴생성관리 조회 화면
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
<title>메뉴생성관리</title>
<script type="text/javaScript">
<!--
/* ********************************************************
 * 최초조회 함수
 ******************************************************** */
function fMenuCreatManageSelect(){ 
    document.menuCreatManageForm.action = "<c:url value='/sym/mnu/mcm/EgovMenuCreatManageSelect.do'/>";
    document.menuCreatManageForm.submit();
}

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
    document.menuCreatManageForm.pageIndex.value = pageNo;
    document.menuCreatManageForm.action = "<c:url value='/sym/mnu/mcm/EgovMenuCreatManageSelect.do'/>";
    document.menuCreatManageForm.submit();
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectMenuCreatManageList() { 
    document.menuCreatManageForm.pageIndex.value = 1;
    document.menuCreatManageForm.action = "<c:url value='/sym/mnu/mcm/EgovMenuCreatManageSelect.do'/>";
    document.menuCreatManageForm.submit();
}

/* ********************************************************
 * 메뉴생성 화면 호출
 ******************************************************** */
function selectMenuCreat(vAuthorCode) {
    document.menuCreatManageForm.authorCode.value = vAuthorCode;
    document.menuCreatManageForm.action = "<c:url value='/sym/mnu/mcm/EgovMenuCreatSelect.do'/>";
    window.open("#", "_menuCreat", "scrollbars = yes, top=100px, left=100px, height=700px, width=850px");    
    document.menuCreatManageForm.target = "_menuCreat";
    document.menuCreatManageForm.submit();  
}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
//-->
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
                            <li><strong>메뉴생성관리</strong></li>
                        </ul>
                    </div>
            </div>
            <div id="content_field"><!--contents start-->
        
        
            <!-- sub title start -->
            <div><h2>메뉴생성관리</h2></div>
            <!-- sub title end -->
            
	        <!-- content start -->
	        <form name="menuCreatManageForm" action ="<c:url value='/sym/mpm/EgovMenuCreatManageSelect.do'/>" method="post">
	        <input type="submit" id="invisible" class="invisible"/>
	        <input name="checkedMenuNoForDel" type="hidden" />
			<input name="authorCode"          type="hidden" />
			<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
			
	        <!-- search area start-->
            <div class="search_service">
                <div class="search_area">
                <div class="search_conditions" >                   
                                <ul id="search_first_ul">
                                <li>
                                    <label for="searchKeyword">보안설정대상ID : </label>                                    
                                    <input id="searchKeyword" name="searchKeyword" type="text" size="80" value=""  maxlength="60" title="검색조건"/>
                                </li>
                            </ul>
                    
                </div>
                <div class="search_buttons">
                    <!-- 검색 -->
                    <input type="submit" value="<spring:message code="button.search" />" onclick="selectMenuCreatManageList(); return false;" />
                    
                    <!-- 목록 -->
                    <a href="<c:url value='/sym/mpm/EgovMenuCreatManageSelect.do'/>" ><spring:message code="button.list" /></a>
                    
                </div>
                </div> 
            </div>
            <!-- search area end -->
            
	        <div>사용자수 <strong><c:out value="${paginationInfo.totalRecordCount}"/></strong></div>

            <!-- search result start -->
            <div class="search_result_div">
            
                <table width="98%" cellpadding="0" cellspacing="0" summary="회원목록">
                <caption>메뉴생성관리 목록</caption>
                    <colgroup>
                    <col width="20%" >
                    <col width="20%" >  
                    <col width="20%" >
                    <col width="20%" >
                    <col width="20%" >
                    </colgroup>
                
                <thead>
                <tr>
                        <th scope="col" class="f_field" nowrap="nowrap">권한코드</th>
                        <th scope="col" nowrap="nowrap">권한명</th>
                        <th scope="col" nowrap="nowrap">권한 설명</th>
                        <th scope="col" nowrap="nowrap">메뉴생성여부</th>
                        <th scope="col" nowrap="nowrap">메뉴생성</th>
                    </tr>
                </thead>
                
                <tbody>
                <c:if test="${fn:length(resultList) == 0}">
                <tr> 
                      <td class="lt_text3" colspan="8">
                          <spring:message code="common.nodata.msg" />
                      </td>
                </tr>                                                 
                </c:if>
                <c:forEach var="result" items="${resultList}" varStatus="status">
                   <tr>
					    <td nowrap="nowrap"  ><c:out value="${result.authorCode}"/></td>
					    <td nowrap="nowrap"  ><c:out value="${result.authorNm}"/></td>
					    <td nowrap="nowrap"  ><c:out value="${result.authorDc}"/></td>
					    <td nowrap="nowrap"  >
					          <c:if test="${result.chkYeoBu > 0}">Y</c:if>
					          <c:if test="${result.chkYeoBu == 0}">N</c:if>
					    </td>
					    <td nowrap="nowrap" >
                            <a href="<c:url value='/sym/mnu/mcm/EgovMenuCreatSelect.do'/>?authorCode='<c:out value="${result.authorCode}"/>'"  onclick="selectMenuCreat('<c:out value="${result.authorCode}"/>'); return false;">메뉴생성</a>
					    </td>
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
