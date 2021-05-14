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


if [  "$#" -gt 1 ];then
	case $1 in
		-t) 
		for SRC in "${@:2}"
		do
			rename_file_min SRC
		done
		;;
		-T) 
		for SRC in "${@:2}"
		do
			rename_file_maj SRC
		done
		;;
		-n) 
		for SRC in "${@:2}"
		do
			remove_extention SRC
		done
		;;
		-N) 
		for SRC in "${@:2}"
		do
			remove_space SRC
		done
		;;
		-d) 
		for SRC in "${@:2}"
		do
			add_d SRC
		done
		;;
		-s) 
		add_extension $2 $3 
		;;
		*)
		echo -e "\e[1;31m Argument Faux \e[0m"
	esac	
elif [  "$#" = 1 ];then
	case $1 in
		-t)
		echo -e "\e[1;32mInserer les nom des fichiers/dossiers (Si le nom Contient des espaces inserer le entre '') : \e[0m"
		read a
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
		;;
		-T) 
		echo -e "\e[1;32mInserer les nom des fichiers/dossiers (Si le nom Contient des espaces inserer le entre '') : \e[0m"
		read a
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
		;;
		-n)
		echo -e "\e[1;32mInserer les nom des fichiers/dossiers (Si le nom Contient des espaces inserer le entre '') : \e[0m"
		read a
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
		;;
		-N) 
		echo -e "\e[1;32mInserer les nom des fichiers/dossiers (Si le nom Contient des espaces inserer le entre '') : \e[0m"
		read a
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
		;;
		-d)
		eecho -e "\e[1;32mInserer les nom des dossiers (Si le nom Contient des espaces inserer le entre '') : \e[0m"
		read a
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
		;;
		-s) 
		echo -e "\e[1;32mInserer le nom du fichier puis son extension : \e[0m"
		read SRC
		N=${#SRC}
		for i in $(seq 0 $N)
			do
				if [ ! ${SRC:$i:1} = ' ' ];then
				char="${SRC:$i:1}"
				name_new+=$char
			else
				F+=("$name_new")
				name_new=""
			fi
		done	
		add_extension ${F[0]} ${F[1]}
		;;
		*)
		echo -e "\e[1;32m Argument Faux \e[0m"
	esac			
fi		
