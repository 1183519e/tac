#!/bin/sh

time openscad -q -o brett.stl     -D '$fn=240' -D 'render="brett"'     minitac.scad &
time openscad -q -o zier.stl      -D '$fn=240' -D 'render="zier"'      minitac.scad &
time openscad -q -o verbinder.stl -D '$fn=240' -D 'render="verbinder"' minitac.scad &
wait
