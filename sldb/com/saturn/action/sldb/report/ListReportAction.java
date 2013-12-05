package com.saturn.action.sldb.report;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.db.ListData;
import com.saturn.app.utils.BeanUtils;
import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.easyui.DataGridInfo;
import com.saturn.app.web.view.JsonView;
import com.saturn.sldb.PersonSub;
import com.saturn.sldb.Report;

public class ListReportAction implements IAction{

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		DataGridInfo dataGridInfo = new DataGridInfo(request);
		
		//PersonSub vo = BeanUtils.getBean(request, PersonSub.class);
		//String id = request.getParameter("id");
		//vo.setPid(id);
		
		ListData<Map<String, String>> data = Report.getAll(null, dataGridInfo.getStartPage(), dataGridInfo.getRows(),
				dataGridInfo.getSortId(), dataGridInfo.getOreder()); 
		return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(), data.getList()));
	}

	public String requestMapping() {
		return "/app/sldb/report/listReport.action";
	}

}
