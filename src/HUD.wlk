import wollok.game.*
import powerUps.*
import players.*

class HudJugador{
	
	var elementos = []
	
	method generar(jugador,y){ game.onTick(500, "hudJugador1", { self.mostrarHUD(jugador,y) }
	) }
	
	method mostrarHUD(jugador,y){
		self.limpiarPantalla()
		self.mostrarCorazones(jugador,y)
		self.mostrarPowerUPs(jugador,y)
		elementos.forEach({ corazon => corazon.generar() })
	}
	
	method mostrarCorazones(jugador,y){

		(1..jugador.vidas()).forEach{ 
			n => elementos.add((powerUpAgregarVida.construir(self.calcularDondeColocarCorazon(n,y))))
		}
	}
	
	method limpiarPantalla(){
		elementos.forEach({ corazon => game.removeVisual(corazon) })
		elementos.clear()
		
	}
	
	method calcularDondeColocarCorazon(n,y) = game.at( 21+(n-1)%3,((33-n)/3)-y) 
	
	method mostrarPowerUPs(jugador,y){
		if (jugador.bombaSticky()) self.mostrarBombaSticky(y)
		if (jugador.bombaRemota()) self.mostrarBombaRemota(y)
	}
	
	method mostrarBombaSticky(y){
		elementos.add((powerUpBombaSticky.construir(game.at(21,7-y))))
	}
	
		method mostrarBombaRemota(y){
		elementos.add((powerUpBombaRemota.construir(game.at(22,7-y))))
	}	
}


