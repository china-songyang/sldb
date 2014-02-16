package com.saturn.action.sldb.temp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Temporary;

public class UpdateTempAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		Temporary temp = BeanUtils.getBean(request, Temporary.class);

		if (Temporary.edit(temp) == 1) {
			return new JspView("/app/sldb/temp/temp.jsp");
		} else {
			return new JspErrorView("更新信息失败");
		}

	}

	@Override
	public String requestMapping() {
		return "/app/sldb/temp/update.action";
	}
}
