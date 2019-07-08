package sample;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Top extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException{
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("title", "This is sample param.");
        System.out.print("====doGet====");

//        String[] nensyu = request.getParameterValues("nensyu");
//        int nensyu_val = Integer.parseInt(nensyu[0]);
//
//        if (nensyu_val < 2000000){
//            request.setAttribute("hantei", "貧乏ですね");
//        }else{
//            request.setAttribute("hantei", "大丈夫でしょう");
//        }

        String disp = "/index.jsp";
        RequestDispatcher dispatch = request.getRequestDispatcher(disp);
        dispatch.forward(request, response);
    }
}
