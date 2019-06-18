import wollok.game.*
import bloques.*
import powerUps.*
import players.*

class Mapa {
	var elementos = []
	
	var position = game.at(0, 0)
	
	method generar(){
		game.clear()
		game.addVisual(self)
		self.construir()
		self.crear()
		player1.generar()
		player2.generar()
	}
	
	method construir() 
	
	//GENERO TODOS LOS ELEMENTOS DE LA LISTA
	method crear() { elementos.forEach{ elemento => elemento.generar() } }
	
	method remover() { elementos.forEach{ elemento => elemento.remover() } }
	
	//ANIADO ELEMENTOS A LA LSITA
	method aniadirElemento(tipo,x,y) { elementos.add(self.construirElemento(tipo,x,y)) }
	
	//CONSTRUYO ELEMENTOS
	method construirElemento(tipo,x,y) = tipo.construir(game.at(x,y))
	
	//CREO LINEAS HORIZONTALES
	method aniadirLineaHorizontal(tipoDeBloque,enDonde,desde,hasta) {
		(desde .. hasta).forEach{ n => self.aniadirElemento(tipoDeBloque,n,enDonde) } 
	}
	
	//CREO LINEAS VERTICALES
	method aniadirLineaVertical(tipoDeBloque,enDonde,desde,hasta) {
		(desde .. hasta).forEach{ n => self.aniadirElemento(tipoDeBloque,enDonde,n) } 
	}
	
	//CREDO GRILLA
	method aniadirGrilla(tipoDeBloque) {
		(2 .. game.width()-4).forEach{ 
			i => (2 .. game.height()-2).forEach{ 
				j => if( j%2==0 && i%2==0 )self.aniadirElemento(tipoDeBloque,i,j) 
			}
		} 
	}
}


//MAPAS

object mapa { var property numeroDeMapa = null }

object mapa1 inherits Mapa{
	
	method image() = "backgroundmap" + 1 + ".png"
	
	override method construir() {
		mapa.numeroDeMapa(1)
		
		//Creo contorno
		self.aniadirLineaHorizontal(bloqueIndestructible, 0, 0, 20)
		self.aniadirLineaHorizontal(bloqueIndestructible, 12, 0, 20)
		self.aniadirLineaVertical(bloqueIndestructible, 0, 0, 12)
		self.aniadirLineaVertical(bloqueIndestructible, 20, 0, 12)
		
		//Creo grilla
		self.aniadirGrilla(bloqueDestructible)
		
		/*self.aniadirElemento(powerUpAgregarVida, 2, 3)
		self.aniadirElemento(powerUpAgregarVida, 2, 4)
		self.aniadirElemento(powerUpAgregarVida, 2, 5)
		self.aniadirElemento(powerUpAgregarVida, 2, 6)
		self.aniadirElemento(powerUpAgregarVida, 2, 7)
		self.aniadirElemento(powerUpAgregarVida, 2, 8)
		self.aniadirElemento(powerUpAgregarVida, 2, 9)
		self.aniadirElemento(powerUpAgregarVida, 2, 10)*/
	}
}

object mapa2 inherits Mapa{
	
	method image() = "backgroundmap" + 2 + ".png"
	
	override method construir() {
		mapa.numeroDeMapa(2)
		
		//Creo contorno
		self.aniadirLineaHorizontal(bloqueIndestructible, 0, 0, 20)
		self.aniadirLineaHorizontal(bloqueIndestructible, 12, 0, 20)
		self.aniadirLineaVertical(bloqueIndestructible, 0, 0, 12)
		self.aniadirLineaVertical(bloqueIndestructible, 20, 0, 12)
		
		//Creo grilla
		self.aniadirGrilla(bloqueDestructible)
	}
}

object mapa3 inherits Mapa{

	method image() = "backgroundmap" + 3 + ".png"
	
	override method construir() {
		mapa.numeroDeMapa(3)
		
		//Creo contorno
		self.aniadirLineaHorizontal(bloqueIndestructible, 0, 0, 20)
		self.aniadirLineaHorizontal(bloqueIndestructible, 12, 0, 20)
		self.aniadirLineaVertical(bloqueIndestructible, 0, 0, 12)
		self.aniadirLineaVertical(bloqueIndestructible, 20, 0, 12)
		
		//Creo grilla
		self.aniadirGrilla(bloqueDestructible)
	}
}

object mapa4 inherits Mapa{
	
	method image() = "backgroundmap" + 4 + ".png"
	
	override method construir() {
		mapa.numeroDeMapa(4)
		
		//Creo contorno
		self.aniadirLineaHorizontal(bloqueIndestructible, 0, 0, 20)
		self.aniadirLineaHorizontal(bloqueIndestructible, 12, 0, 20)
		self.aniadirLineaVertical(bloqueIndestructible, 0, 0, 12)
		self.aniadirLineaVertical(bloqueIndestructible, 20, 0, 12)
		
		//Creo grilla
		self.aniadirGrilla(bloqueDestructible)
	}
}
