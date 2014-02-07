package com.saturn.action.auth.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.auth.User;

public class LoginUserNameAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		String number = request.getParameter("number");

		User user = User.get(number);
		if (user.getTemplate() == null ||user.getTemplate().equals("")) {
			return new JspView("/app/login.jsp"); //手动输入密码页面
		} else {
			return new JspView("/app/login2.jsp"); //指纹输入密码页面
		}
	}
	
	@Override
	public String requestMapping() {
		return "/app/auth/user/LoginUserName.do";
	}
}
