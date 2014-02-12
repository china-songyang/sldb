package com.saturn.action.sldb.person;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.auth.User;
import com.saturn.auth.Organization;
import com.saturn.sldb.Person;

public class ConfirmAction implements IAction {
	public static Map<String, String> urlMap = new HashMap<String, String>();
	
	static {
		urlMap.put("创建", "apply.jsp");
		urlMap.put("申报", "first.jsp");
		urlMap.put("审核", "check.jsp"); //原初审
		urlMap.put("核对", "checkOk.jsp");//原已核对
		urlMap.put("初审", "trial.jsp");
		urlMap.put("抽查", "sample.jsp");
		urlMap.put("决议", "end.jsp");
	}

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		
		String idStr = request.getParameter("id");
		String note = request.getParameter("note");
		if (note == null) {
			note = "";
		}
		
		String[] ids = idStr.split("__");
		User user = (User)request.getSession().getAttribute("authUser");
		String userId = user.getId();
		Organization organization = Organization.getOneOrganizationByUser(userId);
		String department = organization.getName();
		
		if (ids != null && ids.length > 0) {
			String id = ids[0];
			Person person = Person.get(id);
			String state = person.getState();
			if (Person.confirm(ids, user.getId(), note, department) == 1) {
				return new JspView("/app/sldb/person/" + urlMap.get(state));
			} else {
				return new JspErrorView("确认低保信息失败");
			}
		} else {		
			return new JspErrorView("没有申报人");
		}
	}

	public String requestMapping() {
		return "/app/sldb/person/confirm.action";
	}
}
