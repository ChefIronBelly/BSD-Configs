#!/bin/sh

GRP_DIR=/tmp/grp
USE_FIFO=yes

setup() {
        [ -d "$GRP_DIR" ] || mkdir $GRP_DIR
        if [ -n "$USE_FIFO" ]
        then
                [ -p "$GRP_DIR/.fifo" ] || mkfifo $GRP_DIR/.fifo
        fi
}

sed_apply() {
        TMP=`mktemp /tmp/grp.XXXXXX`
        sed $1 < $2 > $TMP && mv $TMP $2 || rm $TMP
        [ -n "$DEBUG" ] && echo "sed $1 < $2 > $TMP && mv $TMP $2 || rm $TMP"
}

pop() {
        sed_apply "/$1/d" $2
}

push() {
        echo $1 >> $GRP_DIR/$2
}

view() {
        while read WID
        do mapw -m $WID
        done < $GRP_DIR/$1
}

hide() {
        while read WID
        do mapw -u $WID
        done < $GRP_DIR/$1
}

pop_from_all() {
        for GRP in $GRP_DIR/*
        do
                pop $1 $GRP
        done
}

case $1 in
v|view)
        setup
        if [ -f "$GRP_DIR/$2" ]
        then
                for GRP in $GRP_DIR/*
                do hide `basename $GRP`
                done
                view $2
        else
                echo "group does not exist"
                exit 1
        fi

        # customize your fifo printing here
        if [ -n "$USE_FIFO" ]
        then
                for GRP in $GRP_DIR/*
                do
                        GRP_BASE="`basename $GRP`"
                        GRP_NUM=`wc -l < $GRP | tr -cd '[:digit:]'`
                        #[ $GRP_NUM -ne 0 ] && printf '^fg(#888)' || printf '^fg(#555)'
                        [ $GRP_BASE -eq $2 ] && printf '<'
                        printf "$GRP_BASE"
                        [ $GRP_BASE -eq $2 ] && printf '>'
                done > $GRP_DIR/.fifo
                echo >> $GRP_DIR/.fifo
        fi

        ;;
hide)
        setup
        hide $2
        ;;
a|add)
        setup
        pop_from_all $2
        push $2 $3
        hide $3
        view $3
        ;;
d|del)
        setup
        pop_from_all $2
        ;;
ls|list)
        for GRP in $GRP_DIR/*
        do echo $GRP
        done
        ;;
h|help)
        echo "$0 <add|del|hide|view|ls> [wid] [group]"
        exit 0
esac
