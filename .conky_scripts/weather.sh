#!/bin/bash

weather --id=URKK | grep 'Temperature' | sed -e 's/^[^(]*$/&:/' -e 's/.*(\(.*\)/\1/' | sed -e 's/)//g'
