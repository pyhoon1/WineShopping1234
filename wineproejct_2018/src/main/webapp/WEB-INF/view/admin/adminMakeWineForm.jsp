<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/adminMakeWineForm.css">
<script>

$(function(){
	function readURL(input) {
		 
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	 
	        reader.onload = function (e) {
	            $('#img').attr('src', e.target.result);
	        }
	 
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	 
	$("#uploadFile").change(function(){
		if(document.getElementById("uploadFile").files.length == 0){
			
			$('#img').removeAttr("src");
				
		}else{
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
			$.ajax({
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

	})

	function insertWine() {
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
			} else if (document.getElementById("uploadFile").files.length == 0) {
				alert("사진을 넣어주세요");
				$('uploadFile').focus();
				return false;
			} else if (document.getElementById('NoHave').innerHTML == '상품 중복 검사를 해주세요') {
				alert('중복 검사를 해주세요!');
				return false;
			} else if (document.getElementById('NoHave').innerHTML == '등록된 상품이 있습니다') {
				alert('상품이 중복됩니다.');
				return false;
			} else {
				var form = $('#frm')[0];
				var formData = new FormData(form);
				$.ajax({
					url : 'adminInsertWine.do',
					type : 'post',
					data : formData,
					enctype : 'multipart/form-data',
					processData : false,
					contentType : false,
					error : function(error) {
						console.log(error);
					},
					success : function(result) {
						alert("상품 등록에 성공했습니다. 메인으로 돌아갑니다.");
						location.href = "adminProduct.do?pageNum=1";
					}

				})
			}

		}
	}

	function findYear() {
		$('.year option[value=' + $('#search').val() + ']').attr('selected',
				'selected');
	};
	
	function goBack () {
		window.history.back();
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<form id="frm" enctype="multipart/form-data">
        <input type="hidden" id="matchFoodName" name="matchFoodName" value="">
        <input type="hidden" id="matchFoodId" name="matchFoodId" value="">
        <div class="wrapper">
            <table>
            	<caption>와인 추가 페이지</caption>
                <tr>
                    <td>생산자</td>
                    <td>포도 품종</td>
                    <td>와인 종류</td>
                    <td>상품명</td>
                    <td>상품 원산지</td>
                </tr>
                <tr>
                    <td><input type="text" name="producer" id="producer" placeholder="생산자"></td>
                    <td><input type="text" name="variety" id="variety" placeholder="와인 종류"></td>
                    <td><select name="wineKinds" id="wineKinds">
                            <option value="레드와인">레드와인</option>
                            <option value="로제와인">로제와인</option>
                            <option value="스파클링">스파클링</option>
                            <option value="화이트와인">화이트와인</option>
                        </select></td>
                    <td><input type="text" name="productName" id="productName" placeholder="상품명 중복 검사"><input type="button"
                            onclick="hasWine()" value="부가 상품 중복검사"><span id="NoHave">상품 중복 검사를 해주세요</span></td>
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
                    <td><textarea rows="" cols="" name="wineEx" id="wineEx" placeholder="와인 설명"></textarea></td>
                    <td><textarea rows="" cols="" name="brandEx" id="brandEx" placeholder="브랜드 설명"></textarea></td>
                    <td><input type="number" name="price" placeholder="와인 가격"></td>
                    <td><select id="year" name="year" class="year">
                            <c:forEach begin="1" end="2500" varStatus="status">
                                <option value="${status.getEnd()+1 - status.count}">${status.getEnd()+1 - status.count}</option>
                            </c:forEach>
                        </select></td>
                    <td>
                        <input type="text" id="search" name="search" maxlength="4" placeholder="원하시는 연도를 검색해주세요">
                        <input type="button" onclick="findYear()" value="검색">
                    </td>
                </tr>
                </tr>
                <tr>
                    <td>궁합 좋은 음식</td>
                    <td>도수</td>
                    <td>용량</td>
                    <td>온도</td>
                    <td>상품 이미지</td>
                </tr>
                <tr>
                    <td>
                        <c:forEach items="${matchFood}" var="matchFood">
                            <label><input type="checkbox" id="matchfood" name="matchfood" value="${matchFood.matchFoodName}">${matchFood.matchFoodName}</label>
                            <input type="hidden" id="${matchFood.matchFoodName}" value="${matchFood.matchFoodId}">
                        </c:forEach>
                    </td>
                    <td><input type="text" name="alcohol" id="alcohol" placeholder="도수"></td>
                    <td><input type="text" name="weight" id="weight" placeholder="용량"></td>
                    <td><input type="text" name="temperature" id="temperature" placeholder="온도"></td>
                    <td><input type="file" name="uploadFile" id="uploadFile" accept="image/*"></td>
                    <td><img src="" id="img"></td>
                </tr>

            </table>
            <div class=buttons>
                <input type="button" onclick="insertWine()" value="와인 등록" id="submit">
                <button>
				<a href="#" onclick="goBack();" >리스트로 돌아가기</a>
			</button>
            </div>
        </div>
    </form>
</body>
</html>