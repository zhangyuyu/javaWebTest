package servlet;

import dao.AddressDao;
import entity.Address;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "addressServlet",urlPatterns = "/addressServlet")
public class addressServlet extends HttpServlet {
    private AddressDao addressDao = new AddressDao();
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = "list.jsp";
        String method = request.getParameter("method");
        boolean redirect = false;

        if (method.equals("add")){
            String name = request.getParameter("name");
            String zip = request.getParameter("zip");
            Address address = new Address();
            address.setName(name);
            address.setZip(zip);
            addressDao.add(address);
            path = "addressServlet?method=list";
            redirect = true;
        } else if(method.equals("list")) {
            List<Address> list = addressDao.findAll();
            request.setAttribute("list",list);
//            redirect = true;
        } else if (method.equals("delete")){
            String[] checkboxID = request.getParameterValues("cb-id");
            if( checkboxID != null){
                for( String a: checkboxID){
                    addressDao.delete(Integer.parseInt(a));
                }
            }
            path = "addressServlet?method=list";
            redirect = true;
        }else if (method.equals("update")) {
            Address address = new Address();
            String name = request.getParameter("name");
            String zip = request.getParameter("zip");
            String[] checkboxID = request.getParameterValues("cb-id");
            if (checkboxID != null) {
                for (String a : checkboxID) {
                    address.setId(Integer.parseInt(a));
                    address.setName(name);
                    address.setZip(zip);
                    addressDao.update(address);
                }
            }
            path = "addressServlet?method=list";
            redirect = true;
        }

        if(redirect){
            response.sendRedirect(path);
        }
        else{
            request.getRequestDispatcher(path).forward(request,response);
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
