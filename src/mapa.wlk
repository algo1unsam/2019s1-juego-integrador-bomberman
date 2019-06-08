import wollok.game.*
import bloques.*

class Mapa {
	
	var bloques = []
	
	method generar() { bloques.forEach{ bloque => bloque.generar() } }
	
	method aniadirBloque(bloque) { bloques.add(bloque) }
	
	method crearBloque(tipoDeBloque,x,y) { self.aniadirBloque(tipoDeBloque.construir(game.at(x,y))) }
	
	method crearLineaHorizontal(tipoDeBloque,enDonde,desde,hasta) {
		(desde .. hasta).forEach{ n => self.crearBloque(tipoDeBloque,n,enDonde) } 
	}
	
	method crearLineaVertical(tipoDeBloque,enDonde,desde,hasta) {
		(desde .. hasta).forEach{ n => self.crearBloque(tipoDeBloque,enDonde,n) } 
	}
}