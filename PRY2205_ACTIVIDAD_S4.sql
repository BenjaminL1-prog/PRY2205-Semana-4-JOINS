
-- =========================================================
-- DUOC UC - CONSULTA DE BASES DE DATOS
-- SEMANA 4: DESARROLLANDO JOINS EN LAS TABLAS
-- EMPRESA: CONCIERTOS CHILE S.A.
-- USUARIO: PRY2205_S4
-- =========================================================


-- =========================================================
-- CASO 1: LISTADO DE TRABAJADORES
-- =========================================================

SELECT
    UPPER(t.nombre || ' ' || t.appaterno || ' ' || t.apmaterno)
        AS "Nombre Completo Trabajador",

    TO_CHAR(t.numrut, 'FM99G999G999',
        'NLS_NUMERIC_CHARACTERS='',.''')
        || '-' || t.dvrut
        AS "RUT Trabajador",

    UPPER(tt.desc_categoria)
        AS "Tipo Trabajador",

    UPPER(c.nombre_ciudad)
        AS "Ciudad Trabajador",

    TO_CHAR(t.sueldo_base, 'FML999G999G999',
        'NLS_NUMERIC_CHARACTERS='',.''')
        AS "Sueldo Base"

FROM trabajador t

INNER JOIN comuna_ciudad c
    ON t.id_ciudad = c.id_ciudad

INNER JOIN tipo_trabajador tt
    ON t.id_categoria_t = tt.id_categoria

WHERE t.sueldo_base BETWEEN 650000 AND 3000000

ORDER BY c.nombre_ciudad DESC,
         t.sueldo_base ASC;


-- =========================================================
-- CASO 2: LISTADO DE CAJEROS
-- =========================================================

SELECT
    TO_CHAR(t.numrut, 'FM99G999G999',
        'NLS_NUMERIC_CHARACTERS='',.''')
        || '-' || t.dvrut AS "RUT Trabajador",

    INITCAP(t.nombre || ' ' || t.appaterno)
        AS "Nombre Trabajador",

    COUNT(tc.nro_ticket)
        AS "Total Tickets",

    TO_CHAR(SUM(tc.monto_ticket),
        'FML999G999G999',
        'NLS_NUMERIC_CHARACTERS='',.''')
        AS "Total Vendido",

    TO_CHAR(SUM(NVL(ct.valor_comision, 0)),
        'FML999G999G999',
        'NLS_NUMERIC_CHARACTERS='',.''')
        AS "Comisión Total",

    UPPER(tt.desc_categoria)
        AS "Tipo Trabajador",

    UPPER(c.nombre_ciudad)
        AS "Ciudad Trabajador"

FROM trabajador t

INNER JOIN tickets_concierto tc
    ON t.numrut = tc.numrut_t

INNER JOIN comisiones_ticket ct
    ON tc.nro_ticket = ct.nro_ticket

INNER JOIN tipo_trabajador tt
    ON t.id_categoria_t = tt.id_categoria

INNER JOIN comuna_ciudad c
    ON t.id_ciudad = c.id_ciudad

WHERE UPPER(tt.desc_categoria) = 'CAJERO'

GROUP BY
    t.numrut,
    t.dvrut,
    t.nombre,
    t.appaterno,
    tt.desc_categoria,
    c.nombre_ciudad

HAVING SUM(tc.monto_ticket) > 50000

ORDER BY SUM(tc.monto_ticket) DESC;


-- =========================================================
-- CASO 3: LISTADO DE BONIFICACIONES
-- =========================================================

SELECT
    TO_CHAR(t.numrut, 'FM99G999G999',
        'NLS_NUMERIC_CHARACTERS='',.''')
        AS "RUT Trabajador",

    INITCAP(t.nombre || ' ' || t.appaterno)
        AS "Trabajador Nombre",

    EXTRACT(YEAR FROM t.fecing)
        AS "Año Ingreso",

    TRUNC(MONTHS_BETWEEN(SYSDATE, t.fecing) / 12)
        AS "Años Antigüedad",

    COUNT(DISTINCT af.numrut_carga)
        AS "Num. Cargas Familiares",

    INITCAP(i.nombre_isapre)
        AS "Nombre Isapre",

    TO_CHAR(t.sueldo_base, 'FML999G999G999',
        'NLS_NUMERIC_CHARACTERS='',.''')
        AS "Sueldo Base",

    TO_CHAR(
        ROUND(
            CASE
                WHEN UPPER(i.nombre_isapre) = 'FONASA'
                THEN t.sueldo_base * 0.01
                ELSE 0
            END
        ),
        'FML999G999G999',
        'NLS_NUMERIC_CHARACTERS='',.'''
    ) AS "Bono Fonasa",

    TO_CHAR(
        ROUND(
            t.sueldo_base *
            CASE
                WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, t.fecing) / 12) <= 10
                THEN 0.10
                ELSE 0.15
            END
        ),
        'FML999G999G999',
        'NLS_NUMERIC_CHARACTERS='',.'''
    ) AS "Bono Antigüedad",

    INITCAP(a.nombre_afp)
        AS "Nombre AFP",

    UPPER(ec.desc_estcivil)
        AS "Estado Civil"

FROM trabajador t

INNER JOIN isapre i
    ON t.cod_isapre = i.cod_isapre

INNER JOIN afp a
    ON t.cod_afp = a.cod_afp

INNER JOIN est_civil e
    ON t.numrut = e.numrut_t

INNER JOIN estado_civil ec
    ON e.id_estcivil_est = ec.id_estcivil

LEFT JOIN asignacion_familiar af
    ON t.numrut = af.numrut_t

WHERE e.fecter_estcivil IS NULL
   OR e.fecter_estcivil > SYSDATE

GROUP BY
    t.numrut,
    t.nombre,
    t.appaterno,
    t.fecing,
    t.sueldo_base,
    i.nombre_isapre,
    a.nombre_afp,
    ec.desc_estcivil

ORDER BY t.numrut ASC;
