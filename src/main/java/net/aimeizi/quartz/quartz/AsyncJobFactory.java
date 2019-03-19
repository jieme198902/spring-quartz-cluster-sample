package net.aimeizi.quartz.quartz;

import net.aimeizi.quartz.conf.Constants;
import net.aimeizi.quartz.model.ScheduleJob;
import net.aimeizi.quartz.vo.ScheduleJobVo;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.quartz.QuartzJobBean;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * author : fengjing
 * createTime : 2016-08-04
 * description : 异步任务工厂
 * version : 1.0
 */
public class AsyncJobFactory extends QuartzJobBean {

    /**
     * 日志对象
     */
    private static final Logger LOG = LoggerFactory.getLogger(AsyncJobFactory.class);

    @Override
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
        LOG.info("AsyncJobFactory execute");
        ScheduleJob scheduleJob = (ScheduleJob) context.getMergedJobDataMap().get(ScheduleJobVo.JOB_PARAM_KEY);
        System.out.println("jobName:" + scheduleJob.getJobName() + "  " + scheduleJob);


        String jobClass = scheduleJob.getJobClass();

        try {
            Class<?> c = Class.forName(Constants.JOB_PACKAGE + jobClass);
            Object obj = c.newInstance();
            //第一个参数写的是方法名,第二个\第三个\...写的是方法参数列表中参数的类型
            Method method = c.getMethod(scheduleJob.getJobClassMethod());
            //invoke是执行该方法,并携带参数值
            method.invoke(obj);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
