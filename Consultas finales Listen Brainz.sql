# Agrupaciones para tabla sobre escuchas de artistas y track

SELECT 
    Fecha,
    artist_name,
    track_name,
    COUNT(*) AS Conteo
FROM 
(
SELECT 
    FORMAT_TIMESTAMP('%d-%m-%Y', TIMESTAMP(listened_at)) AS Fecha,
    EXTRACT(YEAR FROM TIMESTAMP(listened_at)) AS Anio,
    artist_name,
    track_name
FROM `listenbrainz.listenbrainz.listen`
WHERE EXTRACT(YEAR FROM TIMESTAMP(listened_at)) = 2017
)
GROUP BY Fecha, artist_name, track_name


# Agrupaciones para tabla sobre usuarios

SELECT 
    Fecha,
    user_name,
    COUNT(*) AS Conteo
FROM 
(
SELECT 
    FORMAT_TIMESTAMP('%d-%m-%Y', TIMESTAMP(listened_at)) AS Fecha,
    EXTRACT(YEAR FROM TIMESTAMP(listened_at)) AS Anio,
    user_name
FROM `listenbrainz.listenbrainz.listen`
WHERE EXTRACT(YEAR FROM TIMESTAMP(listened_at)) >= 2015 AND EXTRACT(YEAR FROM TIMESTAMP(listened_at)) <= 2017
)
GROUP BY Fecha, user_name

# Horarios de escucha.

SELECT 
    FORMAT_TIMESTAMP('%H:%M', TIMESTAMP(listened_at)) AS Hora,
    count(*)
FROM `listenbrainz.listenbrainz.listen`
GROUP BY FORMAT_TIMESTAMP('%H:%M', TIMESTAMP(listened_at))
