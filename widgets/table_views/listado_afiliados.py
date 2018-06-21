from PyQt5 import QtWidgets, QtGui

class ListadoAfiliadosContextM(QtWidgets.QTableView):

	def __init__(self, parent = None):
		super(ListadoAfiliadosContextM, self).__init__(parent)
		self.parent = parent

	def contextMenuEvent(self, event):
		self.menu = QtWidgets.QMenu(self)
		bajaAfiliado = QtWidgets.QAction('Baja de Afiliado', self)
		bajaAfiliado.triggered.connect(lambda: self.bajaAfiliado(event))
		self.menu.addAction(bajaAfiliado)
		# add other required actions
		if self.selectedIndexes():
			self.menu.popup(QtGui.QCursor.pos())

	def bajaAfiliado(self, event):
		print ("bajaAfiliado slot called")
		indexes = self.selectedIndexes()
		# get the selected row and column

		legajo = self.model().itemData(indexes[0])[0]

		afiliado = {
			"legajo" : legajo,
			"activo" : 0
		}

		self.model().bajaAfiliado(afiliado)
