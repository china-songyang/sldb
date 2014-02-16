package com.saturn.action.sldb.temp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Temporary;

public class DeleteTempAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		String ids = request.getParameter("ids");
		String[] idsStr = ids.split("__");
		
		Temporary.removes(idsStr);
		return new JspView("/app/sldb/temp/temp.jsp");
	}
	@Override
	public String requestMapping() {
		return "/app/sldb/temp/delete.action";
	}
}
