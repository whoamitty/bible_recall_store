# not finished

#/time/book/chapter #setupdata
#https://stackoverflow.com/a/42696047



find -maxdepth 1 $time_folder_path > book_list ;
rev list_old  | cut -f 1 -d" "  | rev >list_length ;
while IFS= read list_length  && IFS= read book_list ; do
  printf ${folder##*_} > $path 

done < list_length 3< book_list



# à tester https://stackoverflow.com/a/42695194
