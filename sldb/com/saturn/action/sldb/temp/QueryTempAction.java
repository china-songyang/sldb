package com.saturn.action.sldb.temp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Temporary;

public class QueryTempAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		Temporary vo = Temporary.get(id);
		
		request.setAttribute("temp", vo);
		return new JspView("/app/sldb/temp/edit.jsp");
	}
	
	@Override
	public String requestMapping() {
		return "/app/sldb/temp/query.action";
	}
}
