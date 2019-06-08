import wollok.game.*

//CONSTRUCTOR DE BLOQUES
object bloqueIndestructible { 
	method construir(newPosition) = new BloqueIndestructible(position = newPosition)
} 


//TIPOS DE BLOQUE
class Bloque {
	var property position
	
	var  picture = "block01.png"
	
	method image() = picture
	
	method generar() { game.addVisual(self) }
	
	method chocoJugador(algo) { algo.volverAlaAnteriorPosicion()}
}

//BLOQUE INDESTRUCCTIBLE
class BloqueIndestructible inherits Bloque {
	method cambiarImagen() { picture = "block01.png" }
	
	//ACCIONES QUE SUCEDE CUANDO LA EXPLOCION ALCANZA ESTE BLOQUE
	method explotarObjeto(explosion) { 
		explosion.encontroBloque(true)
	}
}

//BLOQUE DESTRUCCTIBLE
class BloqueDestructible inherits Bloque {
	method cambiarImagen() { picture = "block02.png" }
}