CREATE PROCEDURE SP_APLATAM_LIMPIEZA_OPENWEATHERMAP
AS
/*
Sp para limpieza de tabla OPENWEATHERMAP
Creador: Carlos Alcántara Romero
Fecha: 14/04/2025
Proyecto: APLATAM_OPENWEATHERMAP

*/

UPDATE STG_APLATAM_OPENWEATHERMAP
SET lon = CASE WHEN ISNULL(lon,'')=''
				THEN 
					'NA'
			ELSE 
				lon
		   END,
lat = CASE WHEN ISNULL(lat,'')=''
				THEN 
					'NA'
			ELSE 
				lat
		   END,

[type] = CASE WHEN ISNULL([type],'')=''
				THEN 
					'NA'
			ELSE 
				[type]
		   END,
[id] = CASE WHEN ISNULL([id],'')=''
				THEN 
					'NA'
			ELSE 
				id
		   END,

country = CASE WHEN ISNULL([country],'')=''
				THEN 
					'NA'
			ELSE 
				country
		   END,
sunrise = CASE WHEN ISNULL(sunrise,'')=''
				THEN 
					'NA'
			ELSE 
				sunrise
		   END,
sunset = CASE WHEN ISNULL(sunset,'')=''
				THEN 
					'NA'
			ELSE 
				sunset
		   END,
id1 = CASE WHEN ISNULL(id1,'')=''
				THEN 
					'NA'
			ELSE 
				id1
		   END,
main = CASE WHEN ISNULL(main,'')=''
				THEN 
					'NA'
			ELSE 
				main
		   END,
[description] = CASE WHEN ISNULL([description],'')=''
				THEN 
					'NA'
			ELSE 
				[description]
		   END,
icon = CASE WHEN ISNULL(icon,'')=''
				THEN 
					'NA'
			ELSE 
				icon
		   END,
[name] = CASE WHEN ISNULL([name],'')=''
				THEN 
					'NA'
			ELSE 
				[name]
		   END,
timezone = CASE WHEN ISNULL(timezone,'')=''
				THEN 
					'NA'
			ELSE 
				timezone
		   END,
base = CASE WHEN ISNULL(base,'')=''
				THEN 
					'NA'
			ELSE 
				base
		   END

