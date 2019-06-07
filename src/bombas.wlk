import wollok.game.*
import explosion.*

class Bomba{
	//ATRIBUTOS
	var property position
	
	//WOLLOK
	method image() = "tomaco_baby.png"
	
	method accion(alguien) {}
	
	//BOMBA
	method generar(lugar) {
		self.position(lugar)
		game.addVisual(self)
		self.configurar()
	} //Genero la bomba en el lugar del player
	
	method configurar(){
		game.onTick(2000, "explotar", { self.explotar()
			game.removeTickEvent("explotar")
		})
	} //Configuro la bomba para que explote
	
	method explotar(){ 
		
		//new Explosion().generar(self.position().x(),self.position().y())
		new Explosion().generar(self.position().x()-1,self.position().y())
		new Explosion().generar(self.position().x()-2,self.position().y())
		new Explosion().generar(self.position().x(),self.position().y()-1)
		new Explosion().generar(self.position().x(),self.position().y()-2)
		new Explosion().generar(self.position().x()+1,self.position().y())
		new Explosion().generar(self.position().x()+2,self.position().y())
		new Explosion().generar(self.position().x(),self.position().y()+1)
		new Explosion().generar(self.position().x(),self.position().y()+2)
		//game.removeVisual(self) //change image
	}//Hago explotar la bomba y generar los objetos de explocion alrededor de ella `ver si se puede hacer algo para no repetir codigo`
	
}