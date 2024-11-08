# Descripción
Esta aplicación es tipo CRUD desarrollada para manejar una lista de productos almacenada en un archivo JSON ubicado en los assets. La aplicación permite visualizar, agregar, editar y eliminar productos, utilizando únicamente el gestor de estado `provider` para manejar la lógica interna.

- **Tipo de aplicación**: CRUD de productos.
- **Fuente de datos**: Archivo JSON en assets.
- **Gestor de estado**: `provider`.

> [!IMPORTANTE]
> Este proyecto fue desarrollado siguiendo lineamientos específicos, que mencionaban el no uso de dependencias adicionales aparte de la dependencia del gestor de estado.

### Limitaciones

Cada vez que la aplicación se reinicia, cualquier modificación o eliminación realizada sobre el archivo JSON se perderá, ya que no se cuenta con almacenamiento persistente adicional. Esto se debe a los lineamientos de la prueba, que restringen el uso de dependencias para persistir datos.

## Instalación

1. Clona el repositorio.
   ```bash
   git clone https://github.com/Camila237/etapa1-growth-hub.git
   ```
2. Navega al directorio del proyecto.
    ```bash
    cd <NOMBRE_DEL_PROYECTO>
    ```
3. Instala las dependencias.
   ```bash
   flutter pub get
   ```
4. Ejecuta el proyecto.
   ```bash
    flutter run
    ```

## Uso
1. **Agregar Producto:** Desde la pantalla principal, selecciona el icono "+" del botón flotante para agregar un nuevo producto.
2. **Editar Producto:** Selecciona un producto para acceder a su vista de detalles y selecciona "Edit" para modificar sus datos.
3. **Eliminar Producto:** Selecciona "Delete" en la vista de detalles para borrar un producto de la lista.


## Tecnologías usadas
- **Flutter:** Framework principal para el desarrollo.
- **Provider:** Gestor de estado para Flutter.

## Consideraciones Finales
Este proyecto está diseñado para fines de prueba y evaluación, y sigue lineamientos específicos que limitan su persistencia. La funcionalidad de CRUD es básica y cumple con los requisitos sin almacenar cambios entre sesiones.
