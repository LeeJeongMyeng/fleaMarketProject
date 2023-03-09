package fleaMarket.a03_dao;
import java.util.List;

import vo.ReplyVo;
public interface ReplyDao {
	//부모 댓글 처리할 메서드 
	public int replyWrite(ReplyVo vo);
	public int replyMax();
	public int replyCheck(ReplyVo vo);
	public int rereplyWrite(ReplyVo vo);
	public List<ReplyVo> replyList(int communityNumber);
	public int getGroupOrder(int groupId);
	public int getReplyCnt(int communityNumber);
}
