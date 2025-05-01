/** First Wollok example */
import wollok.game.*

object lionel {
	var property position = game.at(3, 5)
	var property camiseta = camisetaTitular
	
	method image() = camiseta.image()
	
	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y())
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y())
	}
	
	method cambiarCamiseta() {
		self.validarPosicion()
		camiseta.cambiar(self)
	}
	
	method validarPosicion() {
		if (not self.posicionParaCambiarCamiseta()) self.error(
				"No esta en el borde izquierdo"
			)
	}
	
	method posicionParaCambiarCamiseta() = self.position().x() == 0
}

object pelota {
	const property image = "pelota.png"
	var property position = game.at(5, 5)
}

object camisetaSuplente {
	method image() = "lionel-suplente.png"
	
	method cambiar(personaje) {
		personaje.camiseta(camisetaTitular)
	}
}

object camisetaTitular {
	method image() = "lionel-titular.png"
	
	method cambiar(personaje) {
		personaje.camiseta(camisetaSuplente)
	}
}