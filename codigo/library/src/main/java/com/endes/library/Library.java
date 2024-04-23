package com.endes.library;

import java.util.HashMap;
import java.util.HashSet;

public class Library {
	
	private String name;
	private String adress;
	private Catalog catalog;//composicion implementada
	private HashSet<Book_item> library_books;
	
	public Library(String name, String adress, Catalog catalog, Book_item book_item) {
		this.name = name;
		this.adress = adress;
		this.catalog = catalog;
		HashSet<Book_item> library_books = new HashSet<>();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public Catalog getCalagog() {
		return catalog;
	}

	public void setCalagog(Catalog calagog) {
		this.catalog = calagog;
	}

	@Override
	public String toString() {
		return "Library [name=" + name + ", adress=" + adress + ", calagog=" + catalog + "]";
	}
	
	
	
}


