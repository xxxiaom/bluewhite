package com.bluewhite.system.user.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bluewhite.common.ClearCascadeJSON;
import com.bluewhite.common.Log;
import com.bluewhite.common.SessionManager;
import com.bluewhite.common.entity.CommonResponse;
import com.bluewhite.common.entity.CurrentUser;
import com.bluewhite.common.entity.PageParameter;
import com.bluewhite.system.user.entity.Menu;
import com.bluewhite.system.user.entity.Permission;
import com.bluewhite.system.user.service.MenuService;
import com.bluewhite.system.user.service.PermissionService;
import com.graphbuilder.math.func.CeilFunction;


/**
 * menu
 * 
 * @author zhangliang
 * @date 2017年4月21日 上午10:16:54
 */
@Controller
public class MenuAction {

	private static final Log log = Log.getLog(MenuAction.class);

	
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private PermissionService permissionService;

	

	private ClearCascadeJSON clearCascadeJSON;

	{
		clearCascadeJSON = ClearCascadeJSON.get().addRetainTerm(Menu.class,"id",
				"identity","span", "url", "icon", "name","children","isHighLight","isShow","parentId");
	}

	/**
	 * 查询当前登录用户的菜单
	 * 
	 * @param request 请求
	 * @return cr
	 * @throws Exception
	 */
	
	@RequestMapping(value = "/menus", method = RequestMethod.GET)
	@ResponseBody
	public CommonResponse getMenus(HttpServletRequest request) {
		List<Object> result = new ArrayList<Object>();
		CurrentUser cu = SessionManager.getUserSession();
		List<Menu> menus = menuService.findHasPermissionMenusByUsername(cu
				.getUserName());
		result.add(menus);
		CommonResponse cr = new CommonResponse(clearCascadeJSON.format(result)
				.toJSON());
		return cr;
	}
	
	
	/**
	 * 查询所有菜单
	 * 
	 * @param request 请求
	 * @return cr
	 */
	@RequestMapping(value = "/getMenuPage", method = RequestMethod.GET)
	@ResponseBody
	public CommonResponse getMenuPage(HttpServletRequest request,PageParameter page, Menu menu) {
		CommonResponse cr = new CommonResponse(clearCascadeJSON.format(menuService.getPage(page, menu))
				.toJSON());
		return cr;
	}
	
	
	/**
	 * 树型查询所有菜单
	 * 
	 * @param request 请求
	 * @return cr
	 */
	@RequestMapping(value = "/getTreeMenuPage", method = RequestMethod.GET)
	@ResponseBody
	public CommonResponse getTreeMenuPage(Long id) {
		CommonResponse cr = new CommonResponse(clearCascadeJSON.format(menuService.getTreeMenuPage(id))
				.toJSON());
		return cr;
	}

	
	/**
	 * 查询所有权限分页
	 * 
	 * @param request 请求
	 * @return cr
	 */
	@RequestMapping(value = "/getPermissionPage", method = RequestMethod.GET)
	@ResponseBody
	public CommonResponse getPermission(HttpServletRequest request,PageParameter page, Permission permission) {
		CommonResponse cr = new CommonResponse();
		return cr;
	}
	
	/**
	 * 查询所有权限
	 * 
	 * @param request 请求
	 * @return cr
	 */
	@RequestMapping(value = "/getPermission", method = RequestMethod.GET)
	@ResponseBody
	public CommonResponse getPermission(Permission permission) {
		CommonResponse cr = new CommonResponse();
		cr.setData(ClearCascadeJSON
				.get()
				.addRetainTerm(Permission.class, "id","name", "permission","description","show").format(permissionService.findAll()).toJSON());
		cr.setMessage("查询成功");
		return cr;
	}
	
	
	/**
	 * 新增（修改）菜单
	 * 
	 * @param request 请求
	 * @return cr
	 */
	@RequestMapping(value = "/saveMenu", method = RequestMethod.GET)
	@ResponseBody
	public CommonResponse getPermission(Menu menu) {
		CommonResponse cr = new CommonResponse();
		if(menu.getId()!=null){
			Menu oldMenu = menuService.findOne(menu.getId());
			menuService.update(menu, oldMenu);
			cr.setMessage("修改成功");
		}else{
			Optional<Menu> mu = menuService.findByIdentity(menu.getIdentity());
			if(!mu.isPresent()){
				menuService.save(menu);
				cr.setMessage("新增成功");
			}else{
				cr.setMessage("已有该身份的菜单，不能重复添加");
			}
		}
		cr.setData(clearCascadeJSON.format(menu).toJSON());
		return cr;
	}
	
	
	/**
	 * 删除菜单
	 * 
	 * @param request 请求
	 * @return cr
	 */
	@RequestMapping(value = "/deleteMenu", method = RequestMethod.GET)
	@ResponseBody
	public CommonResponse deleteMenu(Long ids) {
		CommonResponse cr = new CommonResponse();
		menuService.delete(ids);
		cr.setMessage("删除成功");
		return cr;
	}
	
	
	

}
