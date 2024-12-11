{
  home.file."Terminal" = {
    executable = true;
    target = ".config/hypr/scripts/Terminal";
    text = ''
      #!/usr/bin/env bash

      if [[ $1 == "-f" ]]; then
      	kitty --single-instance --class "kitty_float"
      else
      	kitty --single-instance
      fi
    '';
  };
}
