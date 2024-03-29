{
  home.file.".config/waybar/style.css".source = ./style.css;
  home.file.".config/waybar/config".source = ./config;
  programs.waybar = {
    enable = true;
    #settings = {
    #  mainBar = {
    #    layer = "top";
    #    modules-left = [ "custom/arch" "hyprland/workspaces" ];
    #    modules-center = [ "clock" ];
    #    modules-right =
    #      [ "backlight" "pulseaudio" "bluetooth" "network" "battery" ];
    #    "custom/arch" = {
    #      format = "  ";
    #      tooltip = false;
    #      on-click = "sh $HOME/.config/rofi/bin/powermenu";
    #    };
    #    clock = { format = "<span color='#b4befe'> </span>{:%H:%M}"; };
    #    backlight = {
    #      device = "intel_backlight";
    #      format = "<span color='#b4befe'>{icon}</span> {percent}%";
    #      format-icons = [ "" "" "" "" "" "" "" "" "" ];
    #    };
    #    pulseaudio = {
    #      format = "<span color='#b4befe'>{icon}</span> {volume}%";
    #      format-muted = "";
    #      tooltip = false;
    #      format-icons = {
    #        headphone = "";
    #        default = [ "" "" "󰕾" "󰕾" "󰕾" "" "" "" ];
    #      };
    #      scroll-step = 1;
    #    };
    #    bluetooth = {
    #      format = "<span color='#b4befe'></span> {status}";
    #      format-disabled = "";
    #      format-connected = "<span color='#b4befe'></span> {num_connections}";
    #      tooltip-format = "{device_enumerate}";
    #      tooltip-format-enumerate-connected =
    #        "{device_alias}   {device_address}";
    #    };
    #    network = {
    #      interface = "wlp1s0f0";
    #      format = "{ifname}";
    #      format-wifi = "<span color='#b4befe'> </span>{essid}";
    #      format-ethernet = "{ipaddr}/{cidr} ";
    #      format-disconnected = "<span color='#b4befe'>󰖪 </span>No Network";
    #      tooltip = false;
    #    };
    #    battery = {
    #      format = "<span color='#b4befe'>{icon} </span> {capacity}%";
    #      format-icons = [ "" "" "" "" "" ];
    #      format-charging = "<span color='#b4befe'></span> {capacity}%";
    #      tooltip = false;
    #    };
    #  };
    #};
  };
}
