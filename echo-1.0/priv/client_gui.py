#! /usr/bin/env python
# -*- coding: utf-8 -*-

## Client Gui script for echo server
# autor: interima
# email: interima.x2@gmail.com

import sys
from PyQt4 import QtCore, QtGui

## Main class for show widget and interact with user
class MainWindow(QtGui.QWidget):
	## Initialization function
	# create widgets
	# set layouts
	# connect signals and slots
	def __init__(self,*args):
		QtGui.QWidget.__init__(self,*args)

		self.middleLayout = QtGui.QHBoxLayout()
		self.mainLayout = QtGui.QVBoxLayout(self)

		self.dataField = QtGui.QLineEdit()
		self.textField = QtGui.QLineEdit()
		self.sendButton = QtGui.QPushButton("Send to server")
		self.exitButton = QtGui.QPushButton("Exit")

		self.middleLayout.addWidget(self.textField)
		self.middleLayout.addWidget(self.sendButton)
		self.mainLayout.addWidget(self.dataField)
		self.mainLayout.addLayout(self.middleLayout)
		self.mainLayout.addStretch()
		self.mainLayout.addWidget(self.exitButton)

		self.resize(320, 240)  
		self.setWindowTitle("Echo Client Gui") 
		self.setLayout(self.mainLayout)	

		self.connect(self.sendButton,QtCore.SIGNAL('clicked()'),self.writeToPort)
		self.connect(self.exitButton,QtCore.SIGNAL('clicked()'),self,QtCore.SLOT('close()'))

	## Read data from standart input
	# and set reading data to textField widget
	def readFromPort(self):
		PortIn = QtCore.QFile(self)
		PortIn.open(0,QtCore.QIODevice.ReadOnly)
		data = QtCore.QByteArray()
		data.append(PortIn.readLine())
		self.dataField.setText(QtCore.QString(data))

	## Write data to standart output
	# data is getting from dataField widget
	def writeToPort(self):
		PortOut = QtCore.QFile(self)
		PortOut.open(1,QtCore.QIODevice.WriteOnly)
		data = QtCore.QByteArray()
		data.append(self.textField.text().toAscii().data())
		data.append("\n")
		PortOut.writeData(data)
		PortOut.flush()
		self.readFromPort()

## Main function for script 
if __name__=="__main__":

	application = QtGui.QApplication(sys.argv)
	application.setStyle("plastique")

	window = MainWindow()
	window.show()

	sys.exit(application.exec_()) 
