# Sistema de venta de vuelos JeyPlanner

## Parte administrativa.
1. el crud de todas las tablas (ahi mismo seria la creacion del viaje)
2. ver horarios, informes  y estadistocas.

1. Módulo de Registro y Autenticación:
- Los clientes deberán registrarse con un correo electrónico y contraseña.  (incio de secion en el index, si no tiene cuenta dar la opcion de crear una pero solo para clientes)

- Los administradores tendrán acceso a un panel con permisos
especiales. (supongo que se refiere al CRUD)

- Opción de inicio de sesión con redes sociales (opcional). (No creo que lo hagamos)

2. Gestión de Servicios:

- Listado de servicios disponibles con descripción, duración y precios. (mostrar horarios y demnas cosas en Administrcion/Servision.cshtml)

- Opción para agregar, editar o eliminar servicios por parte del
administrador.  (parte del CRUD supongo)

3. Reservas:

- Los clientes podrán seleccionar un servicio, elegir horario disponible. ()

- Sistema para evitar conflictos de horarios.  (supon que dos avienes no pueden despegar al mismo tiempo, le podemos poner 30 a 40 minutos de diferencia, tenemos que validar eso)

- Confirmación de la reserva por a los administradores. (no se si por parte de administracion se debe aceptar la compra?? )

4. Gestión de Calendario:
- Vista semanal y diaria de los horarios ocupados y libres. (lo mostramos en la parte de servicios solo seria cambio de consulta, o no se
)
- Posibilidad de bloquear horarios para mantenimiento u otros eventos. (cambiar a ocultado el vuelo para que no se muestre)

5. Control Administrativo:
- Estadísticas sobre servicios más solicitados, horas pico y clientes frecuentes. (se muestra en el index del administrador)
- Gestión de perfiles (nombre, especialidades, disponibilidad). (segun yo sigue siendo parte del CRUD)
- Informes de gestiones  (ni idea)

6. Interfaz de usuario: (por definirse)
- Diseño responsivo y amigable para dispositivos móviles y escritorio. 
- Panel administrativo con herramientas para la gestión del negocio.