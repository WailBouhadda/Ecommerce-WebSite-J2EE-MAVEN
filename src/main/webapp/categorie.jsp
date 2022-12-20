

<jsp:include page="header.jsp"></jsp:include>    


  <%@page import="java.util.*"%>
  <%@page import="java.io.*"%>
  <%@page import="entities.categorie"%>
  <%@page import="dao.categorieDAO"%>
  <%@page import="entities.phone"%>
  <%@page import="dao.phoneDAO"%>
  

<%


int id = 0;

if(request.getParameter("c") != null){
	id = Integer.parseInt(request.getParameter("c"));
}else{
	response.sendRedirect("shop.jsp");
}


phoneDAO pdao = new phoneDAO();

phone p = pdao.getPhoneById(id);

categorieDAO cdao = new categorieDAO();

ArrayList<categorie> categos = cdao.getcategories();

categorie c = cdao.getcategorieById(id);

ArrayList<phone> phones = pdao.getPhonesByCategorieId(c.getId());


%>

	              </div>
            </div>
    </section>
    <!-- Hero Section End -->

	
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2><%=c.getName() %></h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span><%=c.getName() %></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
					<jsp:include page="sidebar.jsp"></jsp:include>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select>
                                        <option value="0">Default</option>
                                        <option value="0">Default</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span><%=phones.size() %></span> Products found</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <% 
		                       if(phones != null){	
			
									for(int i = 0 ; i < phones.size() ; i++){
										phone p1 = new phone();
										p1 = phones.get(i);
												
						%>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="phones/<%=p1.getImage()%>">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="phone.jsp?id=<%=p1.getId()%>"><%=p1.getName()%></a></h6>
                                    <h5>$<%=p1.getPrice()%></h5>
                                </div>
                            </div>
                        </div>
						<%}}else{ %>
									<p style="color:red;"><i style="margin-right:10px;" class="fa-solid fa-triangle-exclamation"></i>UNE ERREUR EST SURVENUE</p>
						<%} %>
                    </div>
                    <div class="product__pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->



<jsp:include page="footer.jsp"></jsp:include>    
