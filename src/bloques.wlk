import wollok.game.*

//CONSTRUCTOR DE BLOQUES
object bloqueIndestructible { 
	method construir(newPosition) = new BloqueIndestructible(position = newPosition)
} 

object bloqueDestructible { 
	method construir(newPosition) = new BloqueDestructible(position = newPosition)
} 



//TIPOS DE BLOQUE
class Bloque {
	var property position

	method generar() { game.addVisual(self) }
	
	method chocoJugador(algo) { algo.volverAlaAnteriorPosicion()}
}

//BLOQUE INDESTRUCCTIBLE
class BloqueIndestructible inherits Bloque {
	
	method image() = "block01.png"
	
	//ACCIONES QUE SUCEDE CUANDO LA EXPLOCION ALCANZA ESTE BLOQUE
	method explotarObjeto(explosion,onda) { explosion.encontroBloqueIdestructible(true) }
}

//BLOQUE DESTRUCCTIBLE
class BloqueDestructible inherits Bloque {
	method image() = "block02.png"
	
	//ACCIONES QUE SUCEDE CUANDO LA EXPLOCION ALCANZA ESTE BLOQUE
	method explotarObjeto(explosion,onda) { self.destruirBloque() }
	
	method destruirBloque() { game.removeVisual(self) }
}