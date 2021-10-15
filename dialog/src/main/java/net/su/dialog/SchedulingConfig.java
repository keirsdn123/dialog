package net.su.dialog;

import java.io.File;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.openqa.selenium.remote.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.StaticApplicationContext;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.config.CronTask;
import org.springframework.scheduling.config.ScheduledTask;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.DispatcherServlet;

import net.su.dialog.developSource.domain.DevelopSource;
import net.su.dialog.formalModule.mapper.DaumNewsModuleMapper;
import net.su.dialog.formalModule.service.FormalModuleService;
import net.su.dialog.formalModule.service.SchedulerService;
import net.su.dialog.schedule.domain.SchVo;
import net.su.dialog.schedule.domain.ScheduleLog;
import net.su.dialog.schedule.mapper.ScheduleMapper;

@Configuration
@EnableScheduling
public class SchedulingConfig implements SchedulingConfigurer {

   @Resource(name="net.su.dialog.schedule.mapper.ScheduleMapper")
   private ScheduleMapper scheduleMapper;
   
   //(static) 다른 클래스에서 configureTasks 메서드를 호출하기 위해
   //ScheduledTaskRegistrar를 변수에 담아놓고 getter, setter를 통해 저장 및 호출해서 씀.
   private ScheduledTaskRegistrar taskRegistrar;
      
   //------------- 스케줄링 Task 설정 -------------//
   @Bean
   public TaskScheduler taskScheduler() {
          ThreadPoolTaskScheduler taskScheduler = new ThreadPoolTaskScheduler();
          taskScheduler.setPoolSize(30); //여러개의 스케줄을 동시에 실행시키기 위해
          return taskScheduler;
   }
      
   //------------- 스케줄링 동작 설정 -------------//
   /*
   * 1. URLClassLoader으로 하는 방법 (외부, 내부 클래스파일 모두 작동 가능.)
   * 2. 필요 정보 : 클래스파일 절대 경로, 페키지명, 클래스명, 메서드명
   * 3. try/catch 필요
   * 
      URL classURL = new URL("file:"+path+"!/");
      URLClassLoader classLoader = new URLClassLoader(new URL[] {classURL});
      Class<?> c = classLoader.loadClass(packageName + "." + className);
      Constructor<?> constructor = c.getConstructor(new Class[]{});
      Object object = constructor.newInstance(new Object[]{});
      Method method = object.getClass().getDeclaredMethod(methodName);
    */
      
   /*
      * 1. forName으로 하는 방법 (단, 내부클래스만 작동가능함.)
      * 2. 필요 정보 : 페키지명, 클래스명, 메서드명
      * 3. try/catch 필요
      * 
         Class<?> c = Class.forName(packageName + "." + className);
         Object object = c.newInstance();
         Method method = object.getClass().getDeclaredMethod("testScheduler");
   */
   
   public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {
      
      try {
         //스케줄 
         List<DevelopSource> schedulerList = scheduleMapper.schedulerList();
         
         //Task 담기
         List<CronTask> taskList = new ArrayList<>();
         
         for (int i = 0; i <schedulerList.size(); i++) {
            System.out.println("리스트 사이즈 : " + schedulerList.size());
            DevelopSource info = schedulerList.get(i);
            
            
            //중지 또는 오류 상태일 시 
//            if (info.get > 0)
//               continue;
            
            ScheduleLog scheduleLog = new ScheduleLog();
            
            scheduleLog.setPackageName(info.getDevSourceFilePackageName());
            scheduleLog.setClassName(info.getDevSourceFileClassName());
            scheduleLog.setMethodName(info.getDevSourceFileMethodName());
            
            //CronTask 생성
            try {
               //.class파일 경로 받기
               URL classURL = new URL("file:"+info.getDevSourcefileRoute()+"!/");
               //실제 경로상에 있는 .class파일을 통해 class를 읽어옴
               URLClassLoader classLoader = new URLClassLoader(new URL[] {classURL});
               //패키지가 있는지 없는지를 검사(
               if(info.getDevSourceFilePackageName().equals("")) {
                  //읽어온 .class파일을 이용해 해당되는 *패키지 내에 있는 class 객체 생성
                  Class<?> c = classLoader.loadClass(info.getDevSourceFileClassName());
   
                  //class 객체 자체를 Constructor(생성자)를 통해 초기화 시키며 객체 생성
                  Constructor<?> constructor = c.getConstructor(new Class[]{});
                  
                  //class 내부의 인스턴스들을 받아옴
                  Object object = c.newInstance();
                  
                  //받아온 인스턴스들 중 특정 메서드를 받아옴.
                  Method method = object.getClass().getDeclaredMethod(info.getDevSourceFileMethodName());
                  
                  //Task 리스트 생성
                  taskList.add(new CronTask(() -> {
                     //실행 시킬 메서드와 설정된 주기를 넣는다.
                     try {
                        method.invoke(object, null);
                     } catch (Exception e) {
                        e.printStackTrace();
                        //오류 log 저장
                        SchedulerService schedulerService = new SchedulerService();
                        try {schedulerService.errorInsertLog(scheduleLog, e, "SchedulingConfig("+info.getDevSourceFileMethodName()+" 메서드 Task 등록시)");}
                        catch (Exception e1) {e1.printStackTrace();}
                     }
                  }, info.getScheCron()));

                  
               }
               else {
                  //읽어온 .class파일을 이용해 해당되는 *패키지 내에 있는 class 객체 생성
                  Class<?> c = classLoader.loadClass(info.getDevSourceFilePackageName() + "." + info.getDevSourceFileClassName());
   
                  //class 객체 자체를 Constructor(생성자)를 통해 초기화 시키며 객체 생성
                  Constructor<?> constructor = c.getConstructor(new Class[]{});
                  
                  //class 내부의 인스턴스들을 받아옴
                  Object object = c.newInstance();
                  
                  //받아온 인스턴스들 중 특정 메서드를 받아옴.
                  Method method = object.getClass().getDeclaredMethod(info.getDevSourceFileMethodName());
                  
                  //Task 리스트 생성
                  taskList.add(new CronTask(() -> {
                     //실행 시킬 메서드와 설정된 주기를 넣는다.
                     try {
                        method.invoke(object, null);
                     } catch (Exception e) {
                        e.printStackTrace();
                        //오류 log 저장
                        SchedulerService schedulerService = new SchedulerService();
                        try {schedulerService.errorInsertLog(scheduleLog, e, "SchedulingConfig("+info.getDevSourceFileMethodName()+" 메서드 Task 등록시)");}
                        catch (Exception e1) {e1.printStackTrace();}
                     }
                  }, info.getScheCron()));
               }
               
            } catch (Exception e) {
               e.printStackTrace();
               //오류 log 저장
               SchedulerService schedulerService = new SchedulerService();
               try {schedulerService.errorInsertLog(scheduleLog, e, "SchedulingConfig("+info.getDevSourceFileMethodName()+" 메서드 Class 파일 로드시)");}
               catch (Exception e1) {e1.printStackTrace();}
            }
         }
         //ScheduledTaskRegistrar 클래스 내부에 있는 setCronTasksList 메서드를 통해 업무리스트들을 등록한다.
         taskRegistrar.setCronTasksList(taskList);
         System.out.println("업무리스트"+taskRegistrar);
         
//         //taskRegistrar변수 저장
         setTaskRegistrar(taskRegistrar);
      } catch (Exception e) {
         e.printStackTrace();
      }
      
   }
   private Class loadClass(String devSourceFileClassName) {
      // TODO Auto-generated method stub
      return null;
   }

   //getter
   public ScheduledTaskRegistrar getTaskRegistrar() {
      return this.taskRegistrar;
   }
   //setter
   public void setTaskRegistrar(ScheduledTaskRegistrar taskRegistrar) {
      this.taskRegistrar = taskRegistrar;
   }
}