package music.user;

import java.util.List;


public interface UserService {
	List<UserVo> selectAll(UserVo vo);
	UserVo deatil(UserVo vo);
	int insert(UserVo vo);
	UserVo edit(UserVo vo);
	int update(UserVo vo);
	int delete(UserVo vo);
	int isDuplicateId(String id);
	int isDuplicateNickname(String nickname);
	UserVo login(UserVo vo);
	UserVo searchId(UserVo vo);
	UserVo searchPwd(UserVo vo);
	UserVo isUserExpiryDate(UserVo vo);

}
