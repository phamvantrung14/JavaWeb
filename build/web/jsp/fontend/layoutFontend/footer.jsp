<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--footer area start-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer class="footer_widgets">
    <!--newsletter area start-->
    <div style="background: #f0eded; border-top: 1px solid #dadada;width: 100%">
        <div class="container">
            <div class="khaipv-footer-policies" style=" display: flex;-webkit-box-align: center; align-items: center;flex-wrap: wrap;-webkit-box-pack: justify; justify-content: space-between;padding-bottom: 25px;padding-top: 0;">
                <div class="policy-container" style=" width: 25%;display: flex;-webkit-box-align: center; align-items: center;margin-top: 30px;">
                    <div class="policy-icon"><i class="fas fa-shipping-fast"></i></div>
                    <div class="policy-info">
                        <span class="policy-info-title">CHÍNH SÁCH GIAO HÀNG</span>
                        <span class="policy-info-content">Nhận hàng và thanh toán tại nhà</span>
                    </div>
                </div>
                <div class="policy-container" style=" width: 25%;display: flex;-webkit-box-align: center; align-items: center;margin-top: 30px;">
                    <div class="policy-icon"><i class="fas fa-sync"></i></div>
                    <div class="policy-info">
                        <span class="policy-info-title">ĐỔI TRẢ DỄ DÀNG</span>
                        <span class="policy-info-content">Dùng thử trong vòng 3 ngày</span>
                    </div>
                </div>
                <div class="policy-container" style=" width: 25%;display: flex;-webkit-box-align: center; align-items: center;margin-top: 30px;">
                    <div class="policy-icon"><i class="fas fa-credit-card"></i></div>
                    <div class="policy-info">
                        <span class="policy-info-title">THANH TOÁN TIỆN LỢI</span>
                        <span class="policy-info-content">Trả tiền mặt, CK, trả góp 0%</span>
                    </div>
                </div>
                <div class="policy-container" style=" width: 25%;display: flex;-webkit-box-align: center; align-items: center;margin-top: 30px;">
                    <div class="policy-icon"><i class="fas fa-comments"></i></div>
                    <div class="policy-info">
                        <span class="policy-info-title">HỖ TRỢ NHIỆT TÌNH</span>
                        <span class="policy-info-content">Tư vấn, giải đáp mọi thắc mắc</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!--newsletter area end-->
    <div class="footer_top">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5 col-sm-7">
                    <div class="widgets_container contact_us">
                        <h3>GIỚI THIỆU VỀ ANTOMI</h3>
                        <div class="aff_content">
                            <p><strong>ANTOMI</strong> Có Ứng Dụng Trên Google Store và App Store.</p>
                        </div>
                        <div class="app_img">
                            <figure class="app_img">
                                <a href="#"><img src="/Project_Shop_Computer_005/frontend/assets/img/icon/icon-appstore.png" alt=""></a>
                            </figure>
                            <figure class="app_img">
                                <a href="#"><img src="/Project_Shop_Computer_005/frontend/assets/img/icon/icon-googleplay.png" alt=""></a>
                            </figure>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="widgets_container widget_menu">
                        <h3>CHÍNH SÁCH CHUNG</h3>
                        <div class="footer_menu">
                            <ul>
                                <c:forEach items="${listCSChung}" var="poliSt">
                                    <li><a href="<%=request.getContextPath()%>/antomi/chinh-sach.htm?policyStoreId=${poliSt.policyStoreId}">${poliSt.psname}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-5 col-sm-7">
                    <div class="widgets_container widget_menu">
                        <h3>HỖ TRỢ KHÁCH HÀNG</h3>
                        <div class="footer_menu">
                            <ul>
                                 <c:forEach items="${listCSMuaHang}" var="poliSt">
                                    <li><a href="<%=request.getContextPath()%>/antomi/chinh-sach.htm?policyStoreId=${poliSt.policyStoreId}">${poliSt.psname}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
               
                <div class="col-lg-3 col-md-7 col-sm-12">
                    <div class="widgets_container">
                        <h3>LIÊN HỆ VỚI CHÚNG TÔI</h3>
                        <div class="footer_contact">
                            <div class="footer_contact_inner">
                                <div class="contact_icone">
                                    <img src="/Project_Shop_Computer_005/frontend/assets/img/icon/icon-phone.png" alt="">
                                </div>
                                <div class="contact_text">
                                    <p>Hotline Free 24/24: <br> <strong>(+800) 123 456 789</strong></p>
                                </div>
                            </div>
                            <p>Địa chỉ: Số 129 + 131, phố Lê Thanh Nghị, Phường Đồng Tâm, Quận Hai Bà Trưng, Hà Nội</p>
                        </div>

                        <div class="footer_social">
                            <ul>
                                <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a class="instagram" href="#"><i class="fa fa-instagram"></i></a></li>
                                <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a class="rss" href="#"><i class="fa fa-rss"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer_bottom" style="background: #232f3e;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6">
                    <div class="copyright_area">
                        <p>Copyright &copy; 2020 <a href="#">Antomi</a> All Right Reserved.</p>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="footer_payment text-right">
                        <img src="/Project_Shop_Computer_005/frontend/assets/img/icon/payment.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!--footer area end-->

<!-- modal area start-->
<div class="modal fade" id="modal_box" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <div class="modal_body">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-sm-12">
                            <div class="modal_tab">
                                <div class="tab-content product-details-large">
                                    <div class="tab-pane fade show active" id="tab1" role="tabpanel">
                                        <div class="modal_tab_img">
                                            <a href="#"><img src="/Project_Shop_Computer_005/frontend/assets/img/product/productbig2.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab2" role="tabpanel">
                                        <div class="modal_tab_img">
                                            <a href="#"><img src="/Project_Shop_Computer_005/frontend/assets/img/product/productbig3.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab3" role="tabpanel">
                                        <div class="modal_tab_img">
                                            <a href="#"><img src="/Project_Shop_Computer_005/frontend/assets/img/product/productbig4.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab4" role="tabpanel">
                                        <div class="modal_tab_img">
                                            <a href="#"><img src="/Project_Shop_Computer_005/frontend/assets/img/product/productbig5.jpg" alt=""></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal_tab_button">
                                    <ul class="nav product_navactive owl-carousel" role="tablist">
                                        <li>
                                            <a class="nav-link active" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="false"><img src="/Poject_Shop_Computer_004/frontend/assets/img/product/product1.jpg" alt=""></a>
                                        </li>
                                        <li>
                                            <a class="nav-link" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false"><img src="/Poject_Shop_Computer_004/frontend/assets/img/product/product6.jpg" alt=""></a>
                                        </li>
                                        <li>
                                            <a class="nav-link button_three" data-toggle="tab" href="#tab3" role="tab" aria-controls="tab3" aria-selected="false"><img src="/Poject_Shop_Computer_004/frontend/assets/img/product/product9.jpg" alt=""></a>
                                        </li>
                                        <li>
                                            <a class="nav-link" data-toggle="tab" href="#tab4" role="tab" aria-controls="tab4" aria-selected="false"><img src="/Poject_Shop_Computer_004/frontend/assets/img/product/product14.jpg" alt=""></a>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-7 col-sm-12">
                            <div class="modal_right">
                                <div class="modal_title mb-10">
                                    <h2>Sit voluptatem rhoncus sem lectus</h2>
                                </div>
                                <div class="modal_price mb-10">
                                    <span class="new_price">$64.99</span>
                                    <span class="old_price" >$78.99</span>
                                </div>
                                <div class="modal_description mb-15">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia iste laborum ad impedit pariatur esse optio tempora sint ullam autem deleniti nam in quos qui nemo ipsum numquam, reiciendis maiores quidem aperiam, rerum vel recusandae </p>
                                </div>
                                <div class="variants_selects">
                                    <div class="variants_size">
                                        <h2>size</h2>
                                        <select class="select_option">
                                            <option selected value="1">s</option>
                                            <option value="1">m</option>
                                            <option value="1">l</option>
                                            <option value="1">xl</option>
                                            <option value="1">xxl</option>
                                        </select>
                                    </div>
                                    <div class="variants_color">
                                        <h2>color</h2>
                                        <select class="select_option">
                                            <option selected value="1">purple</option>
                                            <option value="1">violet</option>
                                            <option value="1">black</option>
                                            <option value="1">pink</option>
                                            <option value="1">orange</option>
                                        </select>
                                    </div>
                                    <div class="modal_add_to_cart">
                                        <form action="#">
                                            <input min="1" max="100" step="2" value="1" type="number">
                                            <button type="submit">add to cart</button>
                                        </form>
                                    </div>
                                </div>
                                <div class="modal_social">
                                    <h2>Share this product</h2>
                                    <ul>
                                        <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li class="pinterest"><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                        <li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                        <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="script.jsp"/>