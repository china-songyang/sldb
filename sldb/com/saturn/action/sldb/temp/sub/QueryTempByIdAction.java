package com.saturn.action.sldb.temp.sub;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;

public class QueryTempByIdAction implements IAction{

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String pid = request.getParameter("id");
/*		
		PersonSub voPersonSub = PersonSub.get(pid);
		request.setAttribute("personSub", voPersonSub);*/
		return new JspView("/app/sldb/temp/sub/show.jsp?id=" + pid);
	}

	public String requestMapping() {
		return "/app/sldb/temp/sub/queryTempById.action";
	}

}
