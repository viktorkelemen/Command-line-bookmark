cb() {

  [[ ! -f $HOME/.cbrc ]] && {
    echo 'Please create a .cbrc file in your HOME folder.'
    return
  }

  test $# -eq 0 && {
    awk -F "," '{ if (system($3) == 0) print $1; }' $HOME/.cbrc
    return
  }

  shortcut=$1

  cmd=`awk -F "," '{ if ($1 == "'$shortcut'" && system($3) == 0) print $2; }' $HOME/.cbrc`

  if [ -z "$cmd" ]
  then
    echo "No command with this path."
  else
    $cmd $2 $3 $4
  fi
}
