package music.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import music.admin.admin.AdminVo;



public class LoginAdminInterceptor implements HandlerInterceptor{ //write,edit,delete,update로 가기전에 여기서 먼저 로그인 했는지 안했는지 체크, true면 가던길감, false면 튕김 
	
	/*
	 * preHandle: 컨트롤러 실행 전
	 * postHandle: 컨트롤러 실행 후 (뷰 리턴전)
 	 * afterCompletion: 뷰 실행 후 
	 */
	
	@Override
	public boolean preHandle(HttpServletRequest req, 
							HttpServletResponse res, 
							Object handler) throws Exception {
		//세션객체에서 userInfo를 가지고 와서 있으면(로그인 되어있으면) true
		//없으면 (미로그인) false
		HttpSession sess = req.getSession();
		AdminVo vo = (AdminVo)sess.getAttribute("adminInfo");
		if(vo ==null) {
			res.setContentType("text/html;charset=utf-8");
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("alert('로그인 후 사용가능합니다.');");
			out.println("location.href='/music/admin/login.do';");
			out.println("</script>");
			return false; //false를 리턴해야 튕겨냄
		}else {
			return true;
		}
	}
}
