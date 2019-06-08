import wollok.game.*
import explosion.*

object constructorDeBombaNormal {
	method generar(posicion) { new BombaNormal().generar(posicion)}
}

object constructorDeBombaFuerte {
	//method generar(posicion) { new BombaFuerte().generar(posicion)}
}

class Bomba{
	var property position
	
	method accion(algo) { }
	//BOMBA
	method generar(lugar) {
		self.position(lugar)
		game.addVisual(self)
		self.configurar()
	}
	
	method configurar(){
		game.onTick(2000, "explotar", { self.explotar() game.removeTickEvent("explotar")
		})}
	method explotar()
}

class BombaNormal inherits Bomba{
	//WOLLOK
	method image() = "bomb01.png"
	
	override method explotar(){ 
		
		//new Explosion().generar(self.position().x(),self.position().y())
		new Explosion().generar(self.position().x(),self.position().y())
		new Explosion().generar(self.position().x()-1,self.position().y())
		new Explosion().generar(self.position().x()-2,self.position().y())
		new Explosion().generar(self.position().x(),self.position().y()-1)
		new Explosion().generar(self.position().x(),self.position().y()-2)
		new Explosion().generar(self.position().x()+1,self.position().y())
		new Explosion().generar(self.position().x()+2,self.position().y())
		new Explosion().generar(self.position().x(),self.position().y()+1)
		new Explosion().generar(self.position().x(),self.position().y()+2)
		game.removeVisual(self)
	}//Hago explotar la bomba y generar los objetos de explocion alrededor de ella `ver si se puede hacer algo para no repetir codigo`
	
}

class BombaFuerte inherits Bomba {
	
}