{
  home.file."StatusBar" = {
    executable = true;
    target = ".config/hypr/scripts/StatusBar";
    text = ''
          #!/usr/bin/env bash
      if [[ ! $(pidof waybar) ]]; then
      	waybar
      fi
    '';
  };
}
