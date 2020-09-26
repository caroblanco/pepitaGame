import extras.*
import wollok.game.*

object pepita {

	var energia = 100
	var property position = game.origin()

	method image() {
		return if (self.estaEnElNido()){
			"pepita-grande.png" 
		} else if (self.encontroASilvestre() || self.estaCansada()){
			"pepita-gris.png"
		}
		else{"pepita.png"}
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		if(not self.estaCansada()){
			self.vola(position.distance(nuevaPosicion))
			position = nuevaPosicion
		}else{
			game.say(self,"TENGO NONI, TWO MIMIR")
			game.onTick(2000,"PERDER",{game.stop()})
		}
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}
	
	method encontroASilvestre(){
		return position == silvestre.position()
	}
	
	method gravedad(){
		position = game.at(position.x() , 0.max(position.y() - 1))
	}
	
	
}


