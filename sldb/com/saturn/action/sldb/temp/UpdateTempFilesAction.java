package com.saturn.action.sldb.temp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.sldb.Temporary;

public class UpdateTempFilesAction implements IAction {
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		String files = request.getParameter("files");
		if(files!=null&&!"".equals(files)){
			if (Temporary.editFiles(id, files) == 1) {
				return new JspView("/app/sldb/temp/temp.jsp");
			} else {
				return new JspErrorView("更新信息失败");
			}
		}
		return new JspErrorView("无图片信息");
	}

	@Override
	public String requestMapping() {
		return "/app/sldb/temp/updatefiles.action";
	}
}
