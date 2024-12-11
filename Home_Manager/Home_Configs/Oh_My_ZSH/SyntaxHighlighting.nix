{
  programs.zsh.syntaxHighlighting = {
    enable = true;
    highlighters = [
      "main"
      "brackets"
      "pattern"
      "line"
      "cursor"
      "root"
    ];
    styles = {
      comment = "fg=black,bold";
    };
  };
}
