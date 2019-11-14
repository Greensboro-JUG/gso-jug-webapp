package com.gso.jug.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/")
	public String getDashBoard(Model model) {
		return "home-page/home-main";
	}
	
}
