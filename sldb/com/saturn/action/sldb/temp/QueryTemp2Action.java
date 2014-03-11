package com.saturn.action.sldb.temp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Temporary;

public class QueryTemp2Action implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String view = request.getParameter("view");
		String id = request.getParameter("id");
		Temporary vo = Temporary.get(id);
		
		request.setAttribute("temp", vo);
		if("ok".equals(view)){
			return new JspView("/app/sldb/temp/view.jsp");
		}else{
			return new JspView("/app/sldb/temp/upfile.jsp");
		}
	}
	
	@Override
	public String requestMapping() {
		return "/app/sldb/temp/query2.action";
	}
}
