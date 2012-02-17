#!/bin/sh

#
# Shell script to download and install a Scala language specification
# for the Gedit text editor.
#
# (c) Sarah Mount 26 Jan 2012.
#

# Create a directory for the language spec.
mkdir ~/.gnome2/gtksourceview-1.0/
mkdir ~/.gnome2/gtksourceview-1.0/language-specs/

cd ~/.gnome2/gtksourceview-1.0/language-specs/

# Download the spec.
wget http://lampsvn.epfl.ch/trac/scala/export/26099/scala-tool-support/trunk/src/gedit/scala.lang

# Add a MIME type for Scala files.
mkdir ~/.local/share/mime/
mkdir ~/.local/share/mime/packages

cat > Scala.xml << EOF 
<mime-info xmlns='http://www.freedesktop.org/standards/shared-mime-info'>
  <mime-type type="text/x-scala">
    <comment>Scala Source</comment>
    <!-- more translated comment elements -->
    <glob pattern="*.scala"/>
  </mime-type>
</mime-info>
EOF

# Update MIME database.
cd ~/.local/share/
update-mime-database mime

# Done.
echo "Scala language specification for GEdit has been installed."
