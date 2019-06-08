import wollok.game.*
import bloques.*

class Mapa {
	
	var elementos = []
	
	//GENERO TODOS LOS ELEMENTOS DE LA LISTA
	method generar() { elementos.forEach{ elemento => elemento.generar() } }
	
	//ANIADO ELEMENTOS A LA LSITA
	method aniadirElemento(tipo,x,y) { elementos.add(self.construirElemento(tipo,x,y)) }
	
	//CONSTRUYO ELEMENTOS
	method construirElemento(tipo,x,y) = tipo.construir(game.at(x,y))
	
	//CREO LINEAS HORIZONTALES
	method aniadirLineaHorizontal(tipoDeBloque,enDonde,desde,hasta) {
		(desde .. hasta).forEach{ n => self.aniadirElemento(tipoDeBloque,n,enDonde) } 
	}
	
	//CREO LINEAS VERTICALES
	method aniadirLineaVertical(tipoDeBloque,enDonde,desde,hasta) {
		(desde .. hasta).forEach{ n => self.aniadirElemento(tipoDeBloque,enDonde,n) } 
	}
}