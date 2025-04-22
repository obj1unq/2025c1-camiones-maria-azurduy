import cosas.*

object camion {
	const property cosas = #{}
	const property tara = 1000
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}

	method todoPesoPar() {
		return cosas.all ({cosa => cosa.even()})
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
		return self.objetosQueSuperanPeligrosidad(cosa.nivel())
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return not self.excedidoDePeso() && self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty() 
	}



	


}

	
