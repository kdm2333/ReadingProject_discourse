package edu.nuc.controller;/**
 * Created by 57180 on 2019/5/18.
 */

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.nuc.entity.User;
import edu.nuc.service.LoginService;
import edu.nuc.service.UserService;
import edu.nuc.untils.Constant;
import edu.nuc.untils.UserSearch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private LoginService loginService;
    @Autowired
    private UserService userService;

    /*
    ** 权限分配
    */
    @RequestMapping("/powerManage")
    public String powerManage(HttpServletRequest request,String userId,int type){
        User user = new User();
        user.setUserid(userId);
        user.setType(type);
        boolean bool = userService.updateUser(user);
        if(bool){
            request.setAttribute("msg","修改成功!");
        }else{
            request.setAttribute("msg","修改失败!");
        }
        return "redirect:/user/selectAllUser";

    }
    /**
     * 查询所有老师
     */

    @RequestMapping("/selectAllUser")
    public String selectAllUser(HttpServletRequest request, UserSearch userSearch, Model model){
        if(userSearch == null){
            userSearch = new UserSearch();
        }

        PageHelper.startPage(userSearch.getPageNum(),userSearch.getPageSize());

        List<User> list = userService.selectUserByUserSearch(userSearch);

        PageInfo<User> pageInfo = new PageInfo<User>(list);

        model.addAttribute("page",pageInfo);

        model.addAttribute("search",userSearch);

        return "userList";
    }

    /**
     * 查询所有管理员
     */
    @RequestMapping("/selectAllManager")
    public String selectAllManager(Model model,UserSearch userSearch){
        if(userSearch == null){
            userSearch = new UserSearch();
        }
        userSearch.setType(Constant.MANAGER);
        PageHelper.startPage(userSearch.getPageNum(),userSearch.getPageSize());
        List<User> list = userService.selectUserByUserSearch(userSearch);
        PageInfo<User> pageInfo = new PageInfo<User>(list);
        model.addAttribute("page",pageInfo);
        model.addAttribute("search",userSearch);
        return "managerList";
    }

}
