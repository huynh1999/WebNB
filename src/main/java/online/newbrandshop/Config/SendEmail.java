/*
	@author:Quang Truong
	@date: Feb 4, 2020
*/

package online.newbrandshop.Config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

@Configuration
public class SendEmail {

	
	@Bean
	public JavaMailSender getJavaMailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
		mailSender.setUsername("newbrandshop2020@gmail.com");
		mailSender.setPassword("huynh1999");
		mailSender.setDefaultEncoding("UTF-8");
		System.setProperty("mail.mime.charset", "utf8");
		Properties props = mailSender.getJavaMailProperties();
	    props.put("mail.transport.protocol", "smtp");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.debug", "true");
		return mailSender;
		
	}
}
