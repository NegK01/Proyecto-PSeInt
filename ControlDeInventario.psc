
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
	Definir opc,opcReg,opcES Como Entero
	Definir busca Como Caracter // Se utilizara para buscar un producto en especifico y luego manipularlo
								// ^ Quiza se pueda manipular con lista[1] <- Pedro, al indice 1 le cambiamos su valor
	
	Repetir
		Borrar Pantalla
		Imprimir "-----Control De Inventario-----"
		Imprimir "1- Registro" // Hace falta hacer que el usuario pueda restar el stock
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
				Borrar Pantalla 
				Dimensionar lista[maximo_articulos], precio[maximo_articulos], stock[maximo_articulos];
				Para i<-1 Hasta maximo_articulos Con Paso 1 Hacer
					Escribir "Ingrese el nombre del producto ",i,": "
					leer lista[i]
					Escribir 'Ingrese Precio de ',lista[i],':'
					Leer precio[i]
					Escribir "Ingrese el stock de ",lista[i],": "
					Leer stock[i]
					Borrar Pantalla
				FinPara
					
				Para i<-1 Hasta maximo_articulos Con Paso 1 Hacer //Recorrer toda la lista
					Escribir "Precio ", lista[i], ": ", precio[i], "¢. ", "Stock: ", stock[i];
				FinPara
			2:
				Borrar Pantalla
				Imprimir "BIENVENIDO"
				Imprimir "ENTRADA / SALIDA"
				Escribir "Seleccione Entrada(1) o Salida(2)"
				Leer opcES
				Si opcES == 1 Entonces // Se deberia de meter en bucle y que el usuario decida hasta cuando salir, esto con el fin de evitar que no vaya al menu
					Borrar Pantalla
					Imprimir "BIENVENIDO"
					Imprimir "ENTRADA"
					Imprimir "Ingrese el nombre del producto que desea añadir stock:"
				SiNo
					Si opcES == 2 Entonces
						Borrar Pantalla
						Imprimir "BIENVENIDO"
						Imprimir "SALIDA"
						Imprimir "Ingrese el nombre del producto que desea restar stock:"
					SiNo
						Si opcES<>2 o opcES<>1 Entonces
							Imprimir "No valido"
						FinSi
					FinSi
				FinSi
			3:
				Imprimir "BIENVENIDO"
				Imprimir "INVENTARIO"
				Para i<-1 Hasta maximo_articulos Con Paso 1 Hacer
					Escribir "Precio ", lista[i], ": ", precio[i], "¢. ", "Stock: ", stock[i];
				FinPara
			4: 
				Escribir "INFORME"
			5:
				Escribir "SALIENDO..."
			De Otro Modo:
				Escribir "Opcion no valida"
		FinSegun
		Si opc<>5 Entonces
			Escribir "Presione (enter) para volver al menu..."
			Esperar Tecla
		FinSi
	Hasta Que opc = 5	


FinAlgoritmo
