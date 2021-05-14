#!bin/bash
rename_file_min()
{
	if [ ! -e "$SRC" ]; then
			echo "Erreur en [$SRC]: Fichier/répertoire introuvable"
	elif [ -f "$SRC" ];then	
    DST=`dirname "${SRC}"`/`basename "${SRC}" | tr '[A-Z]' '[a-z]'`
    if [ "${SRC}" != "${DST}" ]
    then
        [ ! -e "${DST}" ] && mv -T "${SRC}" "${DST}" || echo "${SRC} was not renamed"
    fi
    elif [ -d "$SRC" ];then	
    DST=`dirname "${SRC}"`/`basename "${SRC}" | tr '[A-Z]' '[a-z]'`
    if [ "${SRC}" != "${DST}" ]
    then
        [ ! -e "${DST}" ] && mv "${SRC}" "${DST}" || echo "${SRC} was not renamed"
    fi
	fi
}

remove_space()
{
		if [ ! -e $SRC ];then
			echo "Erreur en [$SRC]: Fichier/répertoire introuvable"
		else
    name="$SRC"
	name_new=""
	char=""
			N=${#SRC}
			i=0
			for i in $(seq 0 $N)
			do
				if [ ! ${SRC:$i:1} = ' ' ];then
				char="${SRC:$i:1}"
				name_new+=$char
			fi
			done	
			if [ -d "$SRC" ];then
			DST=`dirname "${SRC}"`/"${name_new}" 
			mv "$SRC" "$DST" 
			elif [ -f "$SRC" ];then
				DST=`dirname "${SRC}"`/"${name_new}" 
			mv -T "$SRC" "$DST" 
		fi
	fi		
}
remove_extention()
{
	if [! -e $SRC ];then
	echo "Erreur en [$SRC]: fichier introuvable"
	elif [ -f $SRC ];then
	DST=`dirname "${SRC}"`/`basename "${SRC}" | cut -f 1 -d '.'`
	if [ "${SRC}" != "${DST}" ]
    then
        [ ! -e "${DST}" ] && mv -T "${SRC}" "${DST}" || echo "${SRC} was not renamed"
   	fi
	elif [ -d $SRC ];then
	echo "insert a file not a folder"
	fi
}
rename_file_maj ()
{
	if [ ! -e "$SRC" ]; then
			echo "Erreur en [$SRC]: Fichier/répertoire introuvable"
	elif [ -f "$SRC" ];then	
    DST=`dirname "${SRC}"`/`basename "${SRC}" | tr '[a-z]' '[A-Z]'`
    if [ "${SRC}" != "${DST}" ]
    then
        [ ! -e "${DST}" ] && mv -T "${SRC}" "${DST}" || echo "${SRC} was not renamed"
    fi
    elif [ -d "$SRC" ];then	
    DST=`dirname "${SRC}"`/`basename "${SRC}" | tr '[a-z]' '[A-Z]'`
    if [ "${SRC}" != "${DST}" ]
    then
        [ ! -e "${DST}" ] && mv "${SRC}" "${DST}" || echo "${SRC} was not renamed"
    fi
	fi
}
add_d ()
{
	if [ ! -e "$SRC" ]; then
			echo "Erreur en [$SRC]: Reprtoire non existant"
	elif [ -f "$SRC" ];then	
    echo "Erreur en [$SRC]: Entrez un Repertoire valide"
    elif [ -d "$SRC" ];then	
    DST=`dirname "${SRC}"`/`basename "${SRC}"`"_d"
    if [ "${SRC}" != "${DST}" ]
    then
        [ ! -e "${DST}" ] && mv "${SRC}" "${DST}" || echo "${SRC} n'a pas été rennomé"
    fi
	fi
}
add_extension()
{
	if [ ! -e "$1" ]; then
			echo "Erreur en [$1]: Fichier non existant"
	elif [ -d "$1" ];then	
    echo "Erreur en [$1]: Entrez un Fichier valide"
    elif [ -f "$1" ];then	
    DST=`dirname "${1}"`/`basename "${1}"`".""$2"
    if [ "${2}" != "${DST}" ]
    then
        [ ! -e "${DST}" ] && mv -T "${1}" "${DST}" || echo "${1} n'a pas été rennomé"
    fi
	fi
}

if [ ! "$#" -gt 2 ];then
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
		echo "False Argument"
	esac			
fi			
