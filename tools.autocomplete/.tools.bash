_tools()
{
    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    prev_prev="${COMP_WORDS[COMP_CWORD-2]}"

    if [ $COMP_CWORD -eq 1 ]; then
        COMPREPLY=( $(compgen -W "aws scp ssh validate mix help" -- $cur) )
    elif [ $COMP_CWORD -eq 2 ]; then
        case "$prev" in
            aws)
                COMPREPLY=( $(compgen -W "dynamodb s3 help" -- $cur) )
                ;;
	        export_to_csv)
                COMPREPLY=( $(compgen -W "query scan help" -- $cur) )
                ;;
            scp)
                COMPREPLY=( $(compgen -W "aws gcp ip help" -- $cur) )
                ;;
            ssh)
                COMPREPLY=( $(compgen -W "aws gcp ip help" -- $cur) )
                ;;
	    	validate)
                COMPREPLY=( $(compgen -W "isort flake8 mypy help" -- $cur) )
                ;;
            mix)
                COMPREPLY=( $(compgen -W "help" -- $cur) )
                ;;
            *)
                ;;
        esac
    elif [ $COMP_CWORD -eq 3 ]; then
        case "$prev" in
            dynamodb)
                COMPREPLY=( $(compgen -W "delete-item describe-table get-item list-tables query scan" -- $cur) )
                ;;
            isort|flake8|mypy)
                COMPREPLY=( $(compgen -W "committed file" -- $cur) )
                ;;
	        aws|gcp)
		        _filedir
		        ;;
            s3)
		        COMPREPLY=( $(compgen -W "cp ls sync" -- $cur) )
		        ;;
            query)
                COMPREPLY=( $(compgen -W "--key_cond_expression" -- $cur) )
                ;;
            scan)
                COMPREPLY=( $(compgen -W "--filter_expression" -- $cur) )
                ;;
            *)
                ;;
        esac
    elif [ $COMP_CWORD -eq 4 ]; then
        case "$prev" in
            ls)
                COMPREPLY=( $(compgen -W "replace_with_bucket" -- $cur) )
                ;;
            query)
                COMPREPLY=( $(compgen -W "replace_with_table" -- $cur) )
                ;;
            get-item)
                COMPREPLY=( $(compgen -W "replace_with_table" -- $cur) )
                ;;
            *)
        esac
    elif [ $COMP_CWORD -eq 5 ]; then
        case "$prev_prev" in
            --key_cond_expression)
                COMPREPLY=( $(compgen -W "--filter_expression" -- $cur) )
                ;;
            --filter_expression)
                COMPREPLY=( $(compgen -W "--field_list" -- $cur) )
                ;;
            *)
                ;;
        esac
    elif [ $COMP_CWORD -eq 7 ]; then
        case "$prev_prev" in
            --filter_expression)
                COMPREPLY=( $(compgen -W "--field_list" -- $cur) )
                ;;
            *)
                ;;
        esac
    elif [ $COMP_CWORD -eq 9 ]; then
        case "$prev_prev" in
            --field_list)
                COMPREPLY=( $(compgen -W "--key_cond_comparator" -- $cur) )
                ;;
            *)
                ;;
        esac
    elif [ $COMP_CWORD -eq 11 ]; then
        case "$prev_prev" in
            --key_cond_comparator)
                COMPREPLY=( $(compgen -W "--filter_comparator" -- $cur) )
                ;;
            *)
        esac
    elif [ $COMP_CWORD -eq 13 ]; then
        case "$prev_prev" in
            --filter_comparator)
                COMPREPLY=( $(compgen -W "--csv_out" -- $cur) )
                ;;
            *)
                ;;
        esac
    else
	   _filedir
    fi
}
complete -F _tools tools
