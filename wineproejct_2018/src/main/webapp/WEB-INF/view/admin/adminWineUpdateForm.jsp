<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/adminMakeWineForm.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<script>
	$(function() {
		$("#nation").val($('#compareNation').val()).prop("selected", true);

		$("#wineKinds").val($('#compareWine').val()).prop("selected", true);

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
	})

	function hasWine() {
		if ($('#productName').val() == "") {
			alert("중복을 검사할 음식명을 입력해주세요");
			return false;
		} else {
			var information = {
				'productName' : $('#productName').val()
			}
			$
					.ajax({
						url : 'hasWine.do',
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

	$(function() {

		$('.year option[value=' + $('#years').val() + ']').attr('selected',
				'selected');

		var matchproductN = $("#matchFoodName").val();
		var matchproductI = $("#matchFoodId").val();

		var matchproductNs = matchproductN.split(",");

		if (matchproductN != "") {
			for ( var i in matchproductNs) {
				$('.' + matchproductNs[i]).attr('checked', true);
			}
		}

		if (matchproductN != "") {
			matchproductN = matchproductN + ",";
			matchproductI = matchproductI + ",";
			$("#matchFoodName").val(matchproductN);
			$("#matchFoodId").val(matchproductI);
		}

		var product = "";
		var products = "";
		$('input:checkbox[id="matchfood"]')
				.click(
						function() {
							if (this.checked) {

								document.getElementById('matchFoodName').value += $(
										this).val()
										+ ",";
								document.getElementById('matchFoodId').value += document
										.getElementById($(this).val()).value
										+ ",";

							} else {
								var productL = document
										.getElementById('matchFoodName').value
										.split(',');
								var productLs = document
										.getElementById('matchFoodId').value
										.split(',');
								var productId = document
										.getElementById('matchFoodName').value
										.split(',', productL.length - 1);
								var productIds = document
										.getElementById('matchFoodId').value
										.split(',', productLs.length - 1);
								for ( var i in productId) {
									if (productId[i] == $(this).val()) {
										productId.splice(i, 1);
									}
								}
								for ( var s in productIds) {
									if (productIds[s] == document
											.getElementById($(this).val()).value) {
										productIds.splice(s, 1);
									}
								}
								document.getElementById('matchFoodName').value = "";
								document.getElementById('matchFoodId').value = "";
								for ( var i in productId) {
									document.getElementById('matchFoodName').value += productId[i]
											+ ",";
								}
								for ( var s in productIds) {
									document.getElementById('matchFoodId').value += productIds[s]
											+ ",";
								}

							}

						})

		// 리스트로 돌아가기
		$('#back').click(function() {
			window.history.back();
		})

	})

	function updateWine() {
		if (confirm("상품을 등록하시겠습니까?")) {
			if ($('#producer').val() == "") {
				alert('생산자를 입력해주세요!');
				$('#producer').focus();
				return false;
			} else if ($('#variety').val() == "") {
				alert('품종을 입력해주세요!');
				$('#variety').focus();
				return false;
			} else if ($('#wineEx').val() == "") {
				alert('와인 설명을 입력해주세요!');
				$('#wineEx').focus();
				return false;
			} else if ($('#brandEx').val() == "") {
				alert('브랜드 설명을 입력해주세요!');
				$('#brandEx').focus();
				return false;
			} else if ($('#price').val() == "") {
				alert('가격을 입력해주세요!');
				$('#price').focus();
				return false;
			} else if ($('#year').val() == "") {
				alert('와인 년도를 입력해주세요!');
				$('#year').focus();
				return false;
			} else if ($('#alcohol').val() == "") {
				alert('도수를 입력해주세요!');
				$('#alcohol').focus();
				return false;
			} else if ($('#weight').val() == "") {
				alert('중량 을 입력해주세요!');
				$('#weight').focus();
				return false;
			} else if ($('#brandEx').val() == "") {
				alert('브랜드 설명을 입력해주세요!');
				$('#brandEx').focus();
				return false;
			} else if ($('#temperature').val() == "") {
				alert('온도를 입력해주세요 ');
				$('#temperature').focus();
				return false;
			} else if ($('#comparewineName').val() != $('#productName').val()) {
				if (document.getElementById('NoHave').innerHTML == '상품 중복 검사를 해주세요') {
					alert('중복 검사를 해주세요!');
					return false;
				} else if (document.getElementById('NoHave').innerHTML == '등록된 상품이 있습니다') {
					alert('상품이 중복됩니다.');
					return false;
				}
			} else {
				var form = $('#frm')[0];
				var formData = new FormData(form);
				$.ajax({
					url : 'adminUpdateWine.do',
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
							location.href = "adminWineView.do?productId="
									+ $('#productId').val();
						} else {
							alert("제품 수정에 실패했습니다.");
						}

					}

				})
			}

		}
	}

	function findYear() {
		$('.year option[value=' + $('#search').val() + ']').attr('selected',
				'selected');
	};

	function goBack() {
		window.history.back();
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<form id="frm" enctype="multipart/form-data">
		<input type="hidden" id="matchFoodName" name="matchFoodName"
			value="${product.matchFoodName}"> <input type="hidden"
			id="matchFoodId" name="matchFoodId" value="${product.matchFoodId }">
		<input type="hidden" id="comparewineName"
			value="${product.productName }"> <input type="hidden"
			id="compareNation" value="${product.nation }"> <input
			type="hidden" id="compareWine" value="${product.wineKinds }">
		<input type="hidden" id="originalImg" name="originalImg"
			value="${product.img }"> <input type="hidden" id="productId"
			name="productId" value="${product.productId }"> <input
			type="hidden" id="years" value="${product.year }">
		<div class="wrapper">
			<table>
				<caption>
					와인 수정 페이지
					<div class="wineImg"><img src="${product.img}"></div>
				</caption>
				<tr>
					<td>생산자</td>
					<td>포도 품종</td>
					<td>와인 종류</td>
					<td>상품명</td>
					<td>상품 원산지</td>
				</tr>
				<tr>
					<td><input type="text" name="producer" id="producer"
						value="${product.producer }"></td>
					<td><input type="text" name="variety" id="variety"
						value="${product.variety}"></td>
					<td><select name="wineKinds" id="wineKinds">
							<option value="레드와인">레드와인</option>
							<option value="로제와인">로제와인</option>
							<option value="스파클링">스파클링</option>
							<option value="화이트와인">화이트와인</option>
					</select></td>
					<td><input type="text" name="productName" id="productName"
						value="${product.productName}"><input type="button"
						onclick="hasWine()" value="부가 상품 중복검사"><span id="NoHave">상품
							중복 검사를 해주세요</span></td>
					<td><select class="nation" id="nation" name="nation">
							<option value="독일">독일</option>
							<option value="스페인">스페인</option>
							<option value="이탈리아">이탈리아</option>
							<option value="프랑스">프랑스</option>
					</select></td>
				<tr>
					<td>와인 설명</td>
					<td>브랜드 설명</td>
					<td>상품 가격</td>
					<td colspan="2">상품 년도</td>
				</tr>
				<tr>
					<td><textarea rows="" cols="" name="wineEx" id="wineEx">${product.wineEx}</textarea></td>
					<td><textarea rows="" cols="" name="brandEx" id="brandEx">${product.brandEx}</textarea></td>
					<td><input type="number" name="price" min="0"
						value="${product.price}"></td>
					<td><select id="year" name="year" class="year">
							<c:forEach begin="1" end="2500" varStatus="status">
								<option value="${status.getEnd()+1 - status.count}">${status.getEnd()+1 - status.count}</option>
							</c:forEach>
					</select></td>
					<td>
						<input type="text" id="search" name="search" maxlength="4">
						<input type="button" onclick="findYear()" value="검색">
					</td>
				</tr>
				<tr>
					<td>궁합 좋은 음식</td>
					<td>도수</td>
					<td>용량</td>
					<td>온도</td>
					<td>상품 이미지</td>
				</tr>
				<tr>
					<td><c:forEach items="${matchFood}" var="matchFood">
							<label><input type="checkbox" id="matchfood"
								name="matchfood" class="${matchFood.matchFoodName}"
								value="${matchFood.matchFoodName}">${matchFood.matchFoodName}</label>
							<input type="hidden" id="${matchFood.matchFoodName}"
								value="${matchFood.matchFoodId}">
						</c:forEach></td>
					<td><input type="text" name="alcohol" id="alcohol"
						value="${product.alcohol }"></td>
					<td><input type="text" name="weight" id="weight"
						value="${product.weight}"></td>
					<td><input type="text" name="temperature" id="temperature"
						value="${product.temperature }"></td>
					<td><input type="file" id="uploadFile" name="uploadFile"
						accept="image/*"></td>
				</tr>

			</table>
			<div class="buttons">
				<input type="button" onclick="updateWine()" value="와인 수정"
					id="submit">
				<button>
					<a href="#" onclick="goBack();">리스트로 돌아가기</a>
				</button>
			</div>
		</div>
	</form>
</body>
</html>