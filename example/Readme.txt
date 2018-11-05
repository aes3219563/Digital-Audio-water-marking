
****************************FUNCTION LIST******************************

freq.m : main function of encoding

de_freq.m : main function of decoding

enframe.m : this is a funtion to cut a 1-D array into pieces

wm.m : this function creats a rn-length-array with watermark information(rn is total frame number)

dwm.m : this is a function to decode the watermarked information

findwm.m : this is a function to find the exact watermarked information from circular expression

quan.m : this is the function to encode binary information

dequan.m : this is the funtion to decode the binary inform in each frame


*************************TEST FILE LIST********************************

a.wav : original music piece (10 seconds)

b.wav : music after encoding (watermark inform : hello_everyone)

bb.wav: watermarked piece with noise (Gaussian noise with a variance of 0.04)