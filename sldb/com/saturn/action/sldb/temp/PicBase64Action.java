package com.saturn.action.sldb.temp;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.saturn.app.utils.PicBase64;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;

public class PicBase64Action implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		String photo = request.getParameter("photo");
		//String strImg = GetImageStr("e:\\1.jpg");
		String strImg = PicBase64.GetImageStr(photo);
		/*Map<String, String> data = new HashMap<String, String>();
		data.put("data", strImg);
		String json = JSONObject.fromObject(data).toString();
		System.out.println(json);
		return new JsonView(json);*/
		return new JsonView(strImg);
	}

	public String requestMapping() {
		return "/app/sldb/temp/picbase64.do";
	}

}
