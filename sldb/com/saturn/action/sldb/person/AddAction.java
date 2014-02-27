package com.saturn.action.sldb.person;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Person;

public class AddAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		Person vo = BeanUtils.getBean(request, Person.class);
		String type=request.getParameter("type");
		if(type!=null&&type.trim().equals("auto")){
			if(Person.addAuto(vo)==1){
				return new JspView("/app/sldb/person/apply.jsp");
			}else {
				return new JspErrorView("添加申请低保信息失败");
			}
		}else if (Person.add(vo) == 1) {
			return new JspView("/app/sldb/person/apply.jsp");
		} else {
			return new JspErrorView("添加申请低保信息失败");
		}
	}

	public String requestMapping() {
		return "/app/sldb/person/add.action";
	}
	
}
