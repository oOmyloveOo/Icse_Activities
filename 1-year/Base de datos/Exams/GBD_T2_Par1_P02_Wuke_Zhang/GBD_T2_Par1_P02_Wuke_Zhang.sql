//*Consulta para obtener la información detallada de todos los pedidos realizados por un cliente específico, incluyendo los nombres de los componentes de cada pedido.*//
SELECT Pedidos.PedidoID, Pedidos.FechaPedido, Pedidos.EstadoPedido, Componentes.ComponenteID, Componentes.Nombre AS NombreComponente, PedidoComponente.Cantidad 
FROM Pedidos
JOIN PedidoComponente ON Pedidos.PedidoID = PedidoComponente.PedidoID
JOIN Componentes ON PedidoComponente.ComponenteID = Componentes.ComponenteID
WHERE Pedidos.ClienteID = (SELECT ClienteID FROM Clientes WHERE Nombre = 'Ana' AND Apellido = 'García');

//*Consulta para listar todos los componentes que están actualmente en stock pero que no han sido incluidos en ningún pedido reciente.*//
SELECT DISTINCT * FROM Componentes
LEFT JOIN PedidoComponente ON Componentes.ComponenteID = PedidoComponente.ComponenteID
WHERE PedidoComponente.ComponenteID is NULL;

//*Consulta para identificar clientes que han realizado pedidos que incluyen un componente específico, por ejemplo, todos los clientes que han pedido un ordenador con una tarjeta gráfica particular.*//
SELECT DISTINCT Clientes.ClienteID, Clientes.Nombre, Clientes.Apellido
FROM Clientes
JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID
JOIN PedidoComponente ON Pedidos.PedidoID = PedidoComponente.PedidoID
JOIN Componentes ON PedidoComponente.ComponenteID = Componentes.ComponenteID
WHERE Componentes.Nombre = 'Tarjeta Gráfica Nvidia GTX 1080';


//*Consulta para obtener un listado de todos los ordenadores montados que están listos para entrega, mostrando el detalle de cada componente incluido en el montaje junto con la información del pedido correspondiente.*//
SELECT Ordenadores.OrdenadorID, Ordenadores.FechaMontaje, Pedidos.PedidoID, Componentes.ComponenteID, Componentes.Nombre AS NombreComponente, PedidoComponente.Cantidad
FROM Ordenadores
JOIN Pedidos ON Ordenadores.PedidoID = Pedidos.PedidoID
JOIN PedidoComponente ON Pedidos.PedidoID = PedidoComponente.PedidoID
JOIN Componentes ON PedidoComponente.ComponenteID = Componentes.ComponenteID;

