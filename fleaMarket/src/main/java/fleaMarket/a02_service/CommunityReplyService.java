package fleaMarket.a02_service;

import java.util.List;

import vo.ReplyVo;

public interface CommunityReplyService {
	public int insertReply(ReplyVo vo);
	public int insertReReply(ReplyVo vo);
	public List<ReplyVo> replyList(int communityNumber);
	public int getReplyCnt(int communityNumber);
}
