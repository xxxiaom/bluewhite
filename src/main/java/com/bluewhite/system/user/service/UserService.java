package com.bluewhite.system.user.service;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.bluewhite.base.BaseCRUDService;
import com.bluewhite.basedata.entity.BaseData;
import com.bluewhite.common.entity.PageParameter;
import com.bluewhite.common.entity.PageResult;
import com.bluewhite.system.user.entity.User;

@Service
public interface UserService extends BaseCRUDService<User, Long> {

	/**
	 * 通过用户名查找
	 * 
	 * @param username
	 *            用户名
	 * @return user
	 */
	public User findByUserName(String userName);

	/**
	 * 通过用户名密码验证登录
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public User loginByUsernameAndPassword(String username, String password);

	/**
	 * 查询用户拥有的权限
	 */
	Set<String> findStringPermissions(User user);

	/**
	 * 分页查询 用户信息
	 * 
	 * @param page
	 * @param user
	 * @return
	 */
	public PageResult<User> getPagedUser(PageParameter page, User user);

	/**
	 * 通过手机号查找
	 * 
	 * @param phoneNum
	 *            手机号
	 * @return user
	 */
	public User findByPhone(String phone);

	/**
	 * 删除指定ids用户
	 * 
	 * @param ids
	 *            多条id
	 * @return boolean
	 */
	public boolean deleteUsers(String ids);


	/**
	 * 通过用户编号查找
	 * 
	 * @param string
	 * @return
	 */
	public User findByNumber(String number);

	/**
	 * 按部门查找人员
	 * 
	 * @param string
	 * @return
	 */
	public List<User> findByOrgNameId(Long orgNameId);

	/**
	 * 查找出编号不为null的员工
	 * 
	 * @param string
	 * @return
	 */
	public List<User> findByNumberNotNull();

	/**
	 * 查找所有不是外来人员的员工（本厂员工）
	 * 
	 * @param foreigns=0=否
	 * @return
	 */
	public List<User> findByForeigns();

	/**
	 * 删除员工（支持批量）
	 * 
	 * @param ids
	 */
	public int deleteUser(String ids);

	/**
	 * 新增员工
	 * 
	 * @param user
	 * @return
	 */
	public User addUser(User user);
	
	/**
	 * 按条件查找人员
	 * @param foreigns=0=否
	 * @return
	 */
	public List<User> findUserList(User user);
	/**
	 * 修改密码
	 * @param password
	 * @return
	 */
	public boolean checkPassword(String password);
	
	/**
	 * 获取转正人员
	 * @return
	 */
	public List<User> getPositiveUser();
	
	/**
	 * 转正人员
	 * @param positiveUser
	 * @return
	 */
	public int positiveUser(String positiveUser);
	
	/**
	 * 按部门查找所有人员
	 * @return
	 */
	public List<BaseData> findUserOrg();
	
	/**
	 * 给人员批量设定约定休息日期
	 */
	public int setUserRestDate(String userIds,String restDay);

}
