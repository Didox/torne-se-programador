for folder_or_file_svn in $(find "/Users/didox/projects/torne-se-programador/exercicios_em_shell/test_copy_files/folder_svn" -not -path '*/\.*'); do
  folder_or_file_git=$(echo $folder_or_file_svn | sed "s/folder_svn/folder_git/")
  if [ ! -d $folder_or_file_git ]; then
    printf '.'
    if [ ! -f $folder_or_file_git ]; then
      rm -rf $folder_or_file_svn
      printf '\n'
      echo "removendo pasta ou arquivo, para sincronizar pastas"
      echo "rm -rf $folder_or_file_svn"
    fi
  fi
done;
printf '\n'

open folder_git
open folder_svn

