<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/billingPage.css">
<title>Insert title here</title>
</head>
<body>
	<div class="main">
		<jsp:include page="../../header/header.jsp" />
		<div class="content">
            <div class="wrapper">
                <div class="billing-title">
                    <h1>주문서</h1>
                    <h3>상품이 맞는 지 잘 확인해 주세요.</h3>
                </div>
                <div class="billing-list">
                    <table>
                        <thead>
                            <tr>
                                <td><strong>상품 정보</strong></td>
                                <td><strong>수량</strong></td>
                                <td><strong>가격</strong></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>상품 이름</td>
                                <td>상품 수량</td>
                                <td>상품 금액</td>
                            </tr>
                            <tr>
                                <td>상품 이름</td>
                                <td>상품 수량</td>
                                <td>상품 금액</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="client-info">
                    <table>
                        <thead>
                            <tr>
                                <td colspan="2">배송 정보</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>수령인*</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>휴대전화*</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>배송지 주소*</td>
                                <td><input type="text" id="post"><br>
                                    <input type="text" id='addr1'><br>
                                    <input type="text" id='addr2'></td>
                            </tr>
                            <tr>
                                <td>배송 메모</td>
                                <td>
                                    <input type="text">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="billing-submit">
                    <table>
                        <thead>
                            <tr>
                                <td colspan="2">결제 수단</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>일반 결제</td>
                                <td>
                                    <label><input type="radio" name="paymentType">신용카드</label>
                                    <label><input type="radio" name="paymentType">휴대폰</label>
                                </td>
                            </tr>
                            <tr>
                                <td>스마일페이 결제</td>
                                <td>
                                    <label><input type="radio" name="paymentType">스마트 페이</label>
                                </td>
                            </tr>
                            <tr>
                                <td>네이버페이 결제</td>
                                <td>
                                    <label><input type="radio" name="paymentType">네이버 페이</label>
                                </td>
                            </tr>
                            <tr>
                                <td>계좌 이체</td>
                                <td>
                                    <label><input type="radio" name="paymentType">계좌 이체</label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="billing-total">
                    <table>
                        <tr>
                            <td>상품 금액</td>
                            <td>69,000원</td>
                        </tr>
                        <tr>
                            <td>배송비</td>
                            <td>3,000원</td>
                        </tr>
                        <hr id="line">
                        <tr>
                            <td>상품 금액</td>
                            <td>72,000원</td>
                        </tr>
                    </table>
                </div>
                <div class="billing-buttons">
                    <button onClick="location.href='#'" id="first">구매하기</button>
                    <button onClick="location.href='#'" id="last">취소</button>
                </div>
            </div>
        </div>
        
		<jsp:include page="../../footer/footer.jsp" />
	</div>
</body>
</html>