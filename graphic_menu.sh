#!bin/bash
rename_file_min()
{
	if [ ! -e "$SRC" ]; then
			echo -e "\e[1;31m Erreur en [$SRC]: \e[0m"
			echo "Reprtoire\Fichier non existant"
	elif [ -f "$SRC" ];then	
    DST=`dirname "${SRC}"`/`basename "${SRC}" | tr '[A-Z]' '[a-z]'`
    if [ "${SRC}" != "${DST}" ]
    then
        [ ! -e "${DST}" ] && mv -T "${SRC}" "${DST}" || echo -e "\e[1;33m $SRC was not renamed \e[0m"
    fi
    elif [ -d "$SRC" ];then	
    DST=`dirname "${SRC}"`/`basename "${SRC}" | tr '[A-Z]' '[a-z]'`
    if [ "${SRC}" != "${DST}" ]
    then
        [ ! -e "${DST}" ] && mv "${SRC}" "${DST}" || echo -e "\e[1;33m $SRC was not renamed \e[0m" 
    fi
	fi
}

remove_space()
{
		if [ ! -e "$SRC" ];then
			echo -e "\e[1;31m Erreur en [$SRC]: \e[0m"
			echo "Reprtoire\Fichier non existant"
		else
    name=`basename "${SRC}"`
	name_new=""
	char=""
			N=${#SRC}
			i=0
			for i in $(seq 0 $N)
			do
				if [ ! ${name:$i:1} = ' ' ];then
				char="${name:$i:1}"
				name_new+=$char
			fi
			done	
			if [ -d "$SRC" ];then
			DST=`dirname "${SRC}"`/"${name_new}"
			mv "$SRC" "$DST"  || echo -e "\e[1;33m $SRC was not renamed \e[0m"
			elif [ -f "$SRC" ];then
				DST=`dirname "${SRC}"`/"${name_new}" 
			mv -T "$SRC" "$DST" || echo -e "\e[1;33m $SRC was not renamed \e[0m"
		fi
	fi		
}
remove_extention()
{
	if [! -e $SRC ];then
	echo -e "\e[1;31m Erreur en [$SRC]: \e[0m"
			echo "Fichier non existant"
	elif [ -f $SRC ];then
	DST=`dirname "${SRC}"`/`basename "${SRC}" | cut -f 1 -d '.'`
	if [ "${SRC}" != "${DST}" ]
    then
        [ ! -e "${DST}" ] && mv -T "${SRC}" "${DST}" || echo -e "\e[1;33m $SRC was not renamed \e[0m"
   	fi
	elif [ -d $SRC ];then
	echo echo -e "\e[1;31m Insert a File not a folder \e[0m"
	fi
}
rename_file_maj ()
{
	if [ ! -e "$SRC" ]; then
		echo -e "\e[1;31m Erreur en [$SRC]: \e[0m"
			echo " Fichier/répertoire introuvable"
	elif [ -f "$SRC" ];then	
    DST=`dirname "${SRC}"`/`basename "${SRC}" | tr '[a-z]' '[A-Z]'`
    if [ "${SRC}" != "${DST}" ]
    then
        [ ! -e "${DST}" ] && mv -T "${SRC}" "${DST}" || echo -e "\e[1;33m $SRC was not renamed \e[0m"
    fi
    elif [ -d "$SRC" ];then	
    DST=`dirname "${SRC}"`/`basename "${SRC}" | tr '[a-z]' '[A-Z]'`
    if [ "${SRC}" != "${DST}" ]
    then
        [ ! -e "${DST}" ] && mv "${SRC}" "${DST}" || echo -e "\e[1;33m $SRC was not renamed \e[0m"
    fi
	fi
}
add_d ()
{
	if [ ! -e "$SRC" ]; then
		echo -e "\e[1;31m Erreur en [$SRC]: \e[0m"
			echo "Reprtoire non existant"
	elif [ -f "$SRC" ];then	
    echo "Erreur en [$SRC]: Entrez un Repertoire valide"
    elif [ -d "$SRC" ];then	
    DST=`dirname "${SRC}"`/`basename "${SRC}"`"_d"
    if [ "${SRC}" != "${DST}" ]
    then
        [ ! -e "${DST}" ] && mv "${SRC}" "${DST}" || echo -e "\e[1;33m $SRC was not renamed \e[0m"
    fi
	fi
}
add_extension()
{
	if [ ! -e "$1" ]; then
			echo -e "\e[1;31m Erreur en [$1]: Fichier non existant \e[0m"
	elif [ -d "$1" ];then	
    echo "Erreur en [$1]: Entrez un Fichier valide"
    elif [ -f "$1" ];then	
    DST=`dirname "${1}"`/`basename "${1}"`".""$2"
    if [ "${2}" != "${DST}" ]
    then
        [ ! -e "${DST}" ] && mv -T "${1}" "${DST}" || echo -e "\e[1;33m $1 was not renamed \e[0m"
    fi
	fi
}

menu ()
{
     yad --list \
                 --title="M E N U" \
                 --center \
                 --button=Acepter:0  \
                 --button=Cancel:1 \
                 --text="Select a command :" \
                 --buttonlist \
                 --column="" \
                 --button="-t":2 \
                 --button="-T":3 \
                 --button="-n":4 \
                 --button="-N":5 \
                 --button="-d":6 \
                 --button="-s":7 \
                 --button="-v":8 \
                 --button="-h":9 \
                 --button="-m":10
}

 insert_input_all ()
{
	a=$(yad --form --width 300 --entry --title="Dialog"\
              --button=Acepter:0  \
             --button=Cancel:1 \
              --text="Inserer votre commande :" \
               --buttonlist \
                 --column="" \
                 --text-info="Commande" 
                 )

  

}
 
menu
ans=$?
if [ $ans -eq 2 ];then 
     insert_input_all $a
    ans=$?
    if [ "$ans" = 0 ];then
    N=${#a}
		for i in $(seq 0 $N)
			do
				if [ ! ${a:$i:1} = ',' ];then
				char="${a:$i:1}"
				name_new+=$char
			else
				F+=("$name_new")
				name_new=""
			fi
		done	
		for SRC in "${F[@]}"
		do
			rename_file_min SRC
		done
	fi       
elif [ $ans -eq 3 ];then
 	insert_input_all $a
    ans=$?
    if [ "$ans" = 0 ];then
    N=${#a}
		for i in $(seq 0 $N)
			do
				if [ ! ${a:$i:1} = ',' ];then
				char="${a:$i:1}"
				name_new+=$char
			else
				F+=("$name_new")
				name_new=""
			fi
		done	
		for SRC in "${F[@]}"
		do
			rename_file_maj SRC
		done 
fi
elif [ $ans -eq 4 ]
then
    insert_input_all $a
    ans=$?
    if [ "$ans" = 0 ];then
    N=${#a}
		for i in $(seq 0 $N)
			do
				if [ ! ${a:$i:1} = ',' ];then
				char="${a:$i:1}"
				name_new+=$char
			else
				F+=("$name_new")
				name_new=""
			fi
		done	
		for SRC in "${F[@]}"
		do
			remove_extention SRC
		done 
fi
    
elif [ $ans -eq 5 ]
then
    insert_input_all $a
    ans=$?
    if [ "$ans" = 0 ];then
    N=${#a}
		for i in $(seq 0 $N)
			do
				if [ ! ${a:$i:1} = ',' ];then
				char="${a:$i:1}"
				name_new+=$char
			else
				F+=("$name_new")
				name_new=""
			fi
		done	
		for SRC in "${F[@]}"
		do
			remove_space SRC
		done 
fi
 
elif [ $ans -eq 6 ]
then
    insert_input_all $a
    ans=$?
    if [ "$ans" = 0 ];then
    N=${#a}
		for i in $(seq 0 $N)
			do
				if [ ! ${a:$i:1} = ',' ];then
				char="${a:$i:1}"
				name_new+=$char
			else
				F+=("$name_new")
				name_new=""
			fi
		done	
		for SRC in "${F[@]}"
		do
			add_d SRC
		done 
fi
      
elif [ $ans -eq 7 ]
then
	insert_input_all $a
    ans=$?
    N=${#a}
		for i in $(seq 0 $N)
			do
				if [ ! ${a:$i:1} = ' ' ];then
				char="${a:$i:1}"
				name_new+=$char
			else
				F+=("$name_new")
				name_new=""
			fi
		done	
 
elif [ $ans -eq 8 ]
then
    less info.txt
    
elif [ $ans -eq 9 ]
then
    less README.txt
 
elif [ $ans -eq 10 ]
then
    bash rename.sh -m
    
else
    echo "No result!"
 
fi
