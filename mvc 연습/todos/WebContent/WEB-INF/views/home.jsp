<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>To Do</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<%@ include file="nav.jsp" %>
	<!-- Content -->
	<div class="row mb-3">
		<div class="col-12">
			<div class="card">
				<div class="card-header">전체 일정</div>
				<div class="card-body">
					<div class="row">
						<c:forEach items="${todos }" var="todo" >
							<div class="col-4 mb-2">
								<div class="card">
									<div class="card-header d-flex justify-content-between">
										<div><c:out value="${todo.title }" /></div> 
										<div><span id="card-todo-status-${todo.no }" class="badge ${todo.statusClass }">${todo.status }</span></div>
									</div>
									<div class="card-body">
										<div class="row mb-3">
											<div class="col-9">
												<small><c:out value="${todo.content }" /></small>
											</div>
											<div class="col-3">
												<button type="button" class="btn btn-outline-secondary btn-sm" onclick="openTodoDetailModal(${todo.no})">상세</button>
											</div>
										</div>
										<div class="d-flex justify-content-between">
											<span class="text-secondary font-weight-bold">${todo.userName }</span>											
											<strong><fmt:formatDate value="${todo.day }" pattern="yyyy-MM-dd"/></strong>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="row">
						<div class="col-12 text-center"><button class="btn btn-outline-dark btn"> 더보기 </button></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 상세정보 모달창 -->
	<div class="modal" id="modal-todo-detail">
		<div class="modal-dialog modal-lg">
 			<div class="modal-content">
   				<div class="modal-header">
     				<h4 class="modal-title">상세 정보</h4>
     				<button type="button" class="close" data-dismiss="modal">&times;</button>
   				</div>
   				<div class="modal-body">
     				<div class="row">
     					<div class="col-12">
     						<table class="table table-bordered table-sm">
     							<colgroup>
     								<col width="15%">
     								<col width="35%">
     								<col width="15%">
     								<col width="35%">
     							</colgroup>
     							<tbody>
     								<tr>
     									<th>번호</th>
     									<td id="modal-todo-no">100</td>
     									<th>제목</th>
     									<td id="modal-todo-title">프로젝트 일정 회의</td>
     								</tr>
     								<tr>
     									<th>작성자</th>
     									<td id="modal-todo-username">홍길동</td>
     									<th>처리예정일</th>
     									<td id="modal-todo-day">2020-06-12</td>
     								</tr>
     								<tr>
     									<th>상태</th>
     									<td id="modal-todo-status">처리예정</td>
     									<th>완료일자</th>
     									<td id="modal-todo-completed-day"></td>
     								</tr>
     								<tr>
     									<th style="vertical-align: middle;">내용</th>
     									<td colspan="3"><small id="modal-todo-content">내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 </small></td>
     								</tr>
     							</tbody>
     						</table>
     					</div>
     				</div>
   				</div>
   				<div class="modal-footer" >
   					<span id="btn-todo-modify" style="display: none">
	     				<button type="button" class="btn btn-success btn-sm" onclick="updateTodoStatus('처리완료')">처리완료</button>
	     				<button type="button" class="btn btn-info btn-sm" onclick="updateTodoStatus('처리중')">처리중</button>
	     				<button type="button" class="btn btn-secondary btn-sm" onclick="updateTodoStatus('보류')">보류</button>
	     				<button type="button" class="btn btn-danger btn-sm" onclick="updateTodoStatus('삭제')">삭제</button>
   					</span>
     				<button type="button" class="btn btn-outline-dark btn-sm" data-dismiss="modal">닫기</button>
   				</div>
 			</div>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</div>
<script type="text/javascript">
	function openTodoDetailModal(no) {
		$("#modal-todo-detail").modal('show');
		detailTodo(no);
	}
	
	function detailTodo(todoNo) {
		$("#btn-todo-modify").css("display", "none");
		var xhr = new XMLHttpRequest;
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var text = xhr.responseText;
				var resText = JSON.parse(text);
				loadDetailTable(resText);
			}
		}
		
		xhr.open("get", "todo/detail.hta?todoNo=" + todoNo);
		xhr.send();
	}
	
	function updateTodoStatus(status) {
		var no = $("#modal-todo-no").text();
		var xhr = new XMLHttpRequest;
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var data = JSON.parse(xhr.responseText);
				loadDetailTable(data)
				$("#card-todo-status-" + data.no).text(data.status);
				$("#card-todo-status-" + data.no).attr("class", "badge " + data.statusClass);
			}
		}
		
		xhr.open("get", "todo/updatestatus.hta?todono=" + no + "&status=" + status);
		xhr.send();
		
	}
	
	function loadDetailTable(text) {
		$("#modal-todo-no").text(text.no);
		$("#modal-todo-title").text(text.title);
		$("#modal-todo-username").text(text.userName);
		$("#modal-todo-day").text(text.day);
		$("#modal-todo-status").text(text.status);
		$("#modal-todo-completed-day").text(text.completedDay);
		$("#modal-todo-content").text(text.content);
				
		if (text.canModify) {
			$("#btn-todo-modify").css("display", "");
		}
	}
</script>
</body>
</html>
