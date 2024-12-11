{
  services.mako = {
    enable = true;
    font = "JetBrains Mono 10";
    width = 350;
    height = 200;
    margin = "10";
    padding = "15";
    borderSize = 1;
    borderRadius = 10;
    icons = true;
    iconPath = "./icons";
    maxIconSize = 48;
    markup = true;
    actions = true;
    defaultTimeout = 5000;
    ignoreTimeout = false;
    maxVisible = 10;
    layer = "overlay";
    backgroundColor = "#1E1E2E";
    textColor = "#f1fcf9";
    borderColor = "#B4A1DB";
    progressColor = "over #B4A1DB";
    extraConfig = ''
      [urgency=low]
      border-color=#B4A1DB
      default-timeout=2000

      [urgency=normal]
      border-color=#B4A1DB
      default-timeout=5000

      [urgency=high]
      border-color=#D04E9D
      text-color=#D04E9D
      default-timeout=0

      [category=mpd]
      border-color=#E49186
      default-timeout=2000
      group-by=category
    '';
  };
}
