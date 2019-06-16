import wollok.game.*
import powerUps.*
import scheduler.*

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
	
	var property imagen = "blockMap1Unbreakable.png"
	
	method esDuro() = true
	
	method image() = imagen
	
//ACCIONES QUE SUCEDE CUANDO LA EXPLOCION ALCANZA ESTE BLOQUE
	//SI EXPLOTA
	method explotarObjeto(explosion,onda) { 
		explosion.encontroBloqueIdestructible(true)
	}
	
	//SI SE MANCHA
	method mancharObjeto(explosion,sticky) {
		explosion.encontroBloqueIdestructible(true) 
		self.imagen("blockMap1UnbreakableSticky.png")
		sticky.remover()
	}
}

//BLOQUE DESTRUCCTIBLE
class BloqueDestructible inherits Bloque {
	
	var property probabilidadDePowerUp = 10
	
	method esDuro() = true
	
	method image() = "blockMap1Breakable.png"
	
//ACCIONES QUE SUCEDE CUANDO LA EXPLOCION ALCANZA ESTE BLOQUE
	method explotarObjeto(explosion,onda) { self.destruirBloque(onda) }
	
	method mancharObjeto(explosion,sticky) { explosion.encontroBloqueIdestructible(true) }
	
	method destruirBloque(onda) {
		if(self.ponerPowerUp()) 
			scheduler.schedule(onda.tiempoDeExplosion()+50, {
				(powerUPsRandom.obtener()).construir(self.position()).generar()
			})
		game.removeVisual(self)
	}
	
	method random() = 0.randomUpTo(10).roundUp()
	
	method ponerPowerUp() = self.random() <= self.probabilidadDePowerUp()
}

class BloqueDestruido inherits Bloque {
	
	method esDuro() = false
	
	method image() = "groundMap1Broken.png"
	
	//ACCIONES QUE SUCEDE CUANDO LA EXPLOCION ALCANZA ESTE BLOQUE
	method explotarObjeto(explosion,onda) {  }
	
	method destruirBloque() {  }
}

