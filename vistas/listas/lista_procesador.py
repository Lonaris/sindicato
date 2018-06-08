# Importamos el módulo sys que provee el acceso a funciones y objetos mantenidos por el intérprete.
import sys
# Importamos las herramientas de PyQT que vamos a utilizar
from PyQt5 import QtWidgets, uic, QtGui
# Importamos los elementos que se encuentran dentro del diseñador
from PyQt5.QtWidgets import QApplication, QMainWindow, QWidget, QPushButton
# Importamos el modulo uic necesario para levantar un archivo .ui
from PyQt5 import uic

from modelos.modelo_procesador import ModeloProcesador


#====================
#DEFINICION DE CLASES
#====================

#Creacion de la clase listaProveedores
class ListaProcesador(QtWidgets.QWidget):
	def __init__(self):
		QWidget.__init__(self)
		#Configuracion del archivo .ui
		self.listaProcesador = uic.loadUi("gui/listas/listaProcesador.ui", self)

		self.model = ModeloProcesador()

		self.listaProcesador.tbl_procesador.setModel(self.model)
		self.listaProcesador.btn_buscar_bet.clicked.connect(self.handleOpenBet)
		self.listaProcesador.btn_aplicar.clicked.connect(self.model.apllicarCambios)

	def handleOpenBet(self):

		path = QtWidgets.QFileDialog.getOpenFileName(
			self, 'Open File', "", "Todos los archivos (*.*)")

		try:
			with open(path[0], 'r') as bet_file:
				listaDebitos = []
				for line in bet_file:
					listaDebitos.append(self.processBetLine(line))
				self.model.verListaDebitosAProcesar(listaDebitos)
		except FileNotFoundError:
			return

	def processBetLine(self, line):
		# Variables: estado, fecha, id_afiliado , banco("p"), cbu_afiliado, importe, cuit_sindicato, "CUOTAS", orden_movimiento, codigo_error, "SIND T MUN MERLO"
		estado = self.formatEstado(line[:2])
		fecha = self.formatFecha(line[2:10])
		id_afiliado = self.formatLegajo(line[10:20])
		banco = self.formatBanco(line[38:39])
		cbu = line[39:61]
		importe = self.formatImporte(line[61:71])
		cuit = line[71:82]
		orden_movimiento = self.formatCerosIzquierda(line[92:107])
		codigo_error = line[144:147]
		empresa = line[147:164]

		return [estado, fecha, id_afiliado, banco, cbu, importe, cuit, orden_movimiento, codigo_error, "", empresa]

	def formatBanco(self, banco):
		if banco == "P":
			return "Provincia"

	def formatEstado(self, estado):
		if estado == "72":
			return "Procesado"
		elif estado == "55":
			return "Reversión"
		else:
			return "Error: codigo " + estado + " desconocido"

	def formatFecha(self, fecha):
		return fecha[:2] + "/" + fecha[2:4] + "/" + fecha[4:]

	def formatImporte(self, importe):
		return importe[:-2].strip("0") + "." + importe[-2:]

	def formatCerosIzquierda(self, linea):
		return linea.lstrip("0")

	def formatLegajo(self, legajo):
		return self.formatCerosIzquierda(legajo).zfill(8) # Se usa zfill por ser un string
