function podctl -d "Podman/Systemd macro for controlling pods."

     set HELP_TEXT "[USAGE]\npodctl [-s / --system] <sysctl-cmd> <pod/yaml/path>\npodctl -s start /temp/nginx.yaml"
     
     # check that there are at least 2 args
     if test (count $argv) -lt 2
          echo -e $HELP_TEXT
     else

          # parse out root and help flags
          argparse --name=podctl 'h/help' 's/system' -- $argv

          # check that there are still at least 2 args after removing flags
          if test (count $argv) -lt 2
               echo -e $HELP_TEXT
          else

               # check for help flag
               if set -q _flag_help
                    echo -e $HELP_TEXT
               else

                    # check for root flag
                    # perform desired action
                    if set -q _flag_system
                         sudo systemctl --system $argv[1] podman-kube@(systemd-escape $argv[2]).service
                    else
                         systemctl --user $argv[1] podman-kube@(systemd-escape $argv[2]).service
                    end
               end
          end
     end
end
