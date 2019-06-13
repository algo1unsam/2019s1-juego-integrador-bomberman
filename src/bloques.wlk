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
	
	method esDuro() = true
	
	method generar() { game.addVisual(self) }
}

//BLOQUE INDESTRUCCTIBLE
class BloqueIndestructible inherits Bloque {
	
	method image() = "blockMap1Unbreakable.png"
	
	//ACCIONES QUE SUCEDE CUANDO LA EXPLOCION ALCANZA ESTE BLOQUE
	method explotarObjeto(explosion,onda) { explosion.encontroBloqueIdestructible(true) }
}

//BLOQUE DESTRUCCTIBLE
class BloqueDestructible inherits Bloque {
	
	method image() = "blockMap1Breakable.png"
	
	//ACCIONES QUE SUCEDE CUANDO LA EXPLOCION ALCANZA ESTE BLOQUE
	method explotarObjeto(explosion,onda) { self.destruirBloque() }
	
	method destruirBloque() { game.removeVisual(self) }
}