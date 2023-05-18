package kcure.portal.bat.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Service;


@Service
public class BatchJobService{
	
	public void task01() throws Exception{
	    SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
		Date date = new Date(System.currentTimeMillis());
		System.out.println("-------- schedule01 process ( time: " + formatter.format(date) + ")");
	}
	
	public void task02() throws Exception{
	    SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
		Date date = new Date(System.currentTimeMillis());
		System.out.println("-------- schedule02 process ( time: " + formatter.format(date) + ")");
	}

}
