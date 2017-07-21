package controller;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import entity.Case;
import entity.Execute;
import service.ExecuteService;

@Controller
@RequestMapping("/execute")
public class ExecuteController {
	@Autowired
	private ExecuteService executeService;
	
	@RequestMapping(value = "/find", method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> find(HttpServletRequest request) throws IllegalArgumentException, IllegalAccessException {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("case_id", request.getParameter("case_id"));
        map.put("user_id", request.getParameter("user_id"));
        List<Execute> array = executeService.find(map);
        result.put("data", array);
        result.put("stat_code", 0);
        result.put("info", "success");
        result.put("total", array.size());
        return result;
    }	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> list(HttpServletRequest request) throws IllegalArgumentException, IllegalAccessException {
		Map<String, Object> result = new HashMap<String, Object>();
		List<Execute> array = executeService.all();
        result.put("data", array);
        result.put("stat_code", 0);
        result.put("info", "success");
        result.put("total", array.size());
        return result;
    }
}
