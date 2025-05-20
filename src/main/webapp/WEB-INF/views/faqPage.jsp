<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>FAQ</title>
  <link rel="stylesheet" href="./css/Faq_style.css">
  <link rel="stylesheet" href="./css/Freeboard_style.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet" crossorigin="anonymous">
</head>
<body style="margin:0;">

<section style="margin:0% 15% 15% 15%">
  <div><p class="faq_title">고객센터</p></div>

  <div class="container2">
    <div class="row">
      <form method="get">
        <table class="pull-right">
          <tr>
            <td>
              <select class="form-control" name="searchField">
                <option value="q_title">제목</option>
                <option value="q_content">내용</option>
              </select>
            </td>
            <td>
              <input type="text" class="form-control" placeholder="검색어 입력" name="searchWord" maxlength="100">
            </td>
            <td>
              <button type="submit" class="write_btn">검색</button>
            </td>
          </tr>
        </table>
      </form>
    </div>
  </div>

  <form method="get">
    <div class="btn-mini-bar">
      <button class="btn-mini-menu" name="category" value="1" type="submit">TOP 10</button>
      <button class="btn-mini-menu" name="category" value="2" type="submit">구매/판매</button>
      <button class="btn-mini-menu" name="category" value="3" type="submit">거래품목</button>
      <button class="btn-mini-menu" name="category" value="4" type="submit">계정/인증</button>
    </div>
  </form>

  <hr style="height: 2px; margin-bottom: 5%;">

  <div class="accordion" id="accordionFaq">
    <c:forEach items="${FaqLists}" var="row" varStatus="status">
      <div class="accordion-item">
        <h2 class="accordion-header" id="heading-${row.q_num}">
          <button class="accordion-button collapsed" type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapse-${row.q_num}"
                  aria-expanded="false"
                  aria-controls="collapse-${row.q_num}">
            <span style="color: #337A98;"><strong>Q</strong></span>&nbsp;${row.q_title}
          </button>
        </h2>
        <div id="collapse-${row.q_num}" class="accordion-collapse collapse"
             aria-labelledby="heading-${row.q_num}" data-bs-parent="#accordionFaq">
          <div class="accordion-body">${row.q_content}</div>
        </div>
      </div>
    </c:forEach>
  </div>

  <hr style="height: 2px; margin-top: 5%;">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
          crossorigin="anonymous"></script>

  <!-- 상단 이동 버튼 -->
  <a href="#" style="position: fixed; bottom: 30px; right: 30px;">
    <img src="./img/top-arrow-svgrepo-com.svg" alt="Top">
  </a>

</section>

<%@ include file="./HeaderFooter/Footer.jsp" %>

</body>
</html>
