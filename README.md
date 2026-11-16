# 📊 Consultas SQL – Semana 4 | PRY2205

**DUOC UC | Analista Programador**  
**Asignatura:** Consulta de Bases de Datos  
**Actividad:** Desarrollando JOINS en las tablas  
**Base de datos:** Oracle Database 21c XE

## 📌 Descripción del proyecto

Este repositorio contiene el desarrollo de la actividad correspondiente a la Semana 4 de la asignatura Consulta de Bases de Datos.

El proyecto utiliza el caso de estudio de **Conciertos Chile S.A.**, una empresa dedicada a la organización de eventos y comercialización de entradas.

El objetivo es construir consultas SQL que permitan obtener información de trabajadores, analizar ventas de tickets y calcular bonificaciones mediante relaciones entre tablas.

## 🎯 Casos desarrollados

### Caso 1: Listado de Trabajadores

Consulta que permite visualizar información de los trabajadores cuyo sueldo base se encuentra entre $650.000 y $3.000.000.

**Características:**
- Relaciones entre trabajadores, ciudades y categorías.
- Formato de RUT y valores monetarios.
- Conversión de textos a mayúsculas.
- Ordenamiento por ciudad descendente y sueldo ascendente.

**Resultado:** 20 trabajadores.

### Caso 2: Listado de Cajeros

Consulta que permite analizar las ventas realizadas por los trabajadores con categoría de cajero.

**Características:**
- Conteo de tickets vendidos.
- Cálculo del monto total vendido.
- Suma de comisiones.
- Agrupación de información por trabajador.
- Filtrado de ventas superiores a $50.000.
- Ordenamiento por total vendido descendente.

**Resultado:** 5 cajeros.

### Caso 3: Listado de Bonificaciones

Consulta que permite calcular los beneficios de los trabajadores según su antigüedad y sistema de salud.

**Características:**
- Cálculo dinámico de años de antigüedad.
- Bono del 10% para trabajadores con hasta 10 años de servicio.
- Bono del 15% para trabajadores con 11 años o más.
- Bono adicional del 1% para trabajadores afiliados a FONASA.
- Conteo de cargas familiares.
- Validación de vigencia del estado civil.
- Ordenamiento por RUT ascendente.

**Resultado:** 23 trabajadores.

## 🛠️ Tecnologías utilizadas

- Oracle Database 21c Express Edition
- Oracle SQL Developer
- SQL (Oracle)
- GitHub

## 🧠 Conceptos SQL aplicados

`SELECT` · `INNER JOIN` · `LEFT JOIN` · `WHERE` · `GROUP BY` · `HAVING` · `ORDER BY` · `COUNT` · `SUM` · `ROUND` · `NVL` · `CASE` · `TO_CHAR` · `UPPER` · `INITCAP` · `MONTHS_BETWEEN` · `SYSDATE`

## 📁 Estructura del repositorio

```text
PRY2205-Semana-4/
├── PRY2205_ACTIVIDAD_S4.sql
└── README.md
```

## ▶️ Ejecución

1. Disponer de una instancia de Oracle Database con el esquema de la actividad.
2. Crear y poblar las tablas utilizando los scripts proporcionados en el material académico.
3. Conectarse mediante Oracle SQL Developer al usuario `PRY2205_S4`.
4. Abrir el archivo `PRY2205_ACTIVIDAD_S4.sql`.
5. Ejecutar las consultas para visualizar los resultados.

**Nota:** Las consultas requieren que las tablas y los datos del caso de estudio estén previamente cargados.

## ✅ Resultados

Las tres consultas fueron ejecutadas y comprobadas en Oracle SQL Developer, obteniendo resultados consistentes con los requerimientos de la actividad.

Los cálculos de antigüedad utilizan la fecha del sistema, por lo que pueden variar según el momento de ejecución.

---

**Benjamín Lizama- consulta de bases de datos- DUOC UC – 2026.**
