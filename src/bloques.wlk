import wollok.game.*

//CONSTRUCTOR DE BLOQUES
object bloqueIndestructible { 
	method construir(newPosition) = new BloqueIndestructible(position = newPosition)
} 

object bloqueDestructible { 
	method construir(newPosition) = new BloqueDestructible(position = newPosition)
}

object bloqueDestruido { 
	method construir(newPosition) = new BloqueDestruido(position = newPosition)
} 

//TIPOS DE BLOQUE
class Bloque {
	var property position

	method generar() { game.addVisual(self) }
}

//BLOQUE INDESTRUCCTIBLE
class BloqueIndestructible inherits Bloque {
	
	method esDuro() = true
	
	method image() = "blockMap1Unbreakable.png"
	
	//ACCIONES QUE SUCEDE CUANDO LA EXPLOCION ALCANZA ESTE BLOQUE
	method explotarObjeto(explosion,onda) { explosion.encontroBloqueIdestructible(true) }
}

//BLOQUE DESTRUCCTIBLE
class BloqueDestructible inherits Bloque {
	
	method esDuro() = true
	
	method image() = "blockMap1Breakable.png"
	
	//ACCIONES QUE SUCEDE CUANDO LA EXPLOCION ALCANZA ESTE BLOQUE
	method explotarObjeto(explosion,onda) { self.destruirBloque() }
	
	method destruirBloque() { game.removeVisual(self) }
}

class BloqueDestruido inherits Bloque {
	
	method esDuro() = false
	
	method image() = "groundMap3Broken.png"
	
	//ACCIONES QUE SUCEDE CUANDO LA EXPLOCION ALCANZA ESTE BLOQUE
	method explotarObjeto(explosion,onda) {  }
	
	method destruirBloque() {  }
}

