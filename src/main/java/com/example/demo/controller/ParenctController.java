package com.example.demo.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;

@Controller
public class ParenctController {
	@Autowired
	private UserRepository userRepository;
	@GetMapping("/")
	//@ResponseBody
	public String show() { 
		return "Home";
	}
	
	@GetMapping("/registration")
	public String registrationPage(User user) {
		return "registrationPage";	
	}
	
	@PostMapping("/register")
	@ResponseBody
	public String register (@ModelAttribute("user") User user) {
		System.out.println(user.toString());
		userRepository.save(user);
		return "Data saved successfully";
	}
}
