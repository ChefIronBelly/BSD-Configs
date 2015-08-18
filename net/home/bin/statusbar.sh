!/bin/sh

font="Monaco:size=10"
ico_font="fontawesome-webfont:size=11"
bg="#ffc59c4b"
fg="#ff413421"
hl="#ffc59c4b"

default_geometry() {
    # get screen size
    x=$(wattr w `lsw -r`)
    y=$(wattr h `lsw -r`)

    width=410
    height=20

    offy=10
    offx=$(( x - x/2 - $width/2 ))

    echo "${width}x${height}+${offx}+${offy}"
}

ip() {
    ip=$(if_ip.sh)
    echo $ip
}

clock() {
    time=$(date +" %a, %b %d %I:%M")
    echo $time
}

vol() {
    vol=$(volume.sh)
    echo $vol
}

GEOM=${GEOM:-$(default_geometry)}
SLEEP=${SLEEP:-10}

(echo " " $(ip)    $(vol)    $(clock); sleep $SLEEP) | lemonbar -d -g $GEOM -f $font -f $ico_font -B $bg -F $fg
