#!/bin/sh

#
# Shell script to download and install a Scala language specification
# for the Gedit text editor.
#
# (c) Sarah Mount 26 Jan 2012.
# updated by Felix Dietze 05 Jul 2012
#
echo "Installing Scala language spec and mime type..."

# Install the language spec
mkdir -p ~/.gnome2/gtksourceview-1.0/language-specs/
wget -q https://raw.github.com/scala/scala-dist/master/tool-support/src/gedit/scala.lang -O ~/.gnome2/gtksourceview-1.0/language-specs/scala.lang

# Add a MIME type for Scala files.
mkdir -p ~/.local/share/mime/packages
cat > ~/.local/share/mime/packages/Scala.xml << EOF 
<mime-info xmlns='http://www.freedesktop.org/standards/shared-mime-info'>
  <mime-type type="text/x-scala">
    <comment>Scala Source</comment>
    <!-- more translated comment elements -->
    <glob pattern="*.scala"/>
  </mime-type>
</mime-info>
EOF

update-mime-database ~/.local/share/mime




echo "Installing Scala gedit plugin..."

mkdir -p ~/.local/share/gedit/plugins
wget -q https://raw.github.com/snim2/gedit-scala-plugin/master/flyscala.plugin -O ~/.local/share/gedit/plugins/flyscala.plugin
wget -q https://raw.github.com/snim2/gedit-scala-plugin/master/flyscala.gedit-plugin -O ~/.local/share/gedit/plugins/flyscala.gedit-plugin
wget -q https://raw.github.com/snim2/gedit-scala-plugin/master/flyscala.py -O ~/.local/share/gedit/plugins/flyscala.py

# Installing gsettings scheme for the flyscala plugin
wget -q https://raw.github.com/snim2/gedit-scala-plugin/master/org.gnome.gedit.plugins.flyscala.gschema.xml -O org.gnome.gedit.plugins.flyscala.gschema.xml
gksudo mv org.gnome.gedit.plugins.flyscala.gschema.xml /usr/share/glib-2.0/schemas/
gksudo glib-compile-schemas /usr/share/glib-2.0/schemas/

echo "done."
echo "Please start gedit and activate the Scala On The Fly plugin from the Edit->Preferences dialog"
