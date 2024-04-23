package com.endes.library;

import java.util.HashSet;

public class Author {
    private String name;
    private String biography;
    private HashSet<Book> books;//relacion wrote implementada. Autores pueden escribir varios libros y viceversa, de ahí los HashSet en cada una de las dos entidades
    
	public Author(String name, String biography, Book book) {//Objeto libro como parametro necesario para el constructor
		this.name = name;
		this.biography = biography;
		HashSet<Book> books = new HashSet<>();// Inicializamos el Hash
		books.add(book);// Añadir book de forma obligatoria ya que para tener un autor tiene que tener como minimo un libro en su Hash
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBiography() {
		return biography;
	}

	public void setBiography(String biography) {
		this.biography = biography;
	}

	@Override
	public String toString() {
		return "Author [name=" + name + ", biography=" + biography + "]";
	}

	
	

}
