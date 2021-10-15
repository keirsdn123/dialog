package net.su.dialog;

import net.su.dialog.schedule.domain.ScheduleLog;

public class CommonMethods {
	// return : class 경로 + 이름, method 이름
	public ScheduleLog getClassAndMethod() {
		ScheduleLog info = new ScheduleLog();

		StackTraceElement[] ste = new Throwable().getStackTrace();

		int i = 0;
		for (StackTraceElement element : ste) {
			if (i == 1) {
				String className = element.getClassName();
				int lastDotIndex = className.lastIndexOf(".");

				info.setPackageName(className.substring(0, lastDotIndex));
				info.setClassName(className.substring(lastDotIndex + 1, className.length()));
				info.setMethodName(element.getMethodName());
			}
			if (i > 1)
				break;
			i++;
		}

		return info;
	}

	public ScheduleLog getClassAndMethod(int callIndex) {
		ScheduleLog info = new ScheduleLog();

		StackTraceElement[] ste = new Throwable().getStackTrace();

		int i = 0;
		for (StackTraceElement element : ste) {
			if (i == callIndex) {
				String className = element.getClassName();
				int lastDotIndex = className.lastIndexOf(".");

				info.setPackageName(className.substring(0, lastDotIndex));
				info.setClassName(className.substring(lastDotIndex + 1, className.length()));
				info.setMethodName(element.getMethodName());
			}
			if (i > callIndex)
				break;
			i++;
		}

		return info;
	}
}
