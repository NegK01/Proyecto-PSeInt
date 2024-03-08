
/// EJEMPLO
//  Se ingresa una lista de nombres (la lista termina
// cuando se ingresa un nombre en blanco) no permitiendo
// ingresar repetidos y luego se ordena y muestra
/// PRINCIPAL ERROR: No permite poner 1 elemento, deben ser 2 como maximo
/// se podria agregar un valor vacio para arreglarlo, pero se ve obvio

Funcion OrdenaLista
	
	Dimension lista[200]
	
	Escribir "Ingrese los nombres (enter en blanco para terminar):"
	
	// leer la lista
	cant<-0
	Leer nombre
	Mientras nombre<>"" Hacer
		cant<-cant+1
		lista[cant]<-nombre
		Repetir // leer un nombre y ver que no este ya en la lista
			Leer nombre
			se_repite<-Falso
			Para i<-1 Hasta cant Hacer
				Si nombre=lista[i] Entonces
					se_repite<-Verdadero
				FinSi
			FinPara
		Hasta Que ~ se_repite
	FinMientras
	
	// ordenar
	Para i<-1 Hasta cant-1 Hacer
		// busca el menor entre i y cant
		pos_menor<-i
		Para j<-i+1 Hasta cant Hacer
			Si lista[j]<lista[pos_menor] Entonces
				pos_menor<-j
			FinSi
		FinPara
		// intercambia el que estaba en i con el menor que encontro
		aux<-lista[i]
		lista[i]<-lista[pos_menor]
		lista[pos_menor]<-aux
	FinPara	
	
	// mostrar como queda la lista
	Escribir "La lista ordenada es:"
	Para i<-1 Hasta cant Hacer
		Escribir "   ",lista[i]
	FinPara
	
FinFuncion








Algoritmo ControlDeInventario
    // Definiciones de variables
	Definir opc, opcReg, opcES, contador, maximo_articulos, cantidad Como Entero
	Definir busca Como Caracter
	
    
    // Dimensionamos los arreglos para almacenar los datos
	Dimension lista[100] , precio[100], stock[100], dia[100],mes[100],anio[100]
    
    
    contador <- 0 //el contador va a llevvar la cuenta del indice de los arreglos
    
    // Bucle principal
    Repetir
        // menu principal
		Borrar Pantalla
		Imprimir "-----Control De Inventario-----"
		Imprimir "1- Registro"
		Imprimir "2- Entrada / Salida"
		Imprimir "3- Inventario"
		Imprimir "4- Informe"
		Imprimir "5- Salir"
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
					Escribir "Ingrese el nombre del producto ",i,": "
					Leer lista[contador + i]
					Escribir "Ingrese el precio de ",lista[contador + i],":"
					Leer precio[contador + i]
					Escribir "Ingrese la fecha de vencimiento del producto"
					Escribir Sin Saltar "Dia"; leer d
					Escribir Sin Saltar "Mes";leer m
					Escribir Sin Saltar "Año";leer a
					
					Si d > 0 y d <= 31 y m >= 1 y m <= 12 Entonces
						dia[i] = d
						mes[i] = m
						anio[i] = a
						
					Sino
						lista[contador + i]=""
						precio[contador + i]=""
						Escribir "La fecha ingresada es inválida. El producto no se registrará."
					FinSi
					
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
							stock[i] = stock[i]+cantidad
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
							//Escribir "Precio ", lista[i], ": ", precio[i], "¢. ", "Stock: ", stock[i];
							si busca == lista[i]
								Imprimir "Digite cuanto desea restar al stock de ",lista[i]
								leer cantidad
								Si cantidad <= stock[i] // aqui se valida la cantidad que quiere eliminar del stock, ya que puede ocurrir que quiera eliminar algo y no haya nada en el stock, puede dar negativo
									stock[i] = stock[i]-cantidad
									encontrado = Verdadero
								SiNo
									Imprimir "No se pueden eliminar mas de lo que hay"
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
				// mostrar inventario
                Borrar Pantalla
				Imprimir "BIENVENIDO"
				Imprimir "INVENTARIO"
				
				Para i<-1 Hasta contador Con Paso 1 Hacer //se recorre el arreglo para mostrar todos los productos registrados
					Escribir "Producto: ", lista[i], ", Precio: ", precio[i], "¢, Stock: ", stock[i]," Vencimiento: ",dia[i],"/",mes[i],"/",anio[i]
				FinPara
			4: 
				// aqui va lo del informe
				Borrar Pantalla
				Imprimir "BIENVENIDO"
				Imprimir "INFORME"
				Imprimir ""
				
				// tabla de informe
				Escribir "| Producto | Precio | Stock | Vencimiento |"
				Escribir "|----------|--------|-------|-------------|"
				
				// productos en forma de tabla
				Para i <- 1 Hasta contador Con Paso 1 Hacer
					Escribir "| ", lista[i], "   | ", precio[i], "¢  |", stock[i], "      | ", dia[i],"/",mes[i],"/",anio[i], "            |"
				FinPara
			5:
				Escribir "SALIENDO..."
			De Otro Modo:
				Escribir "Opcion no valida"
		FinSegun
		
        // presionar cualquier tecla para continuar, pero no la tecla de apagar la pc xD
		Si opc <> 5 Entonces
			Escribir "Presione (enter) para volver al menu..."
			
			Esperar Tecla
		FinSi
    Hasta Que opc = 5	
FinAlgoritmo


