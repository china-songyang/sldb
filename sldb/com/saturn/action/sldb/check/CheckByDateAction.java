package com.saturn.action.sldb.check;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.sldb.IdCheck;

public class CheckByDateAction implements IAction {


	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String pid = request.getParameter("pid");
		//String way = "identify";
		String createTime = request.getParameter("createTime");
		
		return new JsonView(IdCheck.checkByIdWithDate(pid,createTime));
	}
	
	public String requestMapping() {
		return "/app/sldb/check/checkByDate.action";
	}
	
}





