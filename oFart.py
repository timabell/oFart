#!/usr/bin/env python

import sys
try:
	import pygtk
	pygtk.require("2.0")
except:
	pass
try:
	import gtk
	import gtk.glade
except:
	sys.exit(1)

class OFart:
	def __init__(self):
		#load glade file
		self.gladefile="ofart.glade"
		self.wTree = gtk.glade.XML(self.gladefile,  "mainWindow")
		#set up main window
		self.window = self.wTree.get_widget("mainWindow")
		if (self.window):
			self.window.connect("destroy",  gtk.main_quit)
		eventDic = { "on_image1_button_press_event" :  self.fart }
		self.wTree.signal_autoconnect(eventDic)

	def fart(self):
		#todo
		print "parp"

if __name__ == "__main__":
	oFart = OFart()
	gtk.main()