extends Node

var custom_variables = {}

##You first need to create a `global.gd` script for storing variables.  
#Inside your `global.gd` add a dictionary variable called `custom_variables`.  
#`var custom_variables = {}`.  
#Then go to: `Project`>`Project Settings...`>`AutoLoad` and add the script `global.gd` with name `global` and **enable** the `Singleton` option.

#Now you can add the node `addons/dialogs/Dialog.tscn` to your scenes and use it on your projects.

#You can set the dialog script (.json) on the inspector variable "External File" or by setting the dialog content by changing the variable `dialog_script` of the node.
