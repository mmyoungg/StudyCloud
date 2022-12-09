<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

	<div class="infoBox">
					<ul class="Qna_list">
						<li class="qna_hr">
							<c:choose>
								<c:when test="${not empty qnaList }">
									<c:forEach items="${qnaList }" var="qnaList">
										<div class="qna_box">
											<span><img src='/upload/${qnaList.FILEUPLOAD_STOR }' class="pimg" onerror="this.src='https://ifh.cc/g/BQ84hH.jpg'"></span>
											<p class="write_name">${qnaList.MEMBER_NICK }</p>
											<p class="qna_cont" style="font-weight: bold;">[ ${qnaList.SROOMQNA_TITLE } ]</p>
											<p class="qna_cont">${qnaList.SROOMQNA_CONTENT }</p>
											<p class="write_date"><fmt:formatDate value="${qnaList.SROOMQNA_DATE }" pattern="yy-MM-dd HH:mm:ss"/></p>
											<button class="miniBtn">수정</button><button class="miniBtn">삭제</button>
										</div>
									</c:forEach>							
								</c:when>
								<c:otherwise>
									<div class="qna_box_empty">🔎 등록된 QnaA가 없습니다.</div>
								</c:otherwise>
							</c:choose>
						</li>
					</ul>				
				</div>

