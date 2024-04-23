#!/bin/bash

# Función para instalar Maven en sistemas basados en Debian/Ubuntu
install_maven_debian() {
    echo "Instalando Maven..."
    sudo apt update
    sudo apt install maven -y
    echo "Maven ha sido instalado."
}

# Comprueba si Maven está instalado
if ! [ -x "$(command -v mvn)" ]; then
    # Detecta el sistema operativo y ejecuta la función de instalación correspondiente
    if [ -f /etc/debian_version ]; then
        install_maven_debian
    else
        echo "Sistema operativo no soportado para la instalación automática de Maven."
        exit 1
    fi
else
    echo "Maven está instalado."
fi

# Crea el proyecto usando Maven
mvn archetype:generate \
    -DgroupId=com.endes.library \
    -DartifactId=library \
    -DarchetypeArtifactId=maven-archetype-quickstart \
    -DinteractiveMode=false

# Navega al directorio del proyecto
cd library

# Eliminar el archivo de prueba generado por defecto que utiliza JUnit 4
rm src/test/java/com/endes/library/AppTest.java

# Actualiza el pom.xml para JUnit 5
cat << EOF > pom.xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.endes.library</groupId>
    <artifactId>library</artifactId>
    <version>1.0-SNAPSHOT</version>

    <properties>
        <maven.compiler.source>1.8</maven.compiler.source>
        <maven.compiler.target>1.8</maven.compiler.target>
    </properties>

    <dependencies>
        <!-- JUnit 5 (Jupiter) dependencies for testing -->
        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter-api</artifactId>
            <version>5.8.2</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter-engine</artifactId>
            <version>5.8.2</version>
            <scope>test</scope>
        </dependency>
        <!-- Agrega otras dependencias necesarias aquí -->
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.1</version>
                <configuration>
                    <release>8</release>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-plugin</artifactId>
                <version>2.22.2</version>
                <configuration>
                    <includes>
                        <include>**/*Test.java</include>
                    </includes>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>
EOF

# Crear las clases de Java para Autor y Libro
cat << EOF > src/main/java/com/endes/library/Autor.java
package com.endes.library;

public class Autor {
    private String name;
    private String biography;

    // Constructor, getters y setters aquí
}
EOF

cat << EOF > src/main/java/com/endes/library/Libro.java
package com.endes.library;

import java.util.List;

public class Libro {
    private String isbn;
    private String title;
    private List<Autor> autores;

    // Constructor, getters y setters aquí
}
EOF

# Crear pruebas para Autor y Libro
mkdir -p src/test/java/com/endes/library

cat << EOF > src/test/java/com/endes/library/AutorTest.java
package com.endes.library;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class AutorTest {
    @Test
    void testAuthorCreation() {
        Autor autor = new Autor();
        assertNotNull(autor);
    }
}
EOF

cat << EOF > src/test/java/com/endes/library/LibroTest.java
package com.endes.library;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class LibroTest {
    @Test
    void testBookCreation() {
        Libro libro = new Libro();
        assertNotNull(libro);
    }
}
EOF
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public List<Habitacion> getHabitaciones() {
		return habitaciones;
	}

	public void setHabitaciones(List<Habitacion> habitaciones) {
		this.habitaciones = habitaciones;
	}

	/**
     * Elimina una habitación de la casa.
     * @param habitacion La habitación a eliminar.
     */
    public void removeHabitacion(Habitacion habitacion) {
        this.habitaciones.remove(habitacion);
    }

	public void addHabitacion(Habitacion habitacion) {
		 this.habitaciones.add(habitacion);
		
	}

}
EOF

# Crear pruebas para Casa y Habitación
mkdir -p src/test/java/com/endes/casa


cat << EOF > src/test/java/com/endes/casa/CasaTest.java
package com.endes.casa;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Clase de pruebas para Casa y Habitación con JUnit 5.
 */
class CasaTest {

    Casa casa;

    @BeforeEach
    void setUp() {
        // Se inicializa una casa con una dirección y un número específico de habitaciones antes de cada prueba.
        casa = new Casa("123 Calle Ficticia", 3);
    }

    @Test
    @DisplayName("Crear una casa con un número específico de habitaciones")
    void testCrearCasaConHabitaciones() {
        assertEquals(3, casa.getHabitaciones().size(), "La casa debe ser creada con 3 habitaciones.");
    }

    @Test
    @DisplayName("Agregar objetos a una habitación y verificar que estén presentes")
    void testAgregarYObtenerObjetosDeHabitacion() {
        Habitacion habitacion = casa.getHabitaciones().get(0);
        Objeto objeto1 = new Objeto("Lámpara");
        Objeto objeto2 = new Objeto("Cama");
        habitacion.addObjeto(objeto1);
        habitacion.addObjeto(objeto2);
        assertAll("Los objetos deben ser agregados a la habitación",
            () -> assertTrue(habitacion.getObjetos().contains(objeto1), "La habitación debe contener una lámpara"),
            () -> assertTrue(habitacion.getObjetos().contains(objeto2), "La habitación debe contener una cama")
        );
    }

    @Test
    @DisplayName("Verificar la dirección de la casa")
    void testDireccionCasa() {
        assertEquals("123 Calle Ficticia", casa.getDireccion(), "La dirección de la casa debe coincidir con la proporcionada en el constructor.");
    }

    @Test
    @DisplayName("La lista de objetos debe contener todos los elementos agregados.")
    void testObtenerObjetosHabitacion() {
        Habitacion habitacion = new Habitacion(1);
        Objeto lampara = new Objeto("Lámpara");
        Objeto cama = new Objeto("Cama");
        habitacion.addObjeto(lampara);
        habitacion.addObjeto(cama);

        assertTrue(habitacion.getObjetos().contains(lampara) && habitacion.getObjetos().contains(cama),
                   "La lista de objetos debe contener todos los elementos agregados.");
    }
    
    @Test
    @DisplayName("Asegurar que la eliminación de una habitación también elimina sus objetos")
    void testEliminarHabitacionYObjetos() {
        Habitacion habitacion = casa.getHabitaciones().get(0);
        Objeto objeto = new Objeto("Silla");
        habitacion.addObjeto(objeto);
        casa.removeHabitacion(habitacion);
        assertFalse(casa.getHabitaciones().contains(habitacion), "La habitación debe ser eliminada de la casa");
    }
    
     @Test
    @DisplayName("Comprobar que no se pueden agregar objetos nulos a la habitación")
    void testAgregarObjetosNulos() {
        Habitacion habitacion = casa.getHabitaciones().get(0);
        assertThrows(IllegalArgumentException.class, () -> habitacion.addObjeto(null), "Debería lanzar una excepción al intentar agregar un objeto nulo");
    }

    @Test
    @DisplayName("Asegurar que al eliminar una habitación, los objetos no se eliminan si pertenecen a más habitaciones")
    void testEliminarHabitacionSinEliminarObjetosCompartidos() {
        Habitacion habitacion1 = casa.getHabitaciones().get(0);
        Habitacion habitacion2 = casa.getHabitaciones().get(1);
        Objeto objetoCompartido = new Objeto("Espejo");
        habitacion1.addObjeto(objetoCompartido);
        habitacion2.addObjeto(objetoCompartido);
        casa.removeHabitacion(habitacion1);
        assertTrue(habitacion2.getObjetos().contains(objetoCompartido), "El objeto compartido no debe ser eliminado si pertenece a otra habitación");
    }

    @Test
    @DisplayName("Verificar que la eliminación de una habitación realmente elimina solo esa habitación")
    void testEliminarHabitacionEspecifica() {
        Habitacion habitacion = new Habitacion(999); // Crear una habitación con un número único.
        casa.addHabitacion(habitacion); // Agregar manualmente la nueva habitación.
        int totalHabitacionesAntes = casa.getHabitaciones().size();
        casa.removeHabitacion(habitacion);
        int totalHabitacionesDespues = casa.getHabitaciones().size();
        assertAll(
            () -> assertEquals(totalHabitacionesAntes - 1, totalHabitacionesDespues, "El total de habitaciones después de eliminar una debe disminuir en uno."),
            () -> assertFalse(casa.getHabitaciones().contains(habitacion), "La habitación eliminada no debe estar presente en la lista de habitaciones.")
        );
    }
    
    @Test
    @DisplayName("Validar la capacidad de cambiar la dirección de una casa")
    void testCambiarDireccionCasa() {
        String nuevaDireccion = "456 Otra Calle";
        casa.setDireccion(nuevaDireccion);
        assertEquals(nuevaDireccion, casa.getDireccion(), "La dirección de la casa debe actualizarse con el nuevo valor.");
    }
}

EOF

