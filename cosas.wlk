import camion.*

object knightRider {
	method peso() { return 500 }

	method nivelPeligrosidad() { return 10 }

	method seCarga() {

	}

	method esDePeligrosidadMayorA(nivel) {
		return self.nivelPeligrosidad() > nivel
	}
	method esMasPeligrosoQue(cosa){
		return self.nivelPeligrosidad() > cosa.nivelPeligrosidad()
	}

	method cantidadDeBultos(){
		return 1
	}

}

object bumblebee {
	var property transformacion = robot

	method peso() { return 800 }
	method seCarga() {
		transformacion = robot // si ya es un robot, de antemano, tengo que poner 
		
	}

	method cantidadDeBultos(){
		return 2
	}

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
	var property nivelPeligrosidad =  30 
}
object auto {
	var property nivelPeligrosidad =  15
}

object paqueteDeLadrillos {

	var property cantidadDeLadrillos = 3

	method peso(){
		return cantidadDeLadrillos * 2
	}

	method nivelPeligrosidad() {
		return 2
	}

	method seCarga() {
		cantidadDeLadrillos +=  12 // no puedo poner self.x porque devolveria algo (get) pero no actualizaria el valor(set)
	}

	method cantidadDeBultos(){
		if (cantidadDeLadrillos <= 100) {return 1} else if (cantidadDeLadrillos < 300) {return 2} else {return 3}
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

	method cantidadDeBultos(){
		return 1
	}

	method seCarga() {
		peso += 20
	}

	method esDePeligrosidadMayorA(nivel) {
		return self.nivelPeligrosidad() > nivel
	}
	method esMasPeligrosoQue(cosa){
		return self.nivelPeligrosidad() > cosa.nivelPeligrosidad()
	}	
}

object bateriaAntiaerea {

	var property tieneMisiles = false

	method peso() {
		if(tieneMisiles) {return 300} else {return 200}
		}
	

	method nivelPeligrosidad() {
		if (tieneMisiles) {
			return 100
		} else {
			return 0
		}
	}

	method seCarga() {
		tieneMisiles = true
	}

	method cantidadDeBultos(){
		if (tieneMisiles) {return 2} else {return 1}
	}

	method esDePeligrosidadMayorA(nivel) {
		return self.nivelPeligrosidad() > nivel
	}
	method esMasPeligrosoQue(cosa){
		return self.nivelPeligrosidad() > cosa.nivelPeligrosidad()
	}	
} 

object contenedorPortuario {
	const property cosas = [arenaAGranel]

	method peso() {
		return 100 + cosas.sum({cosa => cosa.peso()})
	}

	method cantidadDeBultos(){
		return 1 + cosas.size()
	}

	method seCarga() {
		cosas.forEach({cosa => cosa.reaccionarASerCargado()}) //hace que reaccione cada una de las cosas que tiene adentro. kind foreach/recursion
	}

	method nivelPeligrosidad() {
		return cosas.map({cosa => cosa.nivelPeligrosidad()}).maxIfEmpty({0})
	}

	method esDePeligrosidadMayorA(nivel) {
		return self.nivelPeligrosidad() > nivel
	}
	method esMasPeligrosoQue(cosa){
		return self.nivelPeligrosidad() > cosa.nivelPeligrosidad()
	}	

}

object residuosRadioactivos{
	var property peso = 23

	method nivelPeligrosidad() {
		return 200
	}
	method cantidadDeBultos(){
		return 1
	}

	method seCarga() {
		peso += 15
	}

	method esDePeligrosidadMayorA(nivel) {
		return self.nivelPeligrosidad() > nivel
	}

	method esMasPeligrosoQue(cosa){
		return self.nivelPeligrosidad() > cosa.nivelPeligrosidad()
	}	
}

object embalajeDeSeguridad {
	var property embalaje= arenaAGranel

	method peso() {
		return embalaje.peso()
	}

	method cantidadDeBultos(){
		return 2
	}

	method nivelPeligrosidad() {
		return embalaje.nivelPeligrosidad() / 2
	}

	method seCarga() {
	}

	method esDePeligrosidadMayorA(nivel) {
		return self.nivelPeligrosidad() > nivel
	}

	method esMasPeligrosoQue(cosa) {
		return self.nivelPeligrosidad() > cosa.nivelPeligrosidad()
	}

}

