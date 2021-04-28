#/usr/bin/env bash

_tumbleweed_completion()
{
  if [ ${#COMP_WORDS[@]} -eq 2 ] ; then
    COMPREPLY=($(compgen -W "history init installed latest list migrate revert status switch target uninit unmigrate update upgrade reviews version --version --help" -- "${COMP_WORDS[-1]}"))
  elif [[ ${#COMP_WORDS[@]} -gt 2 && (
      "${COMP_WORDS[1]}" == "init" ||
      "${COMP_WORDS[1]}" == "switch" ||
      "${COMP_WORDS[1]}" == "update" ||
      "${COMP_WORDS[1]}" == "upgrade" ||
      "${COMP_WORDS[1]}" == "revert" ) ]] ; then

    local flags=("--force" "--install")
    for word in ${COMP_WORDS[@]:2} ; do
      for i in ${!flags[@]} ; do
        if [ "${flags[$i]}" == "$word" ] ; then
          unset flags[$i]
        fi
      done
    done
    COMPREPLY=($(compgen -W "$(echo ${flags[@]})" -- "${COMP_WORDS[-1]}"))

    if [ "${COMP_WORDS[1]}" == "switch" ] ; then
      # Cache the list to avoid remote call each completion.
      if [ -z "$_TUMBLEWEED_LIST" ] ; then
        _TUMBLEWEED_LIST="$(tumbleweed list)"
      fi

      # Skip list if a snapshot is already an argument.
      for word in ${COMP_WORDS[@]:2} ; do
        for snapshot in $_TUMBLEWEED_LIST ; do
          if [ "$snapshot" == "$word" ] ; then
            return
          fi
        done
      done

      COMPREPLY+=($(compgen -W "$_TUMBLEWEED_LIST" -- "${COMP_WORDS[-1]}"))
    fi
  fi
}

complete -F _tumbleweed_completion tumbleweed
