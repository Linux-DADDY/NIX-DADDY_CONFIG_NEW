{pkgs, ...}: {
  # users.users.root.hashedPassword = "$6$ZCxP7.cbpXigNcCi$2IOzJgs0KSwrzvU6tngAMPzspGxJCM8Ax5yYeBPeJMefrNZBVvDz4j367ivSqUkCXXF5S1lbMmRKhwS.Sr1bh0";
  services = {
    fail2ban.enable = true;

    ##NOTE: If you want to use this you can otherwise leave it as it is, It's just an another virus scanner tool.
    # clamav = {
    #   daemon.enable = true;
    #   fangfrisch.enable = true;
    #   fangfrisch.interval = "daily";
    #   updater.enable = true;
    #   updater.interval = "daily"; #man systemd.time
    #   updater.frequency = 12;
    #   scanner = {
    #     enable = true;
    #     interval = "Sat *-*-* 04:00:00";
    #   };
    # };
  };
}
