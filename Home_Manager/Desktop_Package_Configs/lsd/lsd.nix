{
  programs.lsd = {
    enable = true;
    colors = {
      size = {
        large = "dark_yellow";
        none = "grey";
        small = "yellow";
      };
    };
    settings = {
      date = "relative";
      ignore-globs = [
        ".git"
        ".hg"
      ];
    };
  };
}
