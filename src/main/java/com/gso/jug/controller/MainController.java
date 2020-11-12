package com.gso.jug.controller;

import com.gso.jug.model.Raffle;
import com.gso.jug.repository.RaffleRepository;
import com.gso.jug.service.RaffleService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class MainController {

	private final RaffleRepository raffleRepository;
	private final RaffleService raffleService;
	
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

	@PostMapping(value = "/raffle" , consumes = MediaType.APPLICATION_JSON_VALUE , produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Long enterRaffle(@RequestBody Raffle raffle) {
		Raffle exisiting = raffleRepository.findByEmail(raffle.getEmail().trim());

		if(null != exisiting) {
			return exisiting.getId();
		}

		return raffleRepository.save(raffle).getId();
	}

	@GetMapping(value = "/draw", produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Raffle draw(){
	  return raffleService.draw();
	}

}
