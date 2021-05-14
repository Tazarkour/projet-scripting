<<COMMENT1
rename_file_min()
{
	for SRC in "${@:2}"
	do
	if [ ! -e "$SRC" ]; then
			echo "fichier non existant"
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
	done
}
COMMENT1
<<COMMENT2
#remove_space()
#{
	for SRC in "${@:2}"
	do
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
			
	done
#}
COMMENT2
<<COMMENT3
#remove_extention()
#{
for SRC in "${@:2}"
	do
	if [! -e $SRC ];then
	echo "fichier introuvable"
	if [ -f $SRC ];then
	DST=`dirname "${SRC}"`/`basename "${SRC}" | cut -f 1 -d '.'`
	if [ "${SRC}" != "${DST}" ]
    then
        [ ! -e "${DST}" ] && mv -T "${SRC}" "${DST}" || echo "${SRC} was not renamed"
   	fi
	elif [ -d $SRC ];then
	echo "insert a file not a folder"
	fi
	done
#}
COMMENT3
<<COMMENT4
#rename_file_maj ()
#{
	for SRC in "${@:2}"
	do
	if [ ! -e "$SRC" ]; then
			echo "fichier non existant"
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
	done
#}
COMMENT4


