package edu.words.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.words.services.EmailService;

@Controller
public class EmailController {

	@Autowired
	EmailService emailService;

	@RequestMapping(value = "sendEmail", method = RequestMethod.POST)
	public String sendMail(HttpServletRequest request) {

		String subject = "OD: " + request.getParameter("from") +" TEMAT: " + request.getParameter("subject");
		String message = request.getParameter("message");

		emailService.sendTextEmail(subject, message);

		return "sent";
	}

}
