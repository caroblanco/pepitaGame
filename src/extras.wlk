import pepita.*
import wollok.game.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"

	method teEncontro(ave) {
		game.say(ave,"GANE PERRI")
		game.onTick(2000,"GANAR",{game.stop()})
	}
}

object silvestre { 

	method image() = "silvestre.png"

	method position() = game.at(pepita.position().x().max(3 ),0)
	
	method teEncontro(ave){
		game.say(ave,"LPM PERDI")
		game.onTick(2000,"PERDER",{game.stop()})
	}

}
/* 
object perseguirPepitaSuelo{
	
	var posicion = game.at(3, 0)

	method posicion() = posicion

	method nuevaPosicion() {
		// calculo coordenadas x segun posicion de pepita 
		const x = 3.min(pepita.position().x())
		// cambio a nueva posicion, siempre en el suelo
		posicion = game.at(x, 0)
	}
}*/


