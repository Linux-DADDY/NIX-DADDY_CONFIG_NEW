{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    lm_sensors
  ];
  programs.waybar = {
    enable = true;
    # package = inputs.waybar.packages.${pkgs.system}.default;
    settings = [
      {
        layer = "top";
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];
        position = "bottom";
        mod = "dock";
        exclusive = true;
        passthrough = true;
        gtk-layer-shell = true;
        margin-left = 5;
        margin-right = 5;
        margin-bottom = 10;

        modules-left = [
          "user"
          "clock#time"
          "clock#date"
          "battery"
          "network"
          "bluetooth"
          "tray"
        ];
        modules-center = ["hyprland/workspaces"];
        modules-right = [
          # "network#speed"
          "memory"
          "temperature"
          "custom/fan"
          "cpu"
          "pulseaudio"
          "backlight"
        ];

        # Modules
        "user" = {
          "format" = "<span color=\"#f38ba8\">  Linux DADDY </span>";
          "interval" = 60;
          "height" = 60;
          "width" = 30;
          "icon" = true;
        };
        "clock#time" = {
          "format" = "<span color=\"#89dceb\">  {:%I:%M %p}</span>";
          "interval" = 30;
        };
        "clock#date" = {
          "format" = "<span color=\"#f5c2e7\">  {:%d%m%Y}</span>";
          "interval" = 360;
          "calendar" = {
            "mode" = "month";
            "mode-mon-col" = 4;
            "weeks-pos" = "right";
            "on-scroll" = 1;
            "on-click-right" = "mode";
            "format" = {
              "months" = "<span color='#c0caf5'><b>{}</b></span>";
              "days" = "<span color='#c0caf5'><b>{}</b></span>";
              "weeks" = "<span color='#7dcfff'><b>W{}</b></span>";
              "weekdays" = "<span color='#ff9e64'><b>{}</b></span>";
              "today" = "<span color='#f7768e'><b><u>{}</u></b></span>";
            };
          };
        };

        "battery" = {
          "bat" = "BAT1";
          "interval" = 5;
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon} {capacity}%</span>";
          "format-icons" = [
            "<span color=\"#f7768e\"> "
            "<span color=\"#f7768e\"> "
            "<span color=\"#7aa2f7\"> "
            "<span color=\"#7aa2f7\"> "
            "<span color=\"#7aa2f7\"> "
          ];
          "format-charging" = "<span color=\"#e0af68\">󱐌 {capacity}%</span>";
        };

        "cpu" = {
          "format" = "<span color=\"#b4befe\">  {usage}% | {max_frequency}GHz </span>";
          "interval" = 5;
        };

        "memory" = {
          "format" = "<span color=\"#74c7ec\"> {used:.1f}GB / {total:.0f}GB</span>";
          "interval" = 5;
          "max-length" = 30;
        };
        "temperature" = {
          "hwmon-path" = "/sys/class/hwmon/hwmon5/temp1_input";
          "critical-threshold" = 80;
          "format" = "<span color=\"#f5c2e7\"> {temperatureC}°C </span>";
          "format-critical" = "<span color=\"#f38ba8\">󰈸 {temperatureC}°C</span>";
          "interval" = 5;
        };

        "pulseaudio" = {
          "format" = "<span color=\"#cba6f7\">  {volume}%</span>";
          "tooltip" = false;
          "format-muted" = "<span color=\"#f7768e\">󰖁 Muted</span>";
          "on-click" = "pamixer -t";
          "on-scroll-up" = "pamixer -i 5";
          "on-scroll-down" = "pamixer -d 5";
          "scroll-step" = 5;
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [
              ""
              ""
              ""
            ];
          };
        };

        "hyprland/workspaces" = {
          "disable-scroll" = true;
          "all-outputs" = true;
          "active-only" = false;
          "format" = "{icon}";
          "on-click" = "activate";
          "on-scroll-up" = "hyprctl dispatch workspace e+1";
          "on-scroll-down" = "hyprctl dispatch workspace e-1";
          "format-icons" = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
          };
        };

        "backlight" = {
          "device" = "amd_backlight";
          "format" = "<span color=\"#f9e2af\">{icon} {percent}%</span>";
          "format-icons" = [
            "󰃞"
            "󰃟"
            "󰃠"
          ];
          "on-scroll-up" = "brightnessctl set 5%+";
          "on-scroll-down" = "brightnessctl set 5%-";
          "min-length" = 6;
        };
        "pulseaudio#microphone" = {
          "format" = "<span color=\"#a6e3a1\"> {volume}%</span>";
          "format_source-muted" = "<span color=\"#f38ba8\">  Muted</span>";
          "on-click" = "pamixer --default-source -t";
          "on-scroll-up" = "pamixer --default-source -i 5";
          "on-scroll-down" = "pamixer --default-source -d 5";
          "scroll-step" = 5;
        };

        "bluetooth" = {
          "format" = " {status}";
          "format-connected" = " {device_alias}";
          "format-connected-battery" = " {status} {device_battery_percentage}%";
          "tooltip-format" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          "tooltip-format-connected" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
          "tooltip-format-enumerate-connected-battery" = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
        };

        "network" = {
          "format-wifi" = "<span color=\"#cba6f7\">  {signalStrength}%</span>";
          "format-ethernet" = "<span color=\"#cba6f7\">󰈀  Ethernet</span>";
          "tooltip-format" = "{essid} - {ifname} via {gwaddr}";
          "format-linked" = "{ifname} (No IP)";
          "format-disconnected" = "<span color=\"#cba6f7\">󰤭  Disconnected ⚠</span>";
          "format-alt" = "{ifname}:{essid} {ipaddr}/{cidr}";
        };

        "network#speed" = {
          "interval" = 1;
          "format" = "{ifname}";
          "format-wifi" = "{icon}  {bandwidthUpBytes}  {bandwidthDownBytes}";
          "format-ethernet" = "󰌘   {bandwidthUpBytes}  {bandwidthDownBytes}";
          "format-disconnected" = "󰌙";
          "tooltip-format" = "{ipaddr}";
          "format-linked" = "󰈁 {ifname} (No IP)";
          "tooltip-format-wifi" = "{essid} {icon} {signalStrength}%";
          "tooltip-format-ethernet" = "{ifname} 󰌘";
          "tooltip-format-disconnected" = "󰌙 Disconnected";
          "max-length" = 50;
          "format-icons" = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
        };

        "custom/fan" = {
          "exec" = "sensors | awk '/fan1:/ {print $2,$3}'";
          "format" = " {}";
          "interval" = 5;
        };

        "disk" = {
          "interval" = 15;
          "format" = "{specific_free:0.2f}GB / {specific_total:0.2f}GB";
          "unit" = "GB";
        };
      }
    ];
    style = ''
          * {
        border: none;
        border-radius: 20px;
        font-family: "Monaspace Radon";
        font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
        font-weight: 700;
        font-size: 14px;
      }

      window#waybar {
        border-radius: 10px;
        background: transparent;
        background-color: rgba(43, 45, 50, 0.5);
        /* color: #cdd6f4; */
        /* background: #1e1e2e; */
      }

      tooltip {
        background: #1e1e2e;
        border-radius: 5px;
        border-width: 1px;
        border-style: solid;
        border-color: #11111b;
      }

      #workspaces button {
        padding: 5px;
        color: #f5e0dc;
        margin-right: 5px;
      }

      #workspaces button.active {
        color: #cba6f7;
      }

      #workspaces button.focused {
        color: #a6adc8;
        background: #eba0ac;
        border-radius: 5px;
      }

      #workspaces button.urgent {
        color: #11111b;
        background: #a6e3a1;
        border-radius: 5px;
      }

      #workspaces button:hover {
        background: #89b4fa;
        color: #1e1e2e;
        border-radius: 5px;
      }

      #memory,
      #custom-power_profile,
      /* #custom-weather, */
      #window,
      #clock,
      #network#speed,
      #battery,
      #pulseaudio,
      #network,
      #bluetooth,
      #temperature,
      #custom-fan,
      #workspaces,
      #tray,
      #cpu,
      #tray,
      #language,
      #user,
      #backlight,
      #disk,
      /* #custom-spotify, */
      #keyboard-state,
      /* #custom-updates, */
      #custom-crypto {
        background: #1e1e2e;
        padding: 0px 15px;
        opacity: 1;
      }
    '';
  };
}
