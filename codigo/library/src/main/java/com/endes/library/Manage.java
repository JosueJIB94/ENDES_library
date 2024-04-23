package com.endes.library;

import com.endes.library.Book_item;

public interface Manage {
	  void createBookItem(Book_item bookItem);
	  void updateBookItem(Book_item bookItem);
	  void deleteBookItem(String ISBN);
	  Book_item getBookItem(String ISBN);
}
