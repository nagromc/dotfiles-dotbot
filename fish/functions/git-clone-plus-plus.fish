function git-clone-plus-plus -d "Clones the repository from the URL in the clipboard, then cd into it"
    set -l clipboard_content (pbpaste)
    set -l repo_name (__get_repo_name_from_clipboard)

    if [ $status != 0 ]
        echo "It seems the text in the clipboard is not a correct URL."
        return 1
    end

    git clone $clipboard_content $repo_name; and cd $repo_name; and echo You are now in (pwd)
end

function  __get_repo_name_from_clipboard
    set -l clipboard_content (pbpaste)

    if string match --invert --regex '^(http|https|git|ssh)://[^\s]*' $clipboard_content
        return 1
    end

    basename --suffix=.git --suffix=.html $clipboard_content
end
