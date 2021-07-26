package music.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import music.user.UserService;
import music.user.UserVo;

public class ExpiryDateInterceptor implements HandlerInterceptor{
	
	@Autowired
	UserService uService;
	
	@Override
	public boolean preHandle(HttpServletRequest req, 
							HttpServletResponse res, 
							Object handler) throws Exception {
		
			HttpSession sess = req.getSession();
			UserVo uv = (UserVo)sess.getAttribute("userInfo");
			if (uv != null) {
				UserVo expiryDate = uService.isUserExpiryDate(uv);
				if(expiryDate !=null) { //만료일이 지나지 않았으면  
					sess.setAttribute("expiryDate", expiryDate);
				}
			}
			return true;
		
	}
}
