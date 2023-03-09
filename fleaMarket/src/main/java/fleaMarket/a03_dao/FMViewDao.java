package fleaMarket.a03_dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import vo.ApplicationFile;
import vo.FApplication;
import vo.FApplicationSch;
import vo.FleaMarket;

public interface FMViewDao {
	public FleaMarket fmView(String postingNumber);
	public List<String> fmFileView(String postingNumber);
	public void insApp(FApplication ins);
	public void insAppFile(ApplicationFile f);
	public int totCnt(FApplicationSch sch);
	public List<FApplication> appReceivedList(FApplicationSch sch);
	//public ApplicationFile appReceivedView(int applicationNo);
	public String appFileView(int applicationNo);
	public void updateAppRe(Map<String,String> map);
	
}
