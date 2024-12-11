{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    wlogout
    yad
    psmisc
    pamixer
    libnotify
    brightnessctl
    wl-clipboard
    cliphist
    wlroots
    slurp
    hyprpicker
    imagemagick
    grim
    swaylock-effects
    # hyprpolkitagent
    gpustat
    inputs.hyprpanel.packages.${pkgs.system}.default
    ags
    #plugins
    # hyprlandPlugins.hyprspace
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true; #FIXME: Does not work properly, Enabled this because i want to try it.
    systemd.variables = ["--all"];
    plugins = [
      # inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
      # inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
      # inputs.hycov.packages.${pkgs.system}.hycov
      # inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    ];
    settings = {
      # Scripts
      "$mod" = "SUPER";
      "$GameMode" = "~/.config/hypr/scripts/GameMode";
      # "$LockScreen" = "~/.config/hypr/scripts/LockScreen";
      # "$Volume" = "~/.config/hypr/scripts/Volume";
      "$backlight" = "~/.config/hypr/scripts/Brightness";
      "$term" = "~/.config/hypr/scripts/Terminal";
      "$launcher" = "~/.config/hypr/rofi/bin/launcher";
      "$powermenu" = "~/.config/hypr/rofi/bin/powermenu";
      "$screenshot" = "~/.config/hypr/rofi/bin/screenshot";
      "$colorpicker" = "~/.config/hypr/scripts/colorpicker";

      monitor = [
        "eDP-1,1920x1080,0x0,1"
        # "DP-1,transform,1"
        # "workspace=eDP-1,1"

        # HDMI Monitor setup
        # "HDMI-A-1,1920x1080,1920x0,1,bitdepth,10"
        # "workspace=HDMI-A-1,11"

        "Unknown-1,disable"
      ];

      xwayland = {
        force_zero_scaling = true;
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = false;
          size = 7;
          passes = 1;
          new_optimizations = true;
        };
      };

      input = {
        kb_layout = "us";
        kb_variant = ",qwerty";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = 1;
        repeat_delay = 140;
        repeat_rate = 30;
        numlock_by_default = true;
        accel_profile = "flat";
        sensitivity = 0;
        force_no_accel = 1;
        touchpad = {
          natural_scroll = 1;
        };
      };

      cursor = {
        enable_hyprcursor = true;
      };

      gestures = {
        workspace_swipe = 1;
        workspace_swipe_fingers = 3;
        workspace_swipe_distance = 200;
        workspace_swipe_min_speed_to_force = 100;
      };

      render = {
        # Enables explicit sync support.
        explicit_sync = 1;
      };

      debug = {
        damage_tracking = 2; # leave it on 2 (full) unless you hate your GPU and want to make it suffer!
      };

      animations = {
        enabled = true;
        bezier = [
          "pace,0.46, 1, 0.29, 0.99"
          "overshot,0.13,0.99,0.29,1.1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
        ];
        animation = [
          "windowsIn,1,6,md3_decel,slide"
          "windowsOut,1,6,md3_decel,slide"
          "windowsMove,1,6,md3_decel,slide"
          "fade,1,10,md3_decel"
          "workspaces,1,9,md3_decel,slide"
          "workspaces, 1, 6, default"
          "specialWorkspace,1,8,md3_decel,slide"
          "border,1,10,md3_decel"
        ];
      };

      misc = {
        vfr = true; # misc:no_vfr -> misc:vfr. bool, heavily recommended to leave at default on. Saves on CPU usage.
        vrr = 0; # misc:vrr -> Adaptive sync of your monitor. 0 (off), 1 (on), 2 (fullscreen only). Default 0 to avoid white flashes on select hardware.
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      dwindle = {
        pseudotile = true; # enable pseudotiling on dwindle
        force_split = 0;
        preserve_split = true;
        default_split_ratio = 1.0;
        # no_gaps_when_only = false;
        special_scale_factor = 0.8;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
      };

      master = {
        mfact = 0.5;
        orientation = "right";
        special_scale_factor = 0.8;
        new_status = "slave";
        # no_gaps_when_only = false;
      };

      bind = [
        # Hyprland binds
        # Kill Active window. Whatever is front of you.
        "SUPER,C,killactive,"
        "SUPERSHIFT,Q,exec,hyprctl dispatch exit"

        # GameMode
        "SUPER,F1,exec, $GameMode"

        # lockScreen
        # "CTRLALT,l,exec, ~/.config/hypr/scripts/LockScreen"

        "CTRLALT,l,exec, hyprlock"

        # FLoat window
        "SUPER,F,fullscreen,"
        "SUPER,SPACE,togglefloating,"

        # CycleNext
        "SUPER,TAB,cyclenext,"
        "SUPER,TAB,bringactivetotop,"

        # Screenlock
        "CTRLALT,L,exec,$screenlock"

        # ZOOM
        "SUPER,grave,exec,pypr zoom"

        # Focus
        "SUPER,left,movefocus,l"
        "SUPER,right,movefocus,r"
        "SUPER,up,movefocus,u"
        "SUPER,down,movefocus,d"

        # Move
        "SUPERSHIFT,left,movewindow,l"
        "SUPERSHIFT,right,movewindow,r"
        "SUPERSHIFT,up,movewindow,u"
        "SUPERSHIFT,down,movewindow,d"

        # Resize
        "SUPERCTRL,left,resizeactive,-20 0"
        "SUPERCTRL,right,resizeactive,20 0"
        "SUPERCTRL,up,resizeactive,0 -20"
        "SUPERCTRL,down,resizeactive,0 20"

        # Workspaces
        "SUPER,1,workspace,1"
        "SUPER,2,workspace,2"
        "SUPER,3,workspace,3"
        "SUPER,4,workspace,4"
        "SUPER,5,workspace,5"
        "SUPER,6,workspace,6"
        "SUPER,7,workspace,7"
        "SUPER,8,workspace,8"
        "SUPER,9,workspace,9"
        # SUPER,0,workspace,0

        # Send to Workspaces
        "SUPERSHIFT,1,movetoworkspace,1"
        "SUPERSHIFT,2,movetoworkspace,2"
        "SUPERSHIFT,3,movetoworkspace,3"
        "SUPERSHIFT,4,movetoworkspace,4"
        "SUPERSHIFT,5,movetoworkspace,5"
        "SUPERSHIFT,6,movetoworkspace,6"
        "SUPERSHIFT,7,movetoworkspace,7"
        "SUPERSHIFT,8,movetoworkspace,8"
        "SUPERSHIFT,9,movetoworkspace,9"
        # ",0,movetoworkspace,0"

        # # Send to Workspaces
        # "SUPERCTRL,1,movetoworkspace,1"
        # "SUPERCTRL,2,movetoworkspace,2"
        # "SUPERCTRL,3,movetoworkspace,3"
        # "SUPERCTRL,4,movetoworkspace,4"
        # "SUPERCTRL,5,movetoworkspace,5"
        # "SUPERCTRL,6,movetoworkspace,6"
        # "SUPERCTRL,7,movetoworkspace,7"
        # "SUPERCTRL,8,movetoworkspace,8"
        # "SUPERCTRL,9,movetoworkspace,9"
        # "SUPERCTRL,0,movetoworkspace,0"

        # Scroll through existing workspaces with mainMod + scroll
        "SUPER,mouse_down,workspace,e+1"
        "SUPER,mouse_up,workspace,e-1"

        # -- Rofi --
        # "SUPER,D,exec,$launcher"
        "SUPER,D,exec,sh ~/.config/hypr/rofi/bin/launcher"
        "SUPERSHIFT,C,exec,sh ~/.config/hypr/rofi/bin/clipboard"
        "SUPER,X,exec,sh ~/.config/hypr/rofi/bin/powermenu"
        "SUPER,S,exec,sh ~/.config/hypr/rofi/bin/screenshot"

        #FIXME:, Have to fix those.
        # "SUPERSHIFT,C,exec,$clipboard"
        # "SUPER,X,exec,$powermenu"
        # "SUPER,S,exec,$screenshot"

        # Waybar
        # "SUPER, B, exec, pkill -SIGUSR1 waybar"
        # "SUPERSHIFT, B, exec, pkill -SIGUSR1 waybar && $GameMode"

        # -- Apps --
        "SUPERSHIFT,F,exec,nemo"
        "SUPERSHIFT,W,exec,vivaldi"
        # "SUPERSHIFT,E,exec,geany"
        # -- Terminal --
        # bind=SUPER,RETURN,exec,$term
        # SUPERSHIFT,RETURN,exec,$term -f
        # SUPER,RETURN,exec,$term
        # "SUPER,RETURN,exec,kitty"
        "SUPERSHIFT,RETURN,exec,$term -f"
        "SUPER,RETURN,exec,$term"
        # bind=SUPER,RETURN,exec,alacritty
      ];
      exec-once = [
        # "easyeffects --gapplication-service" # Starts easyeffects in the background
        # "importGsettings"
        # "zen"
        "vivaldi"
        "wpaperd"
        "beeper"
        # "rambox"
        "nemo"
        # "~/.config/hypr/scripts/StatusBar"
        # "virt-manager"
        # "fcitx5 -d"
        "hyprshade on vibrance" #FIXME:, For some reason this dosn't work with the hyprshade install.
        "pypr"
        # "dbus-update-activation-environment --systemd HYPRLAND_INSTANCE_SIGNATURE"

        # System
        # "systemctl --user import-environment &"
        # "hash dbus-update-activation-environment 2>/dev/null &"
        # "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &"
        "dbus-update-activation-environment --systemd --all"
        # "poweralertd &"
        # "systemctl --user start hyprpolkitagent&"
        # "${pkgs.hyprpanel}/bin/hyprpanel"
        "hyprpanel"
      ];
      # Mouse binds
      bindm = [
        "SUPER,mouse:272,movewindow"
        "SUPER,mouse:273,resizewindow"
      ];
      bindl = [
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"

        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"

        # ", XF86AudioLowerVolume, exec, $volume --inc"
        # ", XF86AudioRaiseVolume, exec, $volume --dec"

        # ", XF86MonBrightnessUp,  exec, brightnessctl s +5%"
        # ", XF86MonBrightnessDown,  exec, brightnessctl s 5%-"

        # ", XF86MonBrightnessUp,  exec, $backlight --inc "
        # ", XF86MonBrightnessDown,  exec, $backlight --dec "

        ", XF86MonBrightnessUp,  exec, brightnessctl set 10+"
        ", XF86MonBrightnessDown,  exec, brightnessctl set 10-"
      ];
      windowrule = [
        # "float, file_progress"
        # "float, confirm"
        # "float, dialog"
        # "float, download"
        # -- Kitty --
        # "opacity 0.8,kitty"
        "float,kitty_float"
        "size 70% 60%,kitty_float"
        "center,kitty_float"
      ];
      windowrulev2 = [
        "workspace 1 ,opacity 1.0,class:(kitty)"
        "workspace 4 silent,opacity 1.0,class:(zen-alpha)"
        "workspace 2 silent,class:(vivaldi-stable)"
        "workspace 3 silent,class:(nemo)"
        "workspace 1 silent,class:(virt-manager)"
        "workspace 6 silent,class:(Beeper)"
        "workspace 9 silent,class:(rambox)"
        "workspace 5 ,class:(mpv)"

        # Fullscreen
        "fullscreen,class:(mpv)"
        # "fullscreen,class:(com.stremio.stremio)"
      ];
      env = [
        "XDG_SESSION_TYPE,wayland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "MOZ_ENABLE_WAYLAND,1"
        # "ANKI_WAYLAND,1"
        # "DISABLE_QT5_COMPAT,0"
        "NIXOS_OZONE_WL,1"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        # "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM=wayland,xcb"
        # "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        # "GTK_THEME,FlatColor:dark"
        # "GTK2_RC_FILES,/home/hadi/.local/share/themes/FlatColor/gtk-2.0/gtkrc"
        "DISABLE_QT5_COMPAT,0"
        "DIRENV_LOG_FORMAT,"
        # "WLR_DRM_NO_ATOMIC,1"
        "WLR_BACKEND,vulkan"
        "WLR_RENDERER,vulkan"
        # "WLR_NO_HARDWARE_CURSORS,1"
        "XDG_SESSION_TYPE,wayland"
        "SDL_VIDEODRIVER,wayland"
        "CLUTTER_BACKEND,wayland"
      ];
    };
  };
}
