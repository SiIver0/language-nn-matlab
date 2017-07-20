function inp=inputF(word)

% Usage: inp=inputF(word)
% This function gets a string and turns it into an input that the neural
% network will be able to use. It generates a very large matrix of 1 x
% 270, with each letter in the word being represented by its
% position in the matrix. Every 27 spaces in the matrix represents one
% letter. A-Z are positions (1-26)*n in the matrix, with 27*n representing
% a space in the word (since we account for 10 characters).
% n=10 since we are accounting for 10 characters.

% Author: Noah Yoshida
% Neural Network Project
% Last Edited: 4.11.2017 12:48AM

word=char(word);
word=lower(word);
y=length(word);
inp=zeros(270,1);

% sorry for the bad method...

for i=1:1:y
    switch word(i)
        case 'a'
            x=i*27;
            z=26;
            inp(x-z)=1;
        case 'b'
            z=25;
            x=i*27;
            inp(x-z)=1;
        case 'c'
            z=24;
            x=i*27;
            inp(x-z)=1;
        case 'd'
            z=23;
            x=i*27;
            inp(x-z)=1;
        case 'e'
            z=22;
            x=i*27;
            inp(x-z)=1;
        case 'f'
            z=21;
            x=i*27;
            inp(x-z)=1;
        case 'g'
            z=20;
            x=i*27;
            inp(x-z)=1;
        case 'h'
            z=19;
            x=i*27;
            inp(x-z)=1;
        case 'i'
            z=18;
            x=i*27;
            inp(x-z)=1;
        case 'j'
            z=17;
            x=i*27;
            inp(x-z)=1;
        case 'k'
            z=16;
            x=i*27;
            inp(x-z)=1;
        case 'l'
            z=15;
            x=i*27;
            inp(x-z)=1;
        case 'm'
            z=14;
            x=i*27;
            inp(x-z)=1;
        case 'n'
            z=13;
            x=i*27;
            inp(x-z)=1;
        case 'o'
            z=12;
            x=i*27;
            inp(x-z)=1;
        case 'p'
            z=11;
            x=i*27;
            inp(x-z)=1;
        case 'q'
            z=10;
            x=i*27;
            inp(x-z)=1;
        case 'r'
            z=9;
            x=i*27;
            inp(x-z)=1;
        case 's'
            z=8;
            x=i*27;
            inp(x-z)=1;
        case 't'
            z=7;
            x=i*27;
            inp(x-z)=1;
        case 'u'
            z=6;
            x=i*27;
            inp(x-z)=1;
        case 'v'
            z=5;
            x=i*27;
            inp(x-z)=1;
        case 'w'
            z=4;
            x=i*27;
            inp(x-z)=1;
        case 'x'
            z=3;
            x=i*27;
            inp(x-z)=1;
        case 'y'
            z=2;
            x=i*27;
            inp(x-z)=1;
        case 'z'
            z=1;
            x=i*27;
            inp(x-z)=1;
            
    end
    
end
% since there are no more letters in the word, we just fill the remaining
% space indexes with 1s. 
for j=(y+1):1:10
    inp(j*27)=1;
end

inp=inp';
