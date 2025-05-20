<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
    request.setCharacterEncoding("UTF-8");
    String user_id = (String) session.getAttribute("UserId");
    if (user_id != null) {
        response.sendRedirect("tradeListPage.do?category=7");
        return;
    }
%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>signup_1</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="./css/SignUp.css">
    <link rel="stylesheet" href="./css/HeaderFooter.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">

    <%@ include file="Header.jsp" %>

    <script type="text/javascript">
        function CheckForm(form) {
            const required1 = document.getElementById("agreement1").checked;
            const required2 = document.getElementById("agreement2").checked;

            if (!required1 || !required2) {
                alert("필수 항목을 선택해주세요.");
                return false;
            }

            form.action = "../Page/SignUp2.jsp";
            form.submit();
        }
    </script>
</head>

<body>
<section style="margin: 0 15% 15% 15%">
    <div class="signup_title">회원가입</div>
    <div class="step_title">
        <p class="step_point">1 약관동의</p>
        <p>2 정보입력</p>
        <p>3 가입 완료</p>
    </div>
    <hr style="margin-top: 0px">
    <div class="step_ments_1">
        <p class="step_ment_1"><span style="color: #2B5566; font-weight: bold;">아나바다</span>에 오신 것을 환영합니다!</p>
        <p class="step_ment_1">약관을 충분히 숙지한 후 동의해주시기 바랍니다.</p>
        <p class="step_ment_1">고객님께서는 동의를 거부할 수 있습니다.</p>
        <p class="step_ment_1">단, 필수항목 등의 거부 시에는 회원가입이 제한됩니다.</p>
    </div>
    <hr>

    <!-- 약관 Accordion -->
    <div class="accordion" id="accordionExample">
        <!-- 아나바다 서비스 이용약관 (필수) -->
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                    <span style="color:red">(필수)</span>&nbsp;아나바다서비스 이용약관
                </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne"
                 data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <!-- 약관 내용 생략 가능 -->
                    이 약관은 ...
                </div>
            </div>
        </div>

        <!-- 개인정보 수집 및 이용동의 (필수) -->
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    <span style="color:red">(필수)</span>&nbsp;개인정보 수집 및 이용동의
                </button>
            </h2>
            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                 data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    개인정보 수집 목적 및 항목 ...
                </div>
            </div>
        </div>

        <!-- 마케팅 동의 (선택) -->
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    마케팅 정보 활용 동의
                </button>
            </h2>
            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                 data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    마케팅 정보 수신 동의 내용 ...
                </div>
            </div>
        </div>
    </div>

    <!-- 체크박스 -->
    <div class="ageement_check">
        <form method="get" onsubmit="CheckForm(this); return false;">
            <label class="check_style"><input type="checkbox" name="agreement1" id="agreement1">
                <span style="color:red">(필수)</span> 아나바다 서비스 동의</label><br>
            <label class="check_style"><input type="checkbox" name="agreement2" id="agreement2">
                <span style="color:red">(필수)</span> 개인정보 수집 및 이용동의</label><br>
            <label class="check_style"><input type="checkbox" name="agreement3" id="agreement3">
                개인정보의 취급위탁 동의</label><br>
            <input type="submit" class="next_btn" value="다음">
        </form>
    </div>
</section>

<!-- 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

<%@ include file="./HeaderFooter/Footer.jsp"%>
</body>
</html>
