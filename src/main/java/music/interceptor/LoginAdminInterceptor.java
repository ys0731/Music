package music.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import music.admin.admin.AdminVo;



public class LoginAdminInterceptor implements HandlerInterceptor{ 
		
	@Override
	public boolean preHandle(HttpServletRequest req, 
							HttpServletResponse res, 
							Object handler) throws Exception {

		HttpSession sess = req.getSession();
		AdminVo vo = (AdminVo)sess.getAttribute("adminInfo");
		if(vo ==null) {
			res.setContentType("text/html;charset=utf-8");
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("alert('로그인 후 사용가능합니다.');");
			out.println("location.href='/music/admin/login.do';");
			out.println("</script>");
			return false; 
		}else {
			return true;
		}
	}
}
