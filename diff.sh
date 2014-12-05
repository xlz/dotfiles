#!/bin/sh
diff -rup etc /etc | grep -v ^Only.in./
diff -rup home $HOME | grep -v ^Only.in./
