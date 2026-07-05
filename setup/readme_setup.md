
#cat list_old | tr '[:upper:]' '[:lower:]' | sed -E 's/([0-9]+) ([a-zA-Z]+)/\1-\2/g' |  sed 'y/éèêëï/eeeei/'  #> list_formated_old


Folders in old_testament
```
index=1;   for i in genese exode levitique nombres deuteronome josue juges ruth 1-samuel 2-samuel 1-rois 2-rois 1-chroniques 2-chroniques esdras nehemie esther job psaumes proverbes ecclesiaste cantique-des-cantiques esaie jeremie lamentations ezechiel daniel osee joel amos abdias jonas michee nahum habakuk sophonie aggee zacharie malachie ; do printf "%02d_${i}" $index ; index=$((index+1)); done
```

Folders in new_testament
```
index=1;   for i in matthieu marc luc jean actes romains 1-corinthiens 2-corinthiens galates ephesiens philippiens colossiens 1-thessaloniciens 2-thessaloniciens 1-timothee 2-timothee tite philemon hebreux jacques 1-pierre 2-pierre 1-jean 2-jean 3-jean jude apocalypse ; do printf " %02d_${i}" $index ; index=$((index+1)); done
```
