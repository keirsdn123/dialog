package net.su.dialog.schedule.domain;

public class ScheduleLog {
		//로그 SEQ
		private long logSeq;
		
		//로그 제목	
		private String logTitle;
		
		//로그 내용	
		private String logContents;
		
		//로그 메타
		private String logMeteContents;
		
		//로그 등록 일시	
		private String logDate;
		
		/*
		 * logStatus 상태 구분
		 * 0 : 시작
		 * 1 : 재시작
		 * 2 : 완료
		 * 3 : 오류
		 * 4 : 중지
		 * 5 : 수정
		 */
		private int logStatus;
		
		//스케줄러 SEQ(FK)	
		private long scheduleSeq;
		
		//개발소스정형적모듈 파일
		private long devSourceSeq;
		
		//부모 SEQ
		private long parentsSeq;
		
		
		//클래스 명
		private String className;
		//페키지 명
		private String packageName;
		//메소드 명
		private String methodName;
		
		private String explanation;
		
		
		
		public String getLogMeteContents() {
			return logMeteContents;
		}
		public void setLogMeteContents(String logMeteContents) {
			this.logMeteContents = logMeteContents;
		}
		public String getExplanation() {
			return explanation;
		}
		public void setExplanation(String explanation) {
			this.explanation = explanation;
		}
		public long getDevSourceSeq() {
			return devSourceSeq;
		}
		public void setDevSourceSeq(long devSourceSeq) {
			this.devSourceSeq = devSourceSeq;
		}
		public long getLogSeq() {
			return logSeq;
		}
		public void setLogSeq(long logSeq) {
			this.logSeq = logSeq;
		}
		public String getLogTitle() {
			return logTitle;
		}
		public void setLogTitle(String logTitle) {
			this.logTitle = logTitle;
		}
		public String getLogContents() {
			return logContents;
		}
		public void setLogContents(String logContents) {
			this.logContents = logContents;
		}
		public String getLogDate() {
			return logDate;
		}
		public void setLogDate(String logDate) {
			this.logDate = logDate;
		}
		public int getLogStatus() {
			return logStatus;
		}
		public void setLogStatus(int logStatus) {
			this.logStatus = logStatus;
		}
		public long getScheduleSeq() {
			return scheduleSeq;
		}
		public void setScheduleSeq(long scheduleSeq) {
			this.scheduleSeq = scheduleSeq;
		}
		public long getParentsSeq() {
			return parentsSeq;
		}
		public void setParentsSeq(long parentsSeq) {
			this.parentsSeq = parentsSeq;
		}
		public String getClassName() {
			return className;
		}
		public void setClassName(String className) {
			this.className = className;
		}
		public String getPackageName() {
			return packageName;
		}
		public void setPackageName(String packageName) {
			this.packageName = packageName;
		}
		public String getMethodName() {
			return methodName;
		}
		public void setMethodName(String methodName) {
			this.methodName = methodName;
		}
		
		
}
