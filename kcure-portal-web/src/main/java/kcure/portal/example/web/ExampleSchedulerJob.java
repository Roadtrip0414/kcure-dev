package kcure.portal.example.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import kcure.portal.example.service.ExampleService;

public class ExampleSchedulerJob {

	@Resource(name = "ExampleService")
	private ExampleService exampleService;
	   
	public void task01() {
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
		Date date = new Date(System.currentTimeMillis());
		System.out.println("-------- schedule process ( time: " + formatter.format(date) + ")");
	}

}
