function git-clone-plus-plus -d "Clones the repository from the URL in the clipboard, then cd into it"
    set -l clipboard_content (pbpaste)
    set -l repo_name (basename --suffix=.git "$clipboard_content")

    set -l trunk_cp_content (echo "$clipboard_content" | cut --characters=-150)
    echo "The clipboard content is '$trunk_cp_content'"
    read_confirm "Clone from this URL?" y
    if [ $status != 0 ]
        return 1
    end

    git clone $clipboard_content $repo_name; and cd $repo_name; and echo You are now in (pwd)
end
