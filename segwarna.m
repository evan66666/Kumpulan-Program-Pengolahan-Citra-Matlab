function [RGB] = segwarna(nama_file)
% SEGWARNA Digunakan untuk melakukan segmentasi citra
% berdasarkan warna
% F = citra berwarna
% Keluaran:
% G = citra berwarna yang telah disegmentasi
Img = imread(nama_file);
[tinggi, lebar, dim] = size(Img);
if dim < 3
 error('Masukan harus berupa citra berwarna');
end
% Konversi ke HVS
[H,S,L] = RGBkeHSL(Img(:,:,1),Img(:,:,2),Img(:,:,3));
 
for y=1: tinggi
 for x=1: lebar 
 h = H(y,x);
 
 % Ubah warna
 if h < 11
 h = 0;
 elseif h < 32
 h = 21;
 elseif h < 54
 h = 43;
 elseif h < 116
 h = 85;
 elseif h < 141
 h = 128;
 elseif h < 185
 h = 170;
 elseif h < 202
 h = 191;
 elseif h < 223
 h = 213;
 elseif h < 244
 h = 234;
 else 
 h = 0;
 end
 
 % Ubah komponen H
 H(y,x) = h;
 
 % Ubah komponen S
 if S(y,x) >= 200
 S(y,x) = 255;
 elseif S(y,x) <= 20
 S(y,x) = 0;
 else
 S(y,x) = 128;
 end
 
 % Ubah komponen L
 if L(y,x) >= 200
 L(y,x) = 255;
 elseif L(y,x) <= 20
 L(y,x) = 0;
 else
 L(y,x) = 128;
 end
 end 
end
[R, G, B] = HSLkeRGB(H, S, L);
RGB(:,:,1) = R;
RGB(:,:,2) = G;
RGB(:,:,3) = B;
return