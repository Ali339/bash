#!/bin/bash
case "${1}" in 
 start)
  echo "starting" ;;
 stop)
  echo "stopping" ;;
 reload)
  echo "reloading" ;;
 status|state)
  echo "stating" ;;
 *)
  echo "invalid option" 
  exit 1;;
esac
