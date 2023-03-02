package fleaMarket.a03_dao;

import java.util.List;

import vo.FleaMarket;

public interface FMViewDao {
	public List<FleaMarket> fmList(FleaMarket sch);
	public FleaMarket getFm(String postingNumber);
}
