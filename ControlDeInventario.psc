Algoritmo ControlDeInventario
    // Definiciones de variables
	Definir opc, opcReg, opcES, contador, maximo_articulos, cantidad, precioTotal Como Entero
	Definir busca Como Caracter
	
    
    // Dimensionamos los arreglos para almacenar los datos
	Dimension lista[100] , precio[100], stock[100], dia[100],mes[100],anio[100]
    
	
    contador <- 0 //el contador va a llevar la cuenta del indice de los arreglos
    
    // Bucle principal
    Repetir
        // menu principal
		Borrar Pantalla
		Imprimir "-----Control De Inventario-----"
		Imprimir "1- Registro"
		Imprimir "2- Entrada / Salida"
		Imprimir "3- Editar Productos"
		Imprimir "4- Inventario"
		Imprimir "5- Informe"
		Imprimir "6- Salir"
		Escribir "Seleccione una opcion:"
		Leer opc
		
		
		
		Segun opc Hacer
			1:
				
                Borrar Pantalla
				Imprimir "BIENVENIDO"
				Imprimir "REGISTRO"
				Imprimir "Digite la cantidad de productos que desea añadir: "
				Leer maximo_articulos
				
				Para i<-1 Hasta maximo_articulos Con Paso 1 Hacer
					Repetir
						Escribir "Ingrese el nombre del producto ",i,": "
						Leer lista[contador + i]
						Escribir "Ingrese el precio de ",lista[contador + i],":"
						Leer precio[contador + i]
						Escribir "Ingrese la fecha de vencimiento del producto"
						Escribir Sin Saltar "Dia"; leer d
						Escribir Sin Saltar "Mes";leer m
						Escribir Sin Saltar "Año";leer a
						
						Si (d >= 1 y d <= 31) y (m >= 1 y m <= 12) y (a >= 0 y a <= 3000) Entonces
							dia[contador + i] = d
							mes[contador + i] = m
							anio[contador + i] = a
							fechaCorrecta = Verdadero
						Sino
							lista[contador + i]=""
							precio[contador + i]=""
							Escribir "La fecha ingresada es inválida. Intente nuevamente"
							fechaCorrecta = Falso
						FinSi
					Hasta Que fechaCorrecta = Verdadero
					
					stock[contador + i] <- 0 //  el stock va estar en 0 cada vez que se registre un producto
				FinPara
				contador <- contador + maximo_articulos //  como el contador es una variable global, se va a estar almacenando la cantidad que le agreguemos, y asi nunca se va a sobrescribir
				Escribir "Productos registrados correctamente."
			2:
				
				Borrar Pantalla
				Imprimir "BIENVENIDO"
				Imprimir "ENTRADA / SALIDA"
				Escribir "Seleccione Entrada(1) o Salida(2)"
				Leer opcES
				Si opcES == 1 Entonces 
					Borrar Pantalla
					Imprimir "BIENVENIDO"
					Imprimir "ENTRADA"
					Imprimir "Ingrese el nombre del producto que desea añadir stock:"
					leer busca
					encontrado = Falso // esta variable es para corregir la logica de no repetir: Imprimir "Producto no encontrado." cuando se este buscando el nombre que desea agregar stock
					Para i<-1 Hasta contador Con Paso 1 Hacer
						si busca == lista[i] Entonces
							Imprimir "Digite cuanto desea agregar al stock de ",lista[i]
							leer cantidad
							stock[i] = stock[i]+ABS(cantidad)
							encontrado = Verdadero
						FinSi
					FinPara
					Si encontrado == Falso Entonces
						Imprimir "Producto no encontrado."
					FinSi
				SiNo
					Si opcES == 2 Entonces
						Borrar Pantalla
						Imprimir "BIENVENIDO"
						Imprimir "SALIDA"
						Imprimir "Ingrese el nombre del producto que desea restar stock:"
						
						leer busca
						encontrado = Falso
						Para i<-1 Hasta contador Con Paso 1 Hacer
							si busca == lista[i]
								Imprimir "Digite cuanto desea restar al stock de ",lista[i]
								leer cantidad
								Si cantidad <= stock[i] // aqui se valida la cantidad que quiere eliminar del stock, ya que puede ocurrir que quiera eliminar algo y no haya nada en el stock, puede dar negativo
									stock[i] = stock[i]-ABS(cantidad)
									encontrado = Verdadero
								SiNo
									Imprimir "No se pueden eliminar más de lo que hay"
									encontrado = Verdadero
								FinSi
							FinSi
						FinPara
						
						Si encontrado == Falso Entonces
							Imprimir "Producto no encontrado."
						FinSi
						
					SiNo
						Si opcES<>2 o opcES<>1 Entonces
							Imprimir "No valido"
						FinSi
					FinSi
				FinSi
			3:
				Borrar Pantalla
				Imprimir "BIENVENIDO"
				Imprimir "EDITAR PRODUCTO"
				Imprimir "Ingrese el nombre del producto que desea editar su nombre y fecha: "
				leer busca
				encontrado = Falso
				Para i<-1 Hasta contador Con Paso 1 Hacer
					Si busca == lista[i] Entonces
						Escribir "Ingrese el nuevo nombre para producto ",lista[i],": "
						Leer lista[i]
						Escribir "Ingrese la fecha de vencimiento del producto"
						Escribir Sin Saltar "Dia";leer d
						Escribir Sin Saltar "Mes";leer m
						Escribir Sin Saltar "Año";leer a
						encontrado = Verdadero
						
						Repetir
							Si (d >= 1 y d <= 31) y (m >= 1 y m <= 12) y (a >= 0 y a <= 3000) Entonces
								dia[i] = d
								mes[i] = m
								anio[i] = a
								fechaCorrecta = Verdadero
							Sino
								lista[i]=""
								precio[i]=""
								Escribir "La fecha ingresada es inválida. Intente nuevamente"
								fechaCorrecta = Falso
							FinSi
						Hasta Que fechaCorrecta = Verdadero
					FinSi
				FinPara
				Si encontrado == Falso Entonces
					Imprimir "Producto no encontrado."
				FinSi
			4:
				// mostrar inventario
                Borrar Pantalla
				Imprimir "BIENVENIDO"
				Imprimir "INVENTARIO"
				
				Para i<-1 Hasta contador Con Paso 1 Hacer //se recorre el arreglo para mostrar todos los productos registrados
					Escribir "Producto: ", lista[i], ", Precio: ", precio[i], "¢, Stock: ", stock[i]," Vencimiento: ",dia[i],"/",mes[i],"/",anio[i]
				FinPara
			5: 
				// aqui va lo del informe
				Borrar Pantalla
				Imprimir "BIENVENIDO"
				Imprimir "INFORME"
				Imprimir ""
				
				// tabla de informe
				Escribir "| Producto | Precio | Stock | Vencimiento |"
				Escribir "|----------|--------|-------|-------------|"
				precioTotal = 0
				
				// productos en forma de tabla
				Para i <- 1 Hasta contador Con Paso 1 Hacer
					Escribir "| ", lista[i], "   | ", precio[i], "¢  |", stock[i], "      | ", dia[i],"/",mes[i],"/",anio[i], "            |"
					precioTotal<- precioTotal + ConvertirANumero(precio[i]) * stock[i]
				FinPara
				Escribir "Precio total del inventario: ", precioTotal, "¢"
			6:	
				Escribir "Desea ver el informe antes de salir? (S/N)"
				Leer respuesta
				Si respuesta == "s" o respuesta == "S" Entonces
					Escribir "| Producto | Precio | Stock | Vencimiento |"
					Escribir "|----------|--------|-------|-------------|"
					
					Para i <- 1 Hasta contador Con Paso 1 Hacer
						Escribir "| ", lista[i], "   | ", precio[i], "¢  |", stock[i], "      | ", dia[i],"/",mes[i],"/",anio[i], "            |"
					FinPara
					Escribir "Precio total del inventario: ", precioTotal, "¢"
					Escribir ""
					Escribir "SALIENDO..."
				Sino // El respuesta == "no" realmente no importa hacerlo, el usuario esta queriendo salir
					Escribir "SALIENDO..."
				FinSi
			De Otro Modo:
				Escribir "Opcion no valida"
		FinSegun
		
        // presionar cualquier tecla para continuar, pero no la tecla de apagar la pc xD
		Si opc <> 6 Entonces
			Escribir "Presione (enter) para volver al menu..."
			
			Esperar Tecla
		FinSi
    Hasta Que opc = 6	
FinAlgoritmo
