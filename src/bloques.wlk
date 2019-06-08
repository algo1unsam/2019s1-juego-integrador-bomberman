import wollok.game.*

class Bloque {
	var property position
	
	var  picture = "block01.png"
	
	method image() = picture
	
	method generar() {
		//self.position(position)
		game.addVisual(self)
	}
	
	method accion(algo) { algo.volverAlaAnteriorPosicion()}
}

class Indestructible inherits Bloque {
	
	method cambiarImagen() { picture = "block01.png" }
	
}

class Destructible inherits Bloque {
	
	method cambiarImagen() { picture = "block02.png" }
	
}