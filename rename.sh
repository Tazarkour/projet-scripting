<<COMMENT1
#rename_file()
#{
	for SRC in "${@:2}"
	do
	if [ ! -e "$SRC" ]; then
			echo "fichier non existant"
	if [ -f "$SRC" ];then	
    DST=`dirname "${SRC}"`/`basename "${SRC}" | tr '[A-Z]' '[a-z]'`
    if [ "${SRC}" != "${DST}" ]
    then
        [ ! -e "${DST}" ] && mv "${SRC}" "${DST}" || echo "${SRC} was not renamed"
    fi
	done
#}
COMMENT1
<<<COMMENT2
#rename_file()
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
			DST=`dirname "${SRC}"`/"${name_new}" 
			mv "$SRC" "$DST" 
	done
#}
COMMENT2





