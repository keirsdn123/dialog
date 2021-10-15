package net.su.dialog.schedule.domain;

public class NextSchedulStatus {
	
	private long parentsSeq;
	
	private int nextLogStatus;
	
	private int reStartCount;
	
	private int scheduleSeq;

	public long getParentsSeq() {
		return parentsSeq;
	}

	public void setParentsSeq(long parentsSeq) {
		this.parentsSeq = parentsSeq;
	}

	public int getNextLogStatus() {
		return nextLogStatus;
	}

	public void setNextLogStatus(int nextLogStatus) {
		this.nextLogStatus = nextLogStatus;
	}

	public int getReStartCount() {
		return reStartCount;
	}

	public void setReStartCount(int reStartCount) {
		this.reStartCount = reStartCount;
	}

	public int getScheduleSeq() {
		return scheduleSeq;
	}

	public void setScheduleSeq(int scheduleSeq) {
		this.scheduleSeq = scheduleSeq;
	}
	
	
}
