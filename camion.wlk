import cosas.*

object camion {
	const property cosas = #{residuosRadioactivos,knightRider}
	const property tara = 1000
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.seCarga()

	}

	method transportar(destino, camino) {
		validacion1
		validacion2
		validacion3
		destino.recibir(cosas)
		
	}

	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}

	method todoPesoPar() {
		return cosas.all ({cosa => cosa.peso() % 2 == 0 })
	}

	method hayAlgunoQuePesa(peso) {
		return cosas.any ({cosa => cosa.peso() == peso})
	}

	method elDeNivel(nivel) {
		return cosas.find ({cosa => cosa.nivelPeligrosidad() == nivel})
	}

	method pesoTotal() {
		return self.tara() + self.pesoTotalDeLaCarga()

	}

	method pesoTotalDeLaCarga() {
		return cosas.sum({cosa => cosa.peso()})
	}

	method excedidoDePeso() {
		return self.pesoTotal() > 2500
	}

	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({cosa => cosa.esDePeligrosidadMayorA(nivel) })
	}

	method objetosMasPeligrososQue(cosa) {
		return self.objetosQueSuperanPeligrosidad(cosa.nivelPeligrosidad())
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return not self.excedidoDePeso() && self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty() 
	}
	method tieneAlgoQuePesaEntre(min, max){
		return cosas.any({cosa => cosa.peso() >= min && cosa.peso() <= max})
	}

	method cosaMasPesada(){
		return cosas.map({cosa => cosa.peso() }).asSet().max()
	}
	
	method pesos(){
		return cosas.map({cosa => cosa.peso()}).asList()
	}

	method totalBultos(){
		return cosas.sum({cosa => cosa.cantidadDeBultos()})
	}

}

object almacen {
	const property cosas = []

	method recibir(cosas){
		cosas.addAll(cosas)
	}
}

object ruta9 {

	method nivelPeligrosidad() {
		return 11
	}

}

object caminosVecinales {
	var property maximoPesoPermitido = 300
}	
