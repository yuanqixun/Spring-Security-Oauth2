package com.fcn.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ArticleController {
	
	@RequestMapping("/articles")
	@ResponseBody
	public String articles(){
		return "articles";
	}
}
