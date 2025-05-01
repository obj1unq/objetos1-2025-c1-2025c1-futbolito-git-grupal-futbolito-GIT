/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	var property camiseta = "lionel-titular"

	method image() {
		return camiseta + ".png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method patear () {
		if(position == pelota.position()) {
			pelota.position(game.at((pelota.position().x() + 3).min(game.width() - 1), pelota.position().y()))
		}
	}

	method estaEnUnaEsquina() {
		return (self.position().x() == 0 || self.position().x() == 14 || self.position().y() == 0 || self.position().y() == 10)
	}


	method validarCambioCamiseta() {
		if (not self.estaEnUnaEsquina()) { self.error("No te podes sacar la camiseta en el medio de la cancha! anda a una")}
	}

	method cambioCamiseta() {
		self.validarCambioCamiseta()
		if (camiseta == "lionel-titular") {camiseta = "lionel-suplente"}
		else camiseta = "lionel-titular"
	}
	
}




object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
}
