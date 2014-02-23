package com.saturn.action.sldb.temp.sub;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.TempSub;
import com.saturn.sldb.Temporary;

public class AddAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		TempSub vo = BeanUtils.getBean(request, TempSub.class);

		String pid = request.getParameter("pid");
		Temporary voTemporary = Temporary.get(pid);

		vo.setPname(voTemporary.getName());
		request.setAttribute("temporary", voTemporary);

		if (TempSub.add(vo) == 1) {
			return new JspView("/app/sldb/temp/sub/show.jsp?id=" + pid);
		} else {
			return new JspErrorView("添加家庭成员信息失败。");
		}
	}

	public String requestMapping() {
		return "/app/sldb/temp/sub/add.action";
	}

}
