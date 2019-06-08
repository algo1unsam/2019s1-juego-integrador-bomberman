import wollok.game.*

class Mapa {
	
	var bloques = []
	
	method crearMapa(nuevaListaDePosiciones) {  }
	
	method generar() { bloques.forEach{ bloque => bloque.generar() } }
	
}
