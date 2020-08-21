<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<%="<style>.form1 .form-row:not(:first-child) { margin-top : 10px; }</style>"%>

<script>
	function cancle() {
		history.back();
	}
	function submitLoginForm(form) {
		form.loginPw.value = form.loginPw.value.trim();
		if (form.loginPw.value.length == 0) {
			alert('로그인 비번을 입력해주세요.');
			form.loginPw.focus();
			return;
		}
		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';
		form.submit();
	}
</script>
<!-- 비밀번호확인 메인컨텐츠 -->
<div class="con sign-form-box">
	<h1>비밀번호 확인</h1>
	<form action="dopasswordForPrivate" method="POST"
		class="table-box con form1" 
		onsubmit="submitLoginForm(this); return false;">
		<input type="hidden" name="loginPwReal" />
		<table>
			<colgroup>
				<col width="100">
			</colgroup>
			<tbody>
				<tr>
					<th>비밀번호</th>
					<td>
						<div class="form-control-box">
							<input type="password" placeholder="로그인 비밀번호를 입력해주세요."
								name="loginPw" maxlength="30" />
						</div>
					</td>
				</tr>
				<tr>
					<th>확인</th>
					<td>
						<button class="btn btn-primary" type="submit">비밀번호확인</button>
						<button class="btn btn-primary" onclick="cancle()">취소</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<%@ include file="../part/foot.jspf"%>
