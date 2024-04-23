package com.endes.library;

import java.util.HashSet;
import java.util.Set;

public class Catalog implements Search, Manage {
	
	private Set records;

	public Catalog() {
		this.records = new HashSet<Book_item>();
	}

	public Set getRecords() {
		return records;
	}

	public void setRecords(Set records) {
		this.records = records;
	}

	@Override
	public void createBookItem(Book_item bookItem) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateBookItem(Book_item bookItem) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteBookItem(String ISBN) {
		// TODO Auto-generated method stub

	}

	@Override
	public Book_item getBookItem(String ISBN) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Book_item searchByTitle(String title) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Book_item searchByAuthor(String author) {
		// TODO Auto-generated method stub
		return null;
	}

}
