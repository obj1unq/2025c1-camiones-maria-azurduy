import camion.*

object knightRider {
	method peso() { return 500 }

	method nivelPeligrosidad() { return 10 }

	method esDePeligrosidadMayorA(nivel) {
		return self.nivelPeligrosidad() > nivel
	}
	method esMasPeligrosoQue(cosa){
		return self.nivelPeligrosidad() > cosa.nivelPeligrosidad()
	}

}

object bumblebee {
	var property transformacion = robot

	method peso() { return 800 }

	method esDePeligrosidadMayorA(nivel) {
		return self.nivelPeligrosidad() > nivel
	}
	method esMasPeligrosoQue(cosa){
		return self.nivelPeligrosidad() > cosa.nivelPeligrosidad()
	}

	method nivelPeligrosidad() {
		return transformacion.peligrosidad()
	//	if (self.estaTransformado()) {15} else {30}

	}
}

object robot {
	var property nivelPeligrosidadb =  30 
}
object auto {
	var property nivelPeligrosidadb =  15
}

object paqueteDeLadrillos {

	var property cantidadDeLadrillos = 3

	method peso(){
		return cantidadDeLadrillos * 2
	}

	method nivelPeligrosidad() {
		return 2
	}

	method esDePeligrosidadMayorA(nivel) {
		return self.nivelPeligrosidad() > nivel
	}
	method esMasPeligrosoQue(cosa){
		return self.nivelPeligrosidad() > cosa.nivelPeligrosidad()
	}	
}

object arenaAGranel{
	
	var property peso = 50

	method nivelPeligrosidad() {
		return 1
	}

	method esDePeligrosidadMayorA(nivel) {
		return self.nivelPeligrosidad() > nivel
	}
	method esMasPeligrosoQue(cosa){
		return self.nivelPeligrosidad() > cosa.nivelPeligrosidad()
	}	
}

object bateriaAntiaerea {

	

	method esDePeligrosidadMayorA(nivel) {
		return self.nivelPeligrosidad() > nivel
	}
	method esMasPeligrosoQue(cosa){
		return self.nivelPeligrosidad() > cosa.nivelPeligrosidad()
	}	
} 


