<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.board.trade.SellBoardDAO"%>
<%@ page import="com.example.demo.board.trade.SellBoardDTO"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%


ServletContext context = request.getServletContext();
String saveFolder ="./Page/img/sellWriteImg";
String realFolder = "";
int maxImgSize = 10*1024*1024;
String encoding = "UTF-8";
realFolder = context.getRealPath(saveFolder);
MultipartRequest mr = new MultipartRequest(request, realFolder, maxImgSize, encoding, new DefaultFileRenamePolicy());



String nickname = (String) session.getAttribute("Nickname");
String writeNickname = mr.getParameter("WriteNickname");




int sell_num = Integer.parseInt(mr.getParameter("sell_num"));
String org_img = mr.getFilesystemName("img-upload-input");
String title = mr.getParameter("title");
String contents = mr.getParameter("contents");
String category = mr.getParameter("category");
String condition = mr.getParameter("sell_condition");
int price = Integer.parseInt(mr.getParameter("sell_price"));

String ext = org_img.substring(org_img.lastIndexOf("."));
String now = new SimpleDateFormat("yyyyMMdd_MmsS").format(new Date());
String new_img = now+ext;

File oldFile = new File(realFolder + File.separator + org_img);
File newFile = new File(realFolder + File.separator + new_img);

oldFile.renameTo(newFile);

//카테고리 숫자 받아오기 - 반복문(아스키코드 변환)
int category_num = 6;

for(int i=48; i<55; i++){
	if(category.charAt(13) == i){
				category_num = i-48;
	}
};

//상품 상태 숫자 받아오기 
int condition_num = 0;
if(condition.equals("new")){
	condition_num = 1;
}else{
	condition_num = 2;
}


SellBoardDTO dto = new SellBoardDTO();

dto.setSell_title(title);
dto.setSell_contents(contents.replace("\r\n", "<br/>"));
dto.setSell_category(category_num);
dto.setSell_price(price);
dto.setUser_picture("./img/sellWriteImg/"+new_img);
dto.setSell_condition(condition_num);
dto.setSell_num(sell_num);

SellBoardDAO dao = new SellBoardDAO();

	int result = dao.updateEdit(dto);
	dao.close();
	
	if(result == 1){
		out.println("<script>alert('수정되었습니다.'); location.href='../tradeListPage.do?category=7';</script>");
		return;
	}else{
		
	}
%>