package edu.words.services;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service
public class EmailService {

	protected String mailSmtpAuth = "true";
	protected String mailSmtpHost = "smtp.gmail.com";
	protected String mailSmtpPort = "587";
	protected String mailSmtpStarttlsEnable = "true";
	protected String mailEmailFrom = "1000slow.edu.pl@gmail.com";
	protected String username = "1000slow.edu.pl@gmail.com";
	protected String password = "incrediblestrongpassword";
	protected String mailTo = "km.cisak@gmail.com";

	public boolean sendTextEmail(String subject, String content) {

		Properties props = new Properties();
		props.put("mail.smtp.auth", mailSmtpAuth);
		props.put("mail.smtp.starttls.enable", mailSmtpStarttlsEnable);
		props.put("mail.smtp.host", mailSmtpHost);
		props.put("mail.smtp.port", mailSmtpPort);
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(mailEmailFrom));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailTo));
			message.setSubject(subject);
			message.setText(content);

			Transport.send(message);
			return true;
		} catch (MessagingException e) {
			// do nothing
		}

		return false;
	}

}
