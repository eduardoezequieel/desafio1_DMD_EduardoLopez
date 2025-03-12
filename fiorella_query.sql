USE Fiorella;

IF OBJECT_ID('Combinaciones_Productos_Departamento', 'U') IS NULL
BEGIN
    CREATE TABLE Combinaciones_Productos_Departamento (
        Departamento NVARCHAR(255),
        Producto1 NVARCHAR(255),
        Producto2 NVARCHAR(255),
        CantidadCompras INT
    );
    PRINT 'Table Combinaciones_Productos_Departamento created.';
END
ELSE
BEGIN
    PRINT 'Table Combinaciones_Productos_Departamento already exists.';
END

-- Create Combinaciones_Productos_Pais if it doesn't exist
IF OBJECT_ID('Combinaciones_Productos_Pais', 'U') IS NULL
BEGIN
    CREATE TABLE Combinaciones_Productos_Pais (
        Producto1 NVARCHAR(255),
        Producto2 NVARCHAR(255),
        CantidadCompras INT
    );
    PRINT 'Table Combinaciones_Productos_Pais created.';
END
ELSE
BEGIN
    PRINT 'Table Combinaciones_Productos_Pais already exists.';
END

TRUNCATE TABLE Combinaciones_Productos_Departamento;
WITH ProductosComprados AS (
    SELECT Departamento, 'Rosas' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE RosasInt = 1
    UNION ALL
    SELECT Departamento, 'Claveles' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE ClavelesInt = 1
    UNION ALL
    SELECT Departamento, 'Macetas' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE MacetasInt = 1
    UNION ALL
    SELECT Departamento, 'Tierra' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE TierraInt = 1
    UNION ALL
    SELECT Departamento, 'Girasoles' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE GirasolesInt = 1
    UNION ALL
    SELECT Departamento, 'Hortensia' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE HortensiaInt = 1
    UNION ALL
    SELECT Departamento, 'Globos' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE GlobosInt = 1
    UNION ALL
    SELECT Departamento, 'Tarjetas' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE TarjetasInt = 1
    UNION ALL
    SELECT Departamento, 'Orquideas' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE OrquideasInt = 1
    UNION ALL
    SELECT Departamento, 'Carmesi' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE CarmesiInt = 1
    UNION ALL
    SELECT Departamento, 'Lirios' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE LiriosInt = 1
    UNION ALL
    SELECT Departamento, 'Aurora' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE AuroraInt = 1
    UNION ALL
    SELECT Departamento, 'Tulipanes' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE TulipanesInt = 1
    UNION ALL
    SELECT Departamento, 'Liston' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE ListonInt = 1
)

INSERT INTO Combinaciones_Productos_Departamento (Departamento, Producto1, Producto2, CantidadCompras)
SELECT P1.Departamento, P1.Producto AS Producto1, P2.Producto AS Producto2, COUNT(*) AS CantidadCompras
FROM ProductosComprados P1
INNER JOIN ProductosComprados P2
    ON P1.id = P2.id  
    AND P1.Producto < P2.Producto  
GROUP BY P1.Departamento, P1.Producto, P2.Producto
ORDER BY CantidadCompras DESC;

TRUNCATE TABLE Combinaciones_Productos_Pais;
WITH ProductosComprados AS (
    SELECT 'Rosas' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE RosasInt = 1
    UNION ALL
    SELECT 'Claveles' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE ClavelesInt = 1
    UNION ALL
    SELECT 'Macetas' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE MacetasInt = 1
    UNION ALL
    SELECT 'Tierra' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE TierraInt = 1
    UNION ALL
    SELECT 'Girasoles' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE GirasolesInt = 1
    UNION ALL
    SELECT 'Hortensia' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE HortensiaInt = 1
    UNION ALL
    SELECT 'Globos' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE GlobosInt = 1
    UNION ALL
    SELECT 'Tarjetas' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE TarjetasInt = 1
    UNION ALL
    SELECT 'Orquideas' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE OrquideasInt = 1
    UNION ALL
    SELECT 'Carmesi' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE CarmesiInt = 1
    UNION ALL
    SELECT 'Lirios' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE LiriosInt = 1
    UNION ALL
    SELECT 'Aurora' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE AuroraInt = 1
    UNION ALL
    SELECT 'Tulipanes' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE TulipanesInt = 1
    UNION ALL
    SELECT 'Liston' AS Producto, id
    FROM [Fiorella].[dbo].[VentasFiorella] WHERE ListonInt = 1
)

INSERT INTO Combinaciones_Productos_Pais (Producto1, Producto2, CantidadCompras)
SELECT P1.Producto AS Producto1, P2.Producto AS Producto2, COUNT(*) AS CantidadCompras
FROM ProductosComprados P1
INNER JOIN ProductosComprados P2
    ON P1.id = P2.id  
    AND P1.Producto < P2.Producto  
GROUP BY P1.Producto, P2.Producto
ORDER BY CantidadCompras DESC;




