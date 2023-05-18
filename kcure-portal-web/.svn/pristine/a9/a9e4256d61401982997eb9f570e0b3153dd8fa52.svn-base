package kcure.batch.config;

import org.quartz.Trigger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.CronTriggerFactoryBean;
import org.springframework.scheduling.quartz.MethodInvokingJobDetailFactoryBean;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

import kcure.portal.bat.service.BatchJobService;


@Configuration
public class BatchConfig {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(BatchConfig.class);
	
	@Autowired
    private BatchJobService batchJobService;

	@Autowired
	private ApplicationContext applicationContext;
	

	
	@Bean(name = "quartzScheduler", destroyMethod = "destroy")
	public SchedulerFactoryBean quartzScheduler() {
		SchedulerFactoryBean schedulerFactoryBean = new SchedulerFactoryBean();
        
        schedulerFactoryBean.setAutoStartup(true);
        schedulerFactoryBean.setStartupDelay(0);
        schedulerFactoryBean.setWaitForJobsToCompleteOnShutdown(false);
        schedulerFactoryBean.setOverwriteExistingJobs(false);
        
        AutowiringSpringBeanJobFactory jobFactory = new AutowiringSpringBeanJobFactory();
        jobFactory.setApplicationContext(applicationContext);
        schedulerFactoryBean.setJobFactory(jobFactory);

        schedulerFactoryBean.setGlobalTriggerListeners(new TriggersListener());
        schedulerFactoryBean.setGlobalJobListeners(new JobsListener());
        
        schedulerFactoryBean.setTriggers(new Trigger[]{
        		//sampleJobCronTrigger01().getObject(),
        		//sampleJobCronTrigger02().getObject(),
        });
        
        return schedulerFactoryBean;
	}
	
  @Bean
  public MethodInvokingJobDetailFactoryBean sampleJobTask01() {
	  MethodInvokingJobDetailFactoryBean methodInvokingJobDetailFactoryBean = new MethodInvokingJobDetailFactoryBean();
	  methodInvokingJobDetailFactoryBean.setTargetObject(batchJobService);
	  methodInvokingJobDetailFactoryBean.setTargetMethod("task01");
	  methodInvokingJobDetailFactoryBean.setConcurrent(false);
    
       return methodInvokingJobDetailFactoryBean;
    }
  
  @Bean
  public MethodInvokingJobDetailFactoryBean sampleJobTask02() {
	  MethodInvokingJobDetailFactoryBean methodInvokingJobDetailFactoryBean = new MethodInvokingJobDetailFactoryBean();
	  methodInvokingJobDetailFactoryBean.setTargetObject(batchJobService);
	  methodInvokingJobDetailFactoryBean.setTargetMethod("task02");
	  methodInvokingJobDetailFactoryBean.setConcurrent(false);
    
       return methodInvokingJobDetailFactoryBean;
    }
  
  @Bean
  public CronTriggerFactoryBean sampleJobCronTrigger01() {
      CronTriggerFactoryBean cronTriggerFactoryBean = new CronTriggerFactoryBean();
      cronTriggerFactoryBean.setJobDetail(sampleJobTask01().getObject());
      cronTriggerFactoryBean.setCronExpression(BatchJobProperties.SAMPLE01_JOB_CRON_EXPRESSION);
      
      return cronTriggerFactoryBean;
  }
  
  @Bean
  public CronTriggerFactoryBean sampleJobCronTrigger02() {
      CronTriggerFactoryBean cronTriggerFactoryBean = new CronTriggerFactoryBean();
      cronTriggerFactoryBean.setJobDetail(sampleJobTask02().getObject());
      cronTriggerFactoryBean.setCronExpression(BatchJobProperties.SAMPLE02_JOB_CRON_EXPRESSION);
      
      return cronTriggerFactoryBean;
  }

}
