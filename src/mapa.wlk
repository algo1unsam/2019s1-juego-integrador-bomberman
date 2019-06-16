import wollok.game.*
import bloques.*
import powerUps.*
import players.*

class Mapa {
	var elementos = []
	
	var position = game.at(0, 0)
	
	method crearFondo() { }
	
	method generar(){
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
		(2 .. game.width()-2).forEach{ 
			i => (2 .. game.height()-2).forEach{ 
				j => if( j%2==0 && i%2==0 )self.aniadirElemento(tipoDeBloque,i,j) 
			}
		} 
	}
}

object mapa1 inherits Mapa{
	
	method image() = "fondoPiedra.png"
	
	override method construir() {
		//Creo contorno
		self.aniadirLineaHorizontal(bloqueIndestructible, 0, 0, 20)
		self.aniadirLineaHorizontal(bloqueIndestructible, 12, 0, 20)
		self.aniadirLineaVertical(bloqueIndestructible, 0, 0, 12)
		self.aniadirLineaVertical(bloqueIndestructible, 20, 0, 12)
		
		
		
		//Creo grilla
		self.aniadirGrilla(bloqueDestructible)
		
		//Aniado elementos
		/*self.aniadirElemento(powerUpBombaFuerte, 5, 7)
		self.aniadirElemento(powerUpAumentarVelocidad, 7, 11)
		self.aniadirElemento(powerUpEscudo, 11, 7)
		self.aniadirElemento(powerUpMasBombas, 13, 1)
		self.aniadirElemento(powerUpMasBombas, 13, 3)
		self.aniadirElemento(powerUpMasBombas, 11, 5)
		self.aniadirElemento(powerUpMasBombas, 11, 9)
		self.aniadirElemento(powerUpBombaSticky, 9, 9)*/
	}
}

object mapa2 inherits Mapa{
	
	override method construir() {
		self.aniadirLineaHorizontal(bloqueIndestructible, 0, 0, 20)
		self.aniadirLineaHorizontal(bloqueIndestructible, 12, 0, 20)
		self.aniadirLineaVertical(bloqueIndestructible, 0, 0, 12)
		
		self.aniadirElemento(powerUpBombaFuerte, 5, 7)
		self.aniadirElemento(powerUpAumentarVelocidad, 7, 11)
		self.aniadirElemento(powerUpEscudo, 11, 7)
		self.aniadirElemento(powerUpMasBombas, 13, 1)
		self.aniadirElemento(powerUpMasBombas, 13, 3)
		self.aniadirElemento(powerUpMasBombas, 11, 5)
		self.aniadirElemento(powerUpMasBombas, 11, 7)
	}
}