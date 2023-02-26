package fleaMarket.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FleaMarketOverallCheckController {

//	http://localhost:7030/fleaMarket/totalSearch.do
		@RequestMapping("totalSearch.do")
		public String totalSearch() {
		int a=1;
			return "FleaMarketOverallCheck";
		}
}
