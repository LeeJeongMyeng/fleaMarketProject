package fleaMarket.a02_service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fleaMarket.a03_dao.ReplyDao;
import vo.ReplyVo;

@Service
public class CommunityReplyServiceImpl implements CommunityReplyService {
	
	private ReplyDao mapper;
	
	
	/**
	 * @param mapper
	 */
	@Autowired
	public CommunityReplyServiceImpl(ReplyDao mapper) {
		super();
		this.mapper = mapper;
	}

    //부모 댓글 등록 하기 
	@Override
	public int insertReply(ReplyVo vo) {
		// TODO Auto-generated method stub
		//GroupID setting
		int groupId = mapper.replyMax()+1;
		//새로 등록하기 때문에 max 에서 +1 로직
		vo.setGroupId(groupId);
		int result = mapper.replyWrite(vo);
		return result;
	}

	@Override
	public List<ReplyVo> replyList(int communityNumber) {
		// TODO Auto-generated method stub
		List<ReplyVo> clist = new ArrayList<ReplyVo>();
		clist = mapper.replyList(communityNumber);
		return clist;
	}
	

}
