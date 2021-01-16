package controller;

import beans.Product;
import entity.ProductEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "LoadProductController",urlPatterns = "/LoadProductController")
public class LoadProductController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        // nhận 3 tham số từ ajax
        String select = request.getParameter("sort");
        int num = Integer.parseInt(request.getParameter("num"));

        // hai cái trên có r, t chỉnh cái page
        int page = Integer.parseInt(request.getParameter("page"));
// gì thấy ghê dãy, bình tĩnh



        // chỗ hiện để 1 cái select chọn hiện 10, 15, 20 sản phẩm trên 1 trang chắc hay hơn
        //còn cái hiện tại là hiện 2 3 4 sản phẩm trên 1 dòng chắc hơi khó làm do mặc định bà load có 2 sản phẩm trên 1 dòng ak

        //

        // còn có số trang hiện tại nữa, tùy theo cái templte bà muốn bỏ bao nhiu tham số để nó sử lí cx dc
        // chỗ này vd bà muôn sắp xếp danh sách theo kiêu "select", + số sản phẩm trên 1 trang + só trang hiện tại
        // dưới sql phải sử lí làm sao load lên dc danh sách phải  sắp xếp danh sách theo kiêu "select", + số sản phẩm trên 1 trang + só trang hiện tại
        // tốt nhất là dựa vào page + số sản phẩm trên 1 trang load đúng chỗ đó thôi, k nên load toàn bộ ,
        // vd như click vào số 4 , hiện 10 : nó chỉ load danh sách trang số 4, và laod 10 sản phẩm đc cái danh sách trả về trang
        // productList, trang đó nhận dc 10 sản phẩm thì nó hiện 10
        // dùng cái limit thầy ddeeemo hôm bữa á chọn vừa đủ


        System.out.println(select + "\t" + num + "\t" + page);
         ProductEntity p =  new ProductEntity();
        // bỏ 3 tham số đó zô để load list sản phẩm phù hợp + số trang phù hợp
        Collection<Product> values = p.getAll(page,select,num);


        // truyền lại cho request nó sử lí
            request.setAttribute("products", values);

            request.setAttribute("numberPage",p.getNumberPage());
            // truyền thêm cái này set màu cho đẹp, là khi chỗ nào có nowpage thì tô đỏ lên
        //hong, hong thích đỏ, =.=
            request.setAttribute("nowpage",page);

    //ôi
            System.out.println(values);


            // chỗ nó trả về nek, nó trả về trang productlist, kèm theo danh sách sản phẩm ,
            // đáng lẽ cái chỗ List<Product> products = pe.getListByPage(arr, start, end); load danh sach trang này cx
            // dc xét trong này, bên jsp chỉ đc nhận dữ liệu bên controller rôi in ra thôi

            // data bên  $('#loadProductList').html(data); chính là cái này, nó chuyển đến trang productList.jsp sử lí đồng thời
            // lấy hết trang đó làm dâta luôn

        // chuyển tới trang này sử lí, đồng thời nó cx là data bên lab6.jsp
        request.getRequestDispatcher("productList.jsp").forward(request,response);

    }
}
