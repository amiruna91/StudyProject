<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
	<title>자유 게시판</title>
</head>

<body>
	<div class="container mt-3 mb-5">
		<div class="row">
			<div class="col-12">
				<form id="form-board" action="add.do" method="post" enctype="multipart/form-data">
					<div class="card">
						<div class="card-header">새 글 입력폼</div>
						<div class="card-body">
							<div class="form-group">
								<label>제목</label>
								<input type="text" class="form-control" name="title" id="board-title" />
							</div>
							<div class="form-group">
								<label>내용</label>
								<textarea rows="6" class="form-control" name="content"></textarea>
							</div>
							<div class="form-group">
								<label>첨부파일</label>
								<input type="file" class="form-control" name="upfile" />
							</div>
							<div class="form-group">
								<label>비밀번호</label>
								<input type="password" class="form-control" name="password" id="board-password" />
							</div>
						</div>
						<div class="card-footer text-right">
							<a href="list.do" class="btn btn-secondary">취소</a>
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>
	<script type="text/javascript" src="/resources/jquery/jquery.min.js"></script>
	<script type="text/javascript">
		$(function () {
			// 입력폼에서 submit 이벤트 발생시 이벤트핸들러함수 등록해두기
			$("#form-board").submit(function () {
				var $titleField = $("#board-title");
				var $writerField = $("#board-writer");
				var $passwordField = $("#board-password");

				if ($titleField.val() == "") {
					alert("제목은 필수 입력값입니다.");
					$titleField.focus();
					return false;
				}
				if ($writerField.val() == "") {
					alert("작성자는 필수 입력값입니다.");
					$writerField.focus();
					return false;
				}
				if ($passwordField.val() == "") {
					alert("비밀번호는 필수 입력값입니다.");
					$passwordField.focus();
					return false;
				}
			});
		})
	</script>
</body>

</html>