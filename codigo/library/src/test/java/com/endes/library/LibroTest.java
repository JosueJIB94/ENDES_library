package com.endes.library;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class LibroTest {
    @Test
    void testBookCreation() {
        Book libro = new Book();
        assertNotNull(libro);
    }
}
