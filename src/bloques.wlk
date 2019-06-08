import wollok.game.*

//Constructor de bloques
object indestructible { method construir(newPosition) = new BloqueIndestructible(position = newPosition) } 


//Clase bloques
class Bloque {
	var property position
	
	var  picture = "block01.png"
	
	method image() = picture
	
	method generar() { game.addVisual(self) }
	
	method accion(algo) { algo.volverAlaAnteriorPosicion()}
}

class BloqueIndestructible inherits Bloque {
	method cambiarImagen() { picture = "block01.png" }
}

class BloqueDestructible inherits Bloque {
	method cambiarImagen() { picture = "block02.png" }
}