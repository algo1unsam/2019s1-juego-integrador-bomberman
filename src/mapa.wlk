import wollok.game.*
import bloques.*
import powerUps.*
import players.*

class Mapa {
	
	var elementos = []
	
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
	
}

object mapa1 inherits Mapa{
	
	method construir() {
		//Para crear lineas! (en donde, inicio, fin)
		self.aniadirLineaHorizontal(bloqueIndestructible, 0, 0, 20)
		self.aniadirLineaHorizontal(bloqueIndestructible, 12, 0, 20)
		self.aniadirLineaVertical(bloqueIndestructible, 0, 0, 12)
		self.aniadirLineaVertical(bloqueIndestructible, 20, 0, 12)
		
		//Se puede aniadirElementos, (tipo,x,y) los elementos pueden ser power ups o bloques
		//self.aniadirElemento(bloqueIndestructible, (0.randomUpTo(18)).roundUp(), (0.randomUpTo(13)).roundUp())
		//self.aniadirElemento(bloqueIndestructible, (0.randomUpTo(18)).roundUp(), (0.randomUpTo(13)).roundUp())
		//self.aniadirElemento(bloqueIndestructible, (0.randomUpTo(18)).roundUp(), (0.randomUpTo(13)).roundUp())
		
		//self.aniadirElemento(bloqueDestructible, (0.randomUpTo(18)).roundUp(), (0.randomUpTo(13)).roundUp())
		//self.aniadirElemento(bloqueDestructible, (0.randomUpTo(18)).roundUp(), (0.randomUpTo(13)).roundUp())
		//self.aniadirElemento(bloqueDestructible, (0.randomUpTo(18)).roundUp(), (0.randomUpTo(13)).roundUp())
		
		
		self.aniadirElemento(powerUpBombaFuerte, 5, 7)
		self.aniadirElemento(powerUpAumentarVelocidad, 7, 11)
		self.aniadirElemento(powerUpEscudo, 11, 7)
		self.aniadirElemento(powerUpMasBombas, 13, 1)
		self.aniadirElemento(powerUpMasBombas, 13, 3)
		self.aniadirElemento(powerUpMasBombas, 11, 5)
		self.aniadirElemento(powerUpMasBombas, 11, 7)
		
		
		//Esto hace el grid del mapa 1. A lo mejor se puede acortar.
		self.aniadirElemento(bloqueIndestructible,"gfkljgkf.png", 2,2)
		self.aniadirElemento(bloqueIndestructible, 2, 4)
		self.aniadirElemento(bloqueIndestructible, 2, 6)
		self.aniadirElemento(bloqueIndestructible, 2, 8)
		self.aniadirElemento(bloqueIndestructible, 2, 10)
		self.aniadirElemento(bloqueIndestructible, 4, 2)
		self.aniadirElemento(bloqueIndestructible, 4, 4)
		self.aniadirElemento(bloqueIndestructible, 4, 6)
		self.aniadirElemento(bloqueIndestructible, 4, 8)
		self.aniadirElemento(bloqueIndestructible, 4, 10)
		self.aniadirElemento(bloqueIndestructible, 6, 2)
		self.aniadirElemento(bloqueIndestructible, 6, 4)
		self.aniadirElemento(bloqueIndestructible, 6, 6)
		self.aniadirElemento(bloqueIndestructible, 6, 8)
		self.aniadirElemento(bloqueIndestructible, 6, 10)
		self.aniadirElemento(bloqueIndestructible, 8, 2)
		self.aniadirElemento(bloqueIndestructible, 8, 4)
		self.aniadirElemento(bloqueIndestructible, 8, 6)
		self.aniadirElemento(bloqueIndestructible, 8, 8)
		self.aniadirElemento(bloqueIndestructible, 8, 10)
		self.aniadirElemento(bloqueIndestructible, 10, 2)
		self.aniadirElemento(bloqueIndestructible, 10, 4)
		self.aniadirElemento(bloqueIndestructible, 10, 6)
		self.aniadirElemento(bloqueIndestructible, 10, 8)
		self.aniadirElemento(bloqueIndestructible, 10, 10)
		self.aniadirElemento(bloqueIndestructible, 12, 2)
		self.aniadirElemento(bloqueIndestructible, 12, 4)
		self.aniadirElemento(bloqueIndestructible, 12, 6)
		self.aniadirElemento(bloqueIndestructible, 12, 8)
		self.aniadirElemento(bloqueIndestructible, 12, 10)
		self.aniadirElemento(bloqueIndestructible, 14, 2)
		self.aniadirElemento(bloqueIndestructible, 14, 4)
		self.aniadirElemento(bloqueIndestructible, 14, 6)
		self.aniadirElemento(bloqueIndestructible, 14, 8)
		self.aniadirElemento(bloqueIndestructible, 14, 10)
		self.aniadirElemento(bloqueIndestructible, 16, 2)
		self.aniadirElemento(bloqueIndestructible, 16, 4)
		self.aniadirElemento(bloqueIndestructible, 16, 6)
		self.aniadirElemento(bloqueIndestructible, 16, 8)
		self.aniadirElemento(bloqueIndestructible, 16, 10)
		self.aniadirElemento(bloqueIndestructible, 18, 2)
		self.aniadirElemento(bloqueIndestructible, 18, 4)
		self.aniadirElemento(bloqueIndestructible, 18, 6)
		self.aniadirElemento(bloqueIndestructible, 18, 8)
		self.aniadirElemento(bloqueIndestructible, 18, 10)
	}
	
	method generar(){
		self.construir()
		self.crear()
		/*player1.generar()
		player2.generar()*/
	}
	
}

object mapa2 inherits Mapa{
	
	method construir() {
		//Para crear lineas! (en donde, inicio, fin)
		self.aniadirLineaHorizontal(bloqueIndestructible, 0, 0, 20)
		self.aniadirLineaHorizontal(bloqueIndestructible, 12, 0, 20)
		self.aniadirLineaVertical(bloqueIndestructible, 0, 0, 12)
		//self.aniadirLineaVertical(bloqueIndestructible, 20, 0, 12)
		
		//Se puede aniadirElementos, (tipo,x,y) los elementos pueden ser power ups o bloques
		//self.aniadirElemento(bloqueIndestructible, (0.randomUpTo(18)).roundUp(), (0.randomUpTo(13)).roundUp())
		//self.aniadirElemento(bloqueIndestructible, (0.randomUpTo(18)).roundUp(), (0.randomUpTo(13)).roundUp())
		//self.aniadirElemento(bloqueIndestructible, (0.randomUpTo(18)).roundUp(), (0.randomUpTo(13)).roundUp())
		
		//self.aniadirElemento(bloqueDestructible, (0.randomUpTo(18)).roundUp(), (0.randomUpTo(13)).roundUp())
		//self.aniadirElemento(bloqueDestructible, (0.randomUpTo(18)).roundUp(), (0.randomUpTo(13)).roundUp())
		//self.aniadirElemento(bloqueDestructible, (0.randomUpTo(18)).roundUp(), (0.randomUpTo(13)).roundUp())
		
		
		self.aniadirElemento(powerUpBombaFuerte, 5, 7)
		self.aniadirElemento(powerUpAumentarVelocidad, 7, 11)
		self.aniadirElemento(powerUpEscudo, 11, 7)
		self.aniadirElemento(powerUpMasBombas, 13, 1)
		self.aniadirElemento(powerUpMasBombas, 13, 3)
		self.aniadirElemento(powerUpMasBombas, 11, 5)
		self.aniadirElemento(powerUpMasBombas, 11, 7)
		
		
		//Esto hace el grid del mapa 1. A lo mejor se puede acortar.
		self.aniadirElemento(bloqueIndestructible, 2,2)
		self.aniadirElemento(bloqueIndestructible, 2, 4)
		self.aniadirElemento(bloqueIndestructible, 2, 6)
		self.aniadirElemento(bloqueIndestructible, 2, 8)

	}
	
	method generar(){
		self.construir()
		self.crear()
		/*player1.generar()
		player2.generar()*/
	}
	
}