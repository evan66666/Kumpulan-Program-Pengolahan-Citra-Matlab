function [d1, d2] = dispersi(BW)
% DISPERSI Contoh untuk menguji beberapa fitur yang
% menggunakan pusat massa. BW = Citra biner
[px, py] = centroid(BW);
U = inbound_tracing(BW);
U(length(U),:) = []; % Hapus elemen terakhir
rerata = 0;
terkecil = 99999999;
terbesar = 0;
jum_piksel = length(U); 
for j = 1 : jum_piksel
 panjang = sqrt((U(j,1)-py)^2 + (U(j,2)-px)^2);
 rerata = rerata + panjang;
 
 if panjang > terbesar
 terbesar = panjang;
 end
 
 if panjang < terkecil
 terkecil = panjang;
 end
end
a = perim2(BW);
d1 = pi * terbesar / a;
d2 = terbesar / terkecil;