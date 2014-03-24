		------------------15/11/2013-----------------

This project simulates a channel having Additive White Gaussian Noise (AWGN). The signalling scheme that has been used is ON-OFF. The codes have been implemented in Matlab. Effects of Inter-Symbol Inteference (ISI) have also been shown. All the effects are then plotted on a graph.

Code Files

1. "ptrain.m" :  contians the code for generating a pulse train for the message signal using ON-OFF signalling scheme. It plots the following graphs:

(a) time domain representation of the pulse train
(b) spectrum of pulse train 
(c)spectrum of pulse train after passing through a channel of Bandwidth=25 Hz
(d) pulse train after passing through a channel of Bandwidth=25 Hz in time domain

The code returns the bit error rate and the no of bits recieved in error.
To run the code please type the following in command window of matlab:

[out,ff,w,y,yt,op,count,ber ] = ptrain( data )

where "data" is the array that contains the message data in digital form.


2. "noise.m"  : contains the code for simulating the signal passage through AWGN channel
The code prints the Bit Error Rate (BER) for the signal after it has passed through an AWGN channel.


To run the code please type the following in command window of matlab:

[ rno, b,c,d,e,count,temp ] = noise( );


-----------end--------------

Aniruddh Ramrakhyani
