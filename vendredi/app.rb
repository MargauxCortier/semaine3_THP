require 'bundler'
Bundler.require
$:.unshift File.expand_path("./../lib", __FILE__)
require 'router'

# En faisant ceci, tu dis à Ruby "hey bro !
# Tous les fichiers dans le dossier ./../lib tu les ajoute au PATH
# normal et comme ça j'aurais juste à faire require "classe" pour les appeler. Ok ?
# Ainsi, pour appeler ton routeur, tu devras faire juste require "router". Et pour appeler les autres classes aussi. Sympa, non ?
Router.new.perform
