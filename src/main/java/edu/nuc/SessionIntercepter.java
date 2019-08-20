package edu.nuc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.nuc.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/*
import com.isscollage.entity.Users;
*/

public class SessionIntercepter implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		//UTL:除了login.jsp是可以公开访问的，其他的URL都进行拦截控制
		if (uri.indexOf("/login") >= 0) {
			return true;
			}
		//获取session
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		//判断session中是否有用户数据，如果有，则返回true，继续向下执行
		if (user != null) {
			System.out.print(user.getUsername()+"==================进入拦截器");
			    return true;
			}
		System.out.print("跳转登录页面==================进入拦截器");
		//不符合条件的给出提示信息，并转发到登录页面
		request.setAttribute("msg", "您还没有登录，请先登录！");
		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
		return false;
		}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
