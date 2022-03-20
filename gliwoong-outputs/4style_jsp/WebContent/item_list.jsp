<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="product.ProductDAO" %>
<%@ page import="product.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %>

<%!
	final int ITEM_LENGTH_IN_PAGE = 15;
	final int LIST_LENGTH_IN_PAGE = 5;
	DecimalFormat formatter = new DecimalFormat("###,###");
%>
<%
	String keyword = "흰색 티";
	ProductDAO productDAO = new ProductDAO();
	ArrayList<Product> product_list = productDAO.select_products(keyword);

	String current_page = request.getParameter("current_page");

	int item_length = product_list.size();
	int page_length = item_length / ITEM_LENGTH_IN_PAGE + 1;
	
	int page_num = Integer.parseInt(request.getParameter("page_num"));
	
	int first_item_index = (page_num - 1) * ITEM_LENGTH_IN_PAGE;
	int last_item_index = first_item_index + ITEM_LENGTH_IN_PAGE - 1;
	if(last_item_index > item_length - 1) last_item_index = item_length - 1;
	
	int first_page = ((page_num - 1) / LIST_LENGTH_IN_PAGE) * LIST_LENGTH_IN_PAGE + 1;
	int last_page = first_page + LIST_LENGTH_IN_PAGE - 1;
	if(last_page > page_length) last_page = page_length;
	
	int pre_page = page_num - 1;
	if(pre_page < 1) pre_page = first_page;
	
	int post_page = page_num + 1;
	if(post_page > page_length) post_page = last_page; 
%>

<section class="main special">
	<!--제목-->
	<header class="major">
		<h2>상품 추천</h2>
	</header>
	
	<!--리스트생성-->
	<div class="list">
		<div class="box alt">
		
			<!--목록 전체 박스 생성-->
			<div class="row gtr-uniform">
			
				<!--박스크기 width 33%기준 정렬-->
				<%
					for(int i = first_item_index; i <= last_item_index; i++){
						Product product = product_list.get(i);
				%>
						<div class="col-4">
							<!--개별 상품박스 생성-->
							<div class="product-box">
								<span class="image fit"><img src="<%=product.getImageUrl() %>" onclick="location.href='<%=product.getLink() %>'" alt="" /></span>
								<div class="row gtr-uniform">
									<div class="col-11">
										<a href="<%=product.getLink() %>"><%=product.getName() %><br/><%=formatter.format(product.getSalePrice()) %>원</a>
									</div>
									<div class="col-1" style="padding-left: 0;">
										<i><br/></i>
										<i class="like icon fa-heart" onclick="addLike(this);"></i>
									</div>
								</div>
							</div>
						</div>
				<%
					}
				%>
			</div>
		</div>
	</div>
	
	<!--페이지 넘김-->
	<footer class="major pages">
		<p>
			<%	
				out.println("<a href=\"./AI_codi_research.jsp?page_num=" + 1 + "\">&nbsp;" + "<<" + "&nbsp;</a>");
				out.println("<a href=\"./AI_codi_research.jsp?page_num=" + pre_page + "\">&nbsp;" + "<" + "&nbsp;</a>");
				for(int i = first_page; i <= last_page; i++){
					if(first_page != i){
						out.println("&nbsp;&nbsp;|&nbsp;&nbsp;");
					}
					if(i == page_num){
						out.println("<a href=\"./AI_codi_research.jsp?page_num=" + i + "\"><b>&nbsp;" + i + "&nbsp;</b></a>");
					}
					else{
						out.println("<a href=\"./AI_codi_research.jsp?page_num=" + i + "\">&nbsp;" + i + "&nbsp;</a>");
					}
				}
				out.println("<a href=\"./AI_codi_research.jsp?page_num=" + post_page + "\">&nbsp;" + ">" + "&nbsp;</a>");
				out.println("<a href=\"./AI_codi_research.jsp?page_num=" + page_length + "\">&nbsp;" + ">>" + "&nbsp;</a>");
			%>
		</p>
	</footer>
</section>