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
	
	@GetMapping("/jobs")
	public String getJobsBoard(Model model) {
		return "jobs-page/jobs-main";
	}
	
	@GetMapping("/location")
	public String getLocationPage(Model model) {
		return "location-page/location-main";
	}
	
}
