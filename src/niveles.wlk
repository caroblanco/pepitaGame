import pepita.*
import comidas.*
import extras.*
import wollok.game.*


object tutorial1 {

	method iniciar() {
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisualCharacter(pepita)
}
}

object tutorial2 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()
		config.configurarMovimientos()
	}

}

object tutorial3 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()
	}
}

object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ 
			if (not pepita.estaCansada())
				pepita.irA(pepita.position().left(1))
		})
		keyboard.right().onPressDo({ 
			if (not pepita.estaCansada())
				pepita.irA(pepita.position().right(1))
		})
		keyboard.up().onPressDo({ 
			if (not pepita.estaCansada())
				pepita.irA(pepita.position().up(1))
		})
		keyboard.down().onPressDo({ 
			if (not pepita.estaCansada())
				pepita.irA(pepita.position().down(1))
		})
		
		keyboard.c().onPressDo({pepita.come(game.uniqueCollider(pepita))}) //me devuelve contra lo que choco pepita
	}

	method configurarColisiones() {
		game.onCollideDo(pepita, { algo => algo.teEncontro(pepita)})
	}
	
	method configurarMovimientos(){
		game.onTick(800, "gravedad", {pepita.gravedad()})
	}
}

