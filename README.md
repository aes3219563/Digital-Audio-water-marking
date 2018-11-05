# Digital-Audio-water-marking
This algorithm is designed for the voice database copyright encryption project of Florida's signal and image processing lab.<br>
In our database, we have kept tens of thousands of voice records of teachers and students from their lectures, daily conversations, and celebrations. Now we would like to add a copyright to protect the privacy of our teachers and students.<br>
It should be clear that all the voice records in the database are mono recorded, and we have several requirements:<br>
1. Since some voice records are quite long, it might be used after sliced in to frames. Our encryption algorithm should protect as many pieces as possible.<br>
2. The encryption algorithm should be robust to noise as voice data might change after copying or encoding/decoding.
3. We do not have a restricted requirement of avoiding distortion, but human ears should not distinguish the slight difference between original voice record and encrypted voice record.
4. The decryption procedure should be independent from original voice record.
# Algorithm Design
1. Voice data is read at 441000 Hz (we assume that all the voice records satisfy the [VCD standard](https://en.wikipedia.org/wiki/Video_CD)).<br>
2. Voice data is cut into pieces with a time gap of 20 ms.<br>
3. For each frame, calculate DWT first and then DCT.<br>
3. In the DCT domain, find the max amplitude "a" (indicator) and second~fourth largest amplitudes "b~d" (encoder).
4. Divide indicator a into a piece array via step length alpha=0.2 and find which piece is close to encoder b, we call this piece "p".<br>
5. We encrypt the encoders by changing their sign based on the index of p and encoding information provided.
6. Express the copyright information circularly in binary so that the frames and the binary copyright information are in a one-to-one correspondence.
7. Encode each frame following step 4.
# Functions
```matlab
motified_amplitude=quan(max_amplitude,encoder,step_length_alpha,encoding_information)
% return the modified encoder
```
```matlab
frames=enframe(target,sample_number_each_frame)
% return a list of frames, each frame contains sample_number_each_frame samples
```
```matlab
watermark_info_circle=wm(copyright_string,total_frame_num)
% return circularly expressed binary copyright information
```
```matlab
watermark_info_circle_recovered=dwm(watermark_info_circle)
% decode circularly expressed binary info to circularly expressed string.
```
```matlab
watermark_info=findwm(watermark_info_circle_recovered)
% return the exact watermark information from circular expression. Confirm the watermark info via majority principle.
```
```matlab
amplitude=dequan(max_amplitude,motified_encoder,step_length_alpha)
% decode the binary inform in each frame
```
Full code is in the example folder. Since the copyright information is circularly encrypted, no matter how the voice record is cut, we have at most 882 iterations to work out the real copyright information.
