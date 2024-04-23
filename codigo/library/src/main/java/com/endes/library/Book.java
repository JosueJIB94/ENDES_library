package com.endes.library;

import java.util.HashSet;
import java.util.List;

public abstract class Book {
    private String isbn;
    private String title;
    private String summary;
    private String publisher;
    private String publication_date;
    private Integer number_of_pages;
    private String language;
    private HashSet<Author> authors;//relacion wrote implementada. Autores pueden escribir varios libros y viceversa, de ahí los HashSet en cada una de las dos entidades
    
	public Book(String isbn, String title, String summary, String publisher, String publication_date,
			Integer number_of_pages, String language, Author author) {

		this.isbn = isbn;
		this.title = title;
		this.summary = summary;
		this.publisher = publisher;
		this.publication_date = publication_date;
		this.number_of_pages = number_of_pages;
		this.language = language;
		HashSet<Author> authors = new HashSet<>();
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getPublication_date() {
		return publication_date;
	}

	public void setPublication_date(String publication_date) {
		this.publication_date = publication_date;
	}

	public Integer getNumber_of_pages() {
		return number_of_pages;
	}

	public void setNumber_of_pages(Integer number_of_pages) {
		this.number_of_pages = number_of_pages;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	@Override
	public String toString() {
		return "Book [isbn=" + isbn + ", title=" + title + ", summary=" + summary + ", publisher=" + publisher
				+ ", publication_date=" + publication_date + ", number_of_pages=" + number_of_pages + ", language="
				+ language + "]";
	}
    
    
    
    
    
}
