#!/bin/bash
#chase morgan cmm5b7 

x=0
y=0
ip=0
while [ $y -le 1 ]
do
	echo "Enter an ip adress on the network or scan for ip adresses (enter S to scan) "


	read ip

	case $ip in
		S)
			nmap -sn 192.168.0.*
			;;
		192.168.*)
			((y++))
                        break
                        ;;
		*)
			echo " invald option pick again "
			;;
		esac
done
			

	
while [ $x -le 1 ]
do
	pick=0
	echo "Device info: "
	nslookup $ip | head -n 1

	echo "================"
	echo "	 Main Menu    "
	echo "================"
	echo "1. Check port data"
        echo "2. Check OS info of device"
	echo "3. Spoofed Scans"
	echo "4. Change Device"
	echo "5. Save Network Scan As File"
	echo "6. Exit"
	echo "Enter your choice [ 1 - 6 ]"	
	read pick 

	case $pick in 
		1)
			one=0
			echo "||  Port INFO  ||"
			echo "1. Open Ports"
			echo "2. TCP Null Scan"
			echo "3. TCP Fin Scan"
			echo "4. TCP Xman Scan"
			echo "5. Firewall Detection"
			echo "Enter your choice [ 1 - 5 ]"
			read one
			case $one in
				1)
					sudo nmap -Pn --open $ip
					;;
				2)
					sudo nmap -Pn -sN $ip
					;;
				3)
					sudo nmap -Pn -sF $ip
					;;
				4)
					sudo nmap -Pn -sX $ip
					;;
				5)
					sudo nmap -Pn -sA $ip
					;;
				*)
					echo " Invalid option (must be 1 - 5)"
					;;
				esac
			;;
		2)
			sudo nmap -Pn -O $ip
			;;
		3)
			three=0
                        echo "||  Spoofed Scans  ||"
                        echo "1. Decoy Scan"
                        echo "2. Idle/Zombie scan"
			echo "Enter your choice [ 1 - 2 ]"
			read three
                        case $three in
                                1)
                                      sudo nmap -Pn -sS $ip -D 8.8.8.8


                                        ;;
                                2)
                                        sudo nmap -Pn -sI 8.8.8.8 -p80,21,22,23,25,53,110,135,137,138,139,1433,1434,443 $ip
                                        ;;

				*)
					echo " Invalid option (must be 1 - 2)"						;;
				esac

			;;
		4)
			 four=0
			 nmap -sn 192.168.0.*
			 echo "Enter a New IP to scan"
			 read four
			 ip=$four
			 ;;
		5)
			five=0
                        echo "Enter Name of file: "
			read five
			touch $five.txt
			nmap -oN $five.txt 192.162.0.*
			;;
		6)
			break;
			;;
		*)
			echo " Enter a number 1-6 "
			;;
	esac
done 


	
