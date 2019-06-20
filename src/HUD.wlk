import wollok.game.*
import powerUps.*
import players.*

class HudJugador{
	
	var corazones = []
	
	method generar(jugador,y){ game.onTick(500, "hudJugador1", { self.mostrarHUD(jugador,y) }
	) }
	
	method mostrarHUD(jugador,y){
		
		self.mostrarCorazones(jugador,y)
		self.mostrarPowerUPs(jugador,y)
	}
	
	method mostrarCorazones(jugador,y){
		corazones.forEach({ corazon => game.removeVisual(corazon) })
		corazones.clear()
		(1..jugador.vidas()).forEach{ 
			n => corazones.add((powerUpAgregarVida.construir(self.calcularDondeColocarCorazon(n,y))))
		}
		corazones.forEach({ corazon => corazon.generar() })
	}
	
	method calcularDondeColocarCorazon(n,y) = game.at( 21+(n-1)%3,((33-n)/3)-y) 
	
	method mostrarPowerUPs(jugador,y){
		if (jugador.bombaSticky()) self.mostrarBombaSticky(y)
		if (jugador.bombaRemota()) self.mostrarBombaRemota(y)
	}
	
	method mostrarBombaSticky(y){
		(powerUpBombaSticky.construir(game.at(21,8-y))).generar()
	}
	
		method mostrarBombaRemota(y){
		(powerUpBombaRemota.construir(game.at(22,8-y))).generar()
	}	
}


