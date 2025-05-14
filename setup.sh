#cat list_old | tr '[:upper:]' '[:lower:]' | sed -E 's/([0-9]+) ([a-zA-Z]+)/\1-\2/g' |  sed 'y/éèêëï/eeeei/'  #> list_formated_old

#for (( i=00 ; i<= $number ; i++ )) ; do printf "%02d\n" $i ;done

voice_version=""

setup_a_playlist_file(){
  name=$1
  number_of_chapter=$2
  for (( i=1 ; i<= $number_of_chapter ; i++ )) ; do
    printf "https://audio.emcitv.com/audio/bible/fr${voice_version}/audio-bible/AT/${name}/${name}-%02d.mp3\n" $i

    ; done
}

parse_lists(){
  list_file=$1
  folder=$2
  cat $list_file | while read infos_chapter ; do
    #récupérer le nom dans le champ 1
    name="$(commande ...)"
    #récuppérer le nombre de chapitre par le champ 2  
    number_of_chapter="$(commande ...)"

    setup_a_playlist_file $name $number_of_chapter > $folder/$name ;done

  }


main(){
  parse_lists setup_datas/list_old old_testament
  parse_lists setup_datas/list_new new_testament
  }

main
