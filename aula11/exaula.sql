-- EX 1

SELECT designacao,
(select count(distinct factura.numero_factura)
from factura, reserva_quartos
where reserva_quartos.sigla_hotel =
hotel.sigla_hotel and
factura.numero_reserva=reserva_quartos.numero_reserva)
AS Total_Facturas
FROM hotel

-- Outra maneira

SELECT COUNT(Distinct reserva_quartos.numero_reserva), reserva_quartos.Sigla_hotel
FROM reserva_quartos
JOIN factura ON factura.numero_reserva = reserva_quartos.numero_reserva
JOIN reserva ON reserva_quartos.numero_reserva = reserva.numero_reserva
GROUP BY Sigla_Hotel;

-- EX2

SELECT hotel.designacao, count(*) AS Total_Quartos
FROM hotel, quarto
WHERE hotel.sigla_hotel = quarto.sigla_hotel
GROUP BY hotel.designacao
UNION
SELECT hotel.designacao, 0 as Total_Quartos
FROM hotel
WHERE NOT EXISTS (SELECT * FROM quarto WHERE hotel.sigla_hotel=quarto.sigla_hotel);

-- EX3
-- Nao completa~

SELECT designacao, count(Numero_Quarto)
FROM hotel, quarto
WHERE hotel.Sigla_Hotel = quarto.Sigla_Hotel
GROUP by designacao


-- EX 4

SELECT Nome_Cliente, Count(Numero_Reserva)
FROM organização, reserva, cliente
WHERE organização.Numero_Cliente = reserva.Numero_Cliente 
AND cliente.Numero_Cliente = organização.Numero_Cliente
GROUP BY Nome_Cliente
UNION
SELECT Nome_Cliente, 0
FROM organização, cliente
WHERE cliente.Numero_Cliente = organização.Numero_Cliente AND
organização.Numero_Cliente NOT IN 
(SELECT numero_cliente FROM reserva r);