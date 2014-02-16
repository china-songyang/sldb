package com.saturn.action.sldb.temp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.DateUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.auth.User;
import com.saturn.sldb.PersonState;
import com.saturn.sldb.Temporary;

public class EndTempAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String id = request.getParameter("id");
		String type = request.getParameter("type");

		User user = (User)request.getSession().getAttribute("authUser");
		Temporary tmp = Temporary.get(id);
		
			
		PersonState personState = new PersonState(null, id, user.getId(),
				user.getName(), DateUtils.getSystemTime(), tmp
						.getName(), tmp.getIdentify(), "",
				"", tmp.getCreaterDepartment(), "临时救助");
		

		if ("1".equals(type)) { // 乡镇街-申报
			tmp.setState("待审核");
			if (Temporary.edit(tmp) == 1) {
				
				personState.setState(tmp.getState());
				PersonState.add(personState);
				return new JspView("/app/sldb/temp/temp.jsp");
			} else {
				return new JspErrorView("信息更新失败");
			}
		} else if ("2".equals(type)) { // 乡镇街-完成
			tmp.setState("完成");
			if (tmp.getMoney() == null || tmp.getMoney().equals("")) {
				return new JspView("/app/sldb/temp/endError.jsp");
			} else {

				if (Temporary.edit(tmp) == 1) {
					
					personState.setState(tmp.getState());
					PersonState.add(personState);
					return new JspView("/app/sldb/temp/temp.jsp");
				} else {
					return new JspErrorView("信息更新失败");
				}
			}
		} else if ("3".equals(type)) { // 民政局-完成
			tmp.setState("完结");
			if (tmp.getMoney() == null || tmp.getMoney().equals("")) {
				return new JspView("/app/sldb/temp/endError.jsp");
			} else {

				if (Temporary.edit(tmp) == 1) {
					personState.setState(tmp.getState());
					PersonState.add(personState);
					return new JspView("/app/sldb/temp/check.jsp");
				} else {
					return new JspErrorView("信息更新失败");
				}
			}
		} else{ // 民政局-驳回
			tmp.setState("驳回");
			personState.setNote(request.getParameter("note"));
			if (Temporary.edit(tmp) == 1) {
				personState.setState(tmp.getState());
				PersonState.add(personState);
				return new JspView("/app/sldb/temp/check.jsp");
			} else {
				return new JspErrorView("信息更新失败");
			}
		}
	}

	@Override
	public String requestMapping() {
		return "/app/sldb/temp/endTemp.action";
	}
}
