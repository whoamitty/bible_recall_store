#! /usr/bin/env bash

repo=~/git-source/me+/store+/bible_recall_store.git
cd "$repo" || exit


get_book(){
  line="$1"
  echo "$line" | cut -f 1 -d" " | cut -f 2 -d"_"

}

get_folder_book(){
  line="$1"
  echo "$line" | cut -f 1 -d" "

}

get_number_of_chapter(){
  line="$1"
  echo "$line" | cut -f 2 -d" "


}


book_m3u_generator(){
  
  book="$1"
  shortcut_testament="$2"
  folder_testament="$3"
  folder_book="$4"
  number_of_chapter="$5"
  

  path_book="${folder_testament}/${folder_book}"
  mkdir -p "$path_book"

   for ((i = 1 ; i <= "10#$number_of_chapter" ; i++ ))  ;do
    width="${#number_of_chapter}"
    printf -v complet_i "%0${width}d" "$i"
    echo "https://audio.emcitv.com/audio/bible/fr/audio-bible/$shortcut_testament/$book/$book-${complet_i}.mp3"   >  "${path_book}/${complet_i}.m3u"   ;done
  }


read_Setup_and_write_DB(){
  setup_testament="$1"
  
  case "$setup_testament"  in
    setup_datas/list_formated_old)
      shortcut_testament=AT 
      folder_testament="old_testament" ;; 
    setup_datas/list_formated_new)
      shortcut_testament=NT
      folder_testament="new_testament" ;;
  esac


  while read -r line ; do
    [ -z "$line" ] && continue

    book=$(get_book "$line" )
    folder_book=$(get_folder_book "$line" ) 
    number_of_chapter=$(get_number_of_chapter "$line" )
    
    book_m3u_generator "$book" "$shortcut_testament" "$folder_testament"  "$folder_book" "$number_of_chapter" ;
    done < "$setup_testament"
  
  }



main(){
  setup_testament1=setup_datas/list_formated_old
  setup_testament2=setup_datas/list_formated_new
  
  echo write from "$setup_testament1"
  read_Setup_and_write_DB "$setup_testament1"

  echo write from "$setup_testament2"
  read_Setup_and_write_DB "$setup_testament2"
  
  echo -e "succesfully finish !!\n"
  date
  }

main
