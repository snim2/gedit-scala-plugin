# Gedit3 plugin for Scala 

This plugin adds the following features to gedit:

  * Adds a new Scala menu with compile current document, compile all Scala files in a directory, run  and restart `fsc` options
  * Automatically compiles files in the background every time you save.
  * Highlights compiler errors and warnings in the source.
  * Captures compiler / scala output in the "bottom panel" of Gedit (you have to turn that on in the View menu). Clicking on an error or warning scrolls you up to the line number the problem occurred on.
  * SCALA_HOME can be configured from Edit->Preferences->Plugins->flyscala->Preferences on the top-level Gedit menu.

## Installing the plugin

Download and run the installer script on the command line like this:

    $ wget https://raw.github.com/snim2/gedit-scala-plugin/master/install.sh
    $ chmod +x install.sh
    $ ./install.sh

This will install both the official Scala syntax highlighter for Scala and the plugin.

---------------------------------------

© Sarah Mount, University of Wolverhampton, 2012.
