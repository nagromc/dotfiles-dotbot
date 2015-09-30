function cpmkd --description "Copy a file and create its parent directories if necessary"

    set -l argc (count $argv)

    if test $argc -lt 2
        echo "This function needs at least two arguments."
        return 1
    end

    set -l file_to_copy $argv[1]

    if test ! -f $file_to_copy
        printf "The file '%s' does not exist." $file_to_copy
        return 2
    end

    set -l target_dir $argv[2]
    set -l target_file_name (basename $target_dir)
    set -l file_to_copy_name (basename $file_to_copy)

    if test $file_to_copy_name = $target_file_name
        set target_dir (dirname $target_dir)
    end

    mkdir -p $target_dir; and cp $file_to_copy $target_dir
end
