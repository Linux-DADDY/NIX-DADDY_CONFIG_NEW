{
  home.file."Custom_CSS" = {
    executable = false;
    target = "Documents/Vivaldi_Mod/custom.css";
    text = ''
      /* Added Lines */

      #header {
        display: none;
      }

      .window-buttongroup {
        display: none !important;
      }
      .linux #tabs-container:not(.none).top {
        padding-right: 10px;
      }

      /* End lines */
    '';
  };
}
