package com.endes.library;

import com.endes.library.Book_item;

public interface Search {
	   Book_item searchByTitle(String title);
	   Book_item searchByAuthor(String author);
}
		