/**
 * Copyright (c) 2016-2019 谷粒开源 All rights reserved.
 *
 * https://www.guli.cloud
 *
 * 版权所有，侵权必究！
 */

package com.atguigu.common.aspect;

import com.atguigu.common.annotation.SysLog;
import com.atguigu.common.utils.IPUtils;
import com.atguigu.modules.sys.entity.SysLogEntity;
import com.atguigu.modules.sys.entity.SysUserEntity;
import com.atguigu.modules.sys.service.SysLogService;
import com.google.gson.Gson;
import com.atguigu.common.utils.HttpContextUtils;
import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;


/**
 * 系统日志，切面处理类
 *
 * @author Mark sunlightcs@gmail.com
 */
@Aspect
@Component
public class SysLogAspect {
	@Autowired
	private SysLogService sysLogService;
	
	@Pointcut("@annotation(com.atguigu.common.annotation.SysLog)")
	public void logPointCut() { 
		
	}

	@Around("logPointCut()")
	public Object around(ProceedingJoinPoint point) throws Throwable {
		long beginTime = System.currentTimeMillis();
		//执行方法
		Object result = point.proceed();
		//执行时长(毫秒)
		long time = System.currentTimeMillis() - beginTime;

		//保存日志
		saveSysLog(point, time);

		return result;
	}

	private void saveSysLog(ProceedingJoinPoint joinPoint, long time) {
		MethodSignature signature = (MethodSignature) joinPoint.getSignature();
		Method method = signature.getMethod();

		SysLogEntity sysLog = new SysLogEntity();
		SysLog syslog = method.getAnnotation(SysLog.class);
		if(syslog != null){
			//注解上的描述
			sysLog.setOperation(syslog.value());
		}

		//请求的方法名
		String className = joinPoint.getTarget().getClass().getName();
		String methodName = signature.getName();
		sysLog.setMethod(className + "." + methodName + "()");

		//请求的参数
		Object[] args = joinPoint.getArgs();
		try{
			String params = new Gson().toJson(args);
			sysLog.setParams(params);
		}catch (Exception e){

		}

		//获取request
		HttpServletRequest request = HttpContextUtils.getHttpServletRequest();
		//设置IP地址
		sysLog.setIp(IPUtils.getIpAddr(request));

		//用户名
		String username = ((SysUserEntity) SecurityUtils.getSubject().getPrincipal()).getUsername();
		sysLog.setUsername(username);

		sysLog.setTime(time);
		sysLog.setCreateDate(new Date());
		//保存系统日志
		sysLogService.save(sysLog);
	}
}
