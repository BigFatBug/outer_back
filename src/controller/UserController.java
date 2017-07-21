package controller;

import java.lang.reflect.Field;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import util.Tool;

import entity.User;
import service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    @ResponseBody
    private User login(String login_name, String password, HttpSession session) throws IllegalArgumentException, IllegalAccessException {
        User user = null;
        user = userService.login(login_name, new Tool().encodeMD5(password));
        //map.put相当于request.setAttribute方法
        if(user != null){
        	session.setAttribute("username", user.getUsername());
        	session.setAttribute("user_id", user.getId());
        }
        return user;
    }
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> list(HttpServletRequest request) throws IllegalArgumentException, IllegalAccessException {
		Map<String, Object> result = new HashMap<String, Object>();
        List<User> array = userService.all();
//        String page_size = request.getParameter("page_size");
//        String page_num = request.getParameter("page_num");
//        if(page_size != null && page_size != ""){
//        	if(page_num != null && page_num != ""){
//        		int page_size_int = Integer.valueOf(page_size);
//        		int page_num_int = Integer.valueOf(page_num);
//        		result = result.subList(page_size_int * page_num_int, page_size_int * (page_num_int + 1));
//        	}
//        }
        result.put("data", array);
        result.put("stat_code", 0);
        result.put("info", "success");
        result.put("total", array.size());
        return result;
    }
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> edit(HttpServletRequest request) throws IllegalArgumentException, IllegalAccessException {
		Map<String, Object> result = new HashMap<String, Object>();
		User user = new User();
		String id = request.getParameter("id");
		user.setLogin_name(request.getParameter("login_name"));
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setPhone(request.getParameter("phone"));
		result.put("info", "success");
        result.put("stat_code", 0);
		if(id == "" || id == null){
			if(userService.insert(user) == 0){
				result.put("info", "id_error");
				result.put("stat_code", 1);
			}
		}
		else{
			user.setId(Integer.valueOf(id));
			if(userService.update(user) == 0){
				result.put("info", "id_error");
				result.put("stat_code", 1);
			}
		}
        result.put("data", null);
        result.put("total", 1);
        return result;
    }	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> remove(int id) throws IllegalArgumentException, IllegalAccessException {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("info", "success");
        result.put("stat_code", 0);
		if(userService.delete(id) == 0){
			result.put("info", "id_error");
			result.put("stat_code", 1);
		}
        result.put("data", null);
        result.put("total", 1);
        return result;
    }
}
