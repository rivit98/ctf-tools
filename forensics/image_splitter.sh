image=./qr_image.png

size=$( identify -ping -format "%wx%h" "${image}" )
x_upb=${size%x*}
y_upb=${size#*x}

x_inc=100
y_inc=100
x_tile=100
y_tile=100

for ((y=0; y<y_upb; y+=y_inc))
do
	for ((x=0; x<x_upb; x+=x_inc))
    do
        convert "${image}" -crop "${x_tile}x${y_tile}+${x}+${y}" "./out/$x-$y.png"
		zbarimg "./out/$x-$y.png" | awk -F':' '{ print $2 }' | tr -d '\n' >> out.txt
    done
done
