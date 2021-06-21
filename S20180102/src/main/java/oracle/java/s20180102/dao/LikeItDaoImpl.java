package oracle.java.s20180102.dao;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20180102.model.LikeItDto;


@Repository
public class LikeItDaoImpl implements LikeItDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public void inLikeIt(LikeItDto liDto) {
		session.insert("inLikeIt",liDto);
	}

	@Override
	public void delLikeIt(LikeItDto liDto) {
		session.delete("delLikeIt",liDto);
	}

}
