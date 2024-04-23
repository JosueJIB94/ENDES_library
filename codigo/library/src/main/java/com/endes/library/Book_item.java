package com.endes.library;

public class Book_item extends Book{
	
	private String barcode;
	private String tag;

	public Book_item(String isbn, String title, String summary, String publisher, String publication_date,
			Integer number_of_pages, String language, Author author, String barcode, String tag) {
		super(isbn, title, summary, publisher, publication_date, number_of_pages, language, author);
		this.barcode = barcode;
		this.tag = tag;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	@Override
	public String toString() {
		return "Book_item [barcode=" + barcode + ", tag=" + tag + "]";
	}
	
	
	
}
