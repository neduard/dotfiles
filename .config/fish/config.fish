if status --is-login
    set -gx PATH ~/.local/bin $PATH
    set -gx EDITOR hx
end
if status is-interactive
    # Commands to run in interactive sessions can go here
end
