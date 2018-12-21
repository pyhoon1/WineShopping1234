<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/adminMakeMatchFoodForm.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<script>
	$(function() {
		$("#nation").val($('#compareNation').val()).prop("selected", true);

		$("#wineImg").val($('#compareWine').val()).prop("selected", true);

		function readURL(input) {

			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#img').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		$("#uploadFile").change(function() {
			if (document.getElementById("uploadFile").files.length == 0) {

				$('#img').removeAttr("src");

				$('#img').attr('src', $("#originalImg").val());
			} else {
				readURL(this);
			}
		});

		// 리스트로 돌아가기
		$('#back').click(function() {
			window.history.back();
		})

	})
	function updateMatchFood() {
		if (confirm("상품을 등록하시겠습니까?")) {
			if ($('#matchFoodName').val() == "") {
				alert('제품 명을 입력해주세요!');
				$('#matchFoodName').focus();
				return false;
			} else if ($('#price').val() == "") {
				alert('가격을 입력해주세요!');
				$('#price').focus();
				return false;
			} else if ($('#weight').val() == "") {
				alert('중량을 입력해주세요!');
				$('#weight').focus();
				return false;
			} else if ($('#ex').val() == "") {
				alert('제품 설명을 입력해주세요!');
				$('#ex').focus();
				return false;
			} else if ($('#compareName').val() != $('#matchFoodName').val()) {
				if (document.getElementById('NoHave').innerHTML == '상품 중복 검사를 해주세요') {
					alert('중복 검사를 해주세요!');
					return false
				} else if (document.getElementById('NoHave').innerHTML == '등록된 상품이 있습니다') {
					alert('상품이 중복됩니다.');
					return false;
				} else {
					var form = $('#frm')[0];
					var formData = new FormData(form);
					$
							.ajax({
								url : 'updateMatchFood.do',
								type : 'post',
								data : formData,
								enctype : 'multipart/form-data',
								processData : false,
								contentType : false,
								error : function(error) {
									console.log(error);
								},
								success : function(result) {
									if (result == "Y") {
										alert("상품 수정에 성공했습니다.");
										location.href = "adminmatchFoodView.do?matchFoodId="
												+ $('#matchfoodId').val();
									} else {
										alert("상품 수정에 실패했습니다.")
										return false;
									}
								}

							})

				}

			} else {
				var form = $('#frm')[0];
				var formData = new FormData(form);
				$
						.ajax({
							url : 'updateMatchFood.do',
							type : 'post',
							data : formData,
							enctype : 'multipart/form-data',
							processData : false,
							contentType : false,
							error : function(error) {
								console.log(error);
							},
							success : function(result) {
								if (result == "Y") {
									alert("상품 수정에 성공했습니다.");
									location.href = "adminmatchFoodView.do?matchFoodId="
											+ $('#matchfoodId').val();
								} else {
									alert("상품 수정에 실패했습니다.")
									return false;
								}
							}

						})
			}

		}
	}

	function hasMatchFoodName() {
		if ($('#matchFoodName').val() == "") {
			alert("중복을 검사할 음식명을 입력해주세요");
			return false;
		} else {
			var information = {
				'matchFoodName' : $('#matchFoodName').val()
			}
			$
					.ajax({
						url : 'hasMatchFood.do',
						type : 'post',
						data : information,
						error : function(error) {
							console.log(error);
						},
						success : function(result) {
							if (result == "Y") {
								alert("등록된 상품이 있습니다.");
								document.getElementById('NoHave').innerHTML = "등록된 상품이 있습니다";
							} else {
								alert("등록 가능한 상품 입니다.");
								document.getElementById('NoHave').innerHTML = "등록이 가능한 상품입니다";
							}
						}

					})
		}
		;

	}

	function findNation() {
		$('.nation option[value=' + $('#search').val() + ']').attr('selected',
				'selected');
	};
	
	function goBack () {
		window.history.back();
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" id="compareName"
		value="${matchFood.matchFoodName}">
	<input type="hidden" id="compareNation" value="${matchFood.nation }">
	<input type="hidden" id="compareWine" value="${matchFood.wine }">
	<input type="hidden" id="matchfoodId" value="${matchFood.matchFoodId }">
	<form id="frm" method="post" enctype="multipart/form-data">
		<input type="hidden" id="originalImg" name="originalImg"
			value="${matchFood.img }"> <input type="hidden"
			id="matchFoodId" name="matchFoodId" value="${matchFood.matchFoodId }">
		<div class="wrapper">
			<table>
				<caption>부가 상품 등록</caption>
				<tr>
					<td>상품명</td>
					<td><input type="text" id="matchFoodName" name="matchFoodName"
						value="${matchFood.matchFoodName}"> <input type="button"
						onclick="hasMatchFoodName()" value="부가 상품 중복검사"> <span
						id="NoHave">상품 중복 검사를 해주세요</span></td>

					<td style="border: 0"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="number" id="price" name="price"
						value="${matchFood.price}"></td>
				</tr>
				<tr>
					<td>원산지</td>
					<td><select class="nation" id="nation" name="nation">
							<option value="독일">독일</option>
							<option value="스페인">스페인</option>
							<option value="이탈리아">이탈리아</option>
							<option value="프랑스">프랑스</option>

					</select></td>
				</tr>
				<tr>
					<td>상품 사진</td>
					<td><input type="file" id="uploadFile" id="uploadFile"
						name="uploadFile" accept="image/*"></td>
				</tr>
				<tr>
					<td>잘맞는 와인 타입</td>
					<td><select name="wineImg" id="wineImg">
							<option value="레드와인">레드와인</option>
							<option value="로제와인">로제와인</option>
							<option value="스파클링">스파클링</option>
							<option value="화이트와인">화이트와인</option>
					</select></td>
				</tr>
				<tr>
					<td>중량</td>
					<td><input type="text" name="weight" id="weight"
						value="${matchFood.weight}"></td>
				</tr>
				<tr>
					<td>음식 설명</td>
					<td><textarea rows="5" cols="10" name="ex" id="ex">${matchFood.ex}</textarea></td>
				</tr>
			</table>
			<div class="buttons">
				<input type="button" onclick="updateMatchFood()" value="기타 제품 수정"
					id="submit">
				<button>
				<a href="#" onclick="goBack();" >리스트로 돌아가기</a>
			</button>
			</div>
	</form>
	<div class="matchFoodImg">
		<img src="${matchFood.img}" id="img">
	</div>
	</div>
</body>
</html>