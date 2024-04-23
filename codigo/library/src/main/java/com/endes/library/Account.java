package com.endes.library;

public class Account {

	private Integer number;
	private String history;
	private String opened;
	private String state;
	
	public Account(Integer number, String history, String opened, String state) {
		super();
		this.number = number;
		this.history = history;
		this.opened = opened;
		this.state = state;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getHistory() {
		return history;
	}

	public void setHistory(String history) {
		this.history = history;
	}

	public String getOpened() {
		return opened;
	}

	public void setOpened(String opened) {
		this.opened = opened;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Account [number=" + number + ", history=" + history + ", opened=" + opened + ", state=" + state + "]";
	}
	
	
	
}
