cb() {

  test $# -eq 0 && {
    awk -F "," '{ if (system($3) == 0) print $1; }' ~/clibookmark.commands
    return
  }

  shortcut=$1

  cmd=`awk -F "," '{ if ($1 == "'$shortcut'" && system($3) == 0) print $2; }' ~/clibookmark.commands`

  if [ -z "$cmd" ]
  then
    echo "No command with this path."
  else
    $cmd $2 $3 $4
  fi
}
