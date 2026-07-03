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
  
  width="$1"
  versions="${2}"
  book="$3"
  shortcut_testament="$4"
  folder_testament="$5"
  folder_book="$6"
  number_of_chapter="$7"
  



  for version in $versions; do

    path_book="${version}/${folder_testament}/${folder_book}"
    mkdir -p "$path_book"

   for ((i = 1 ; i <= "10#$number_of_chapter" ; i++ ))  ;do

    width_m3u="${#number_of_chapter}"
    printf -v complet_i_mp3 "%0${width}d" "$i"
    printf -v complet_i_m3u "%0${width_m3u}d" "$i"
    echo "https://audio.emcitv.com/audio/bible/$version/audio-bible/$shortcut_testament/$book/$book-${complet_i_mp3}.mp3"   >  "${path_book}/${complet_i_m3u}.m3u"   
    done

  done
  }


read_Setup_and_write_DB(){
  setup_testament="$1"
  
  case "$setup_testament"  in
    setup/setup_datas/list_formated_old )
      shortcut_testament=AT 
      folder_testament="1_old_testament" ;; 
     
    setup/setup_datas/list_formated_old_en )
      shortcut_testament=OT 
      folder_testament="1_old_testament" ;; 
      
    setup/setup_datas/list_formated_new | setup/setup_datas/list_formated_new_en )
      shortcut_testament=NT
      folder_testament="2_new_testament" ;;
  esac


  if [[ "$setup_testament" = *en ]]; then
    versions="en"
    width=3
  else
    versions="fr fr2"
    width=2
  fi


  while read -r line ; do
    [ -z "$line" ] && continue

    book=$(get_book "$line" )
    folder_book=$(get_folder_book "$line" ) 
    number_of_chapter=$(get_number_of_chapter "$line" )
  

    book_m3u_generator "$width" "$versions" "$book" "$shortcut_testament" "$folder_testament"  "$folder_book" "$number_of_chapter" ;

    done < "$setup_testament";
  
  }



main(){
  setup_testament1=setup/setup_datas/list_formated_old
  setup_testament2=setup/setup_datas/list_formated_new

  setup_testament1_en=setup/setup_datas/list_formated_old_en
  setup_testament2_en=setup/setup_datas/list_formated_new_en
  
  for setup_testament in "$setup_testament1" "$setup_testament2" "$setup_testament1_en" "$setup_testament2_en"; do
    echo write from "$setup_testament"
    read_Setup_and_write_DB "$setup_testament"
  done

  echo -e "succesfully finish !!\n"
  date
  }

main
