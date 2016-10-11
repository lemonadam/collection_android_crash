#!/bin/bash
#eg:sh crash.sh joke
#eg:sh crash.sh live
apkname=$1
log=`adb logcat  *:E > log.log` &
sleep 2
kill -9 `ps -a | grep logcat | grep -v grep | awk '{print $1}'`
pid=`more log.log | grep $apkname | grep Process| awk -F'('  '{print $2}'|awk -F')' ' END {print $1}'`
#pid=`more log.log | grep $apkname | awk -F'('  '{print $2}'|awk -F')' 'END { print $1}'`
echo pid----------------：$pid
if [ -z $pid ]
    	then
    	echo -----------------------------------------crash log ---------------------------------------
    	echo ------------------------------------------------------------------------------------------ 
    	echo ------------------------------------------------------------------------------------------ 
    	echo ------------------------------------------------------------------------------------------ 
    	echo -----------------------------------------sorry , none-------------------------------------
    	echo ------------------------------------------------------------------------------------------ 
    	echo ------------------------------------------------------------------------------------------ 
    	echo ------------------------------------------------------------------------------------------ 
    	echo ------------------------------------------------------------------------------------------
		else
		more log.log  | grep $pid > crash_log.log 
		echo -----------------------------------------crash log ---------------------------------------
		echo -----------------------------------------    start    ------------------------------------
		more crash_log.log
		echo -----------------------------------------    end    --------------------------------------
		fi
#rm -rf crash_log.log
#rm -rf log.log
