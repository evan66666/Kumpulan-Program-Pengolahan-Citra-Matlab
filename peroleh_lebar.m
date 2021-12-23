function [panjang, lebar, x1, y1, x2, y2, x3, ...
 y3, x4, y4] = peroleh_lebar(BW)
% PEROLEH_LEBAR Digunakan untuk memperoleh panjang dan 
% lebar objek yang terdapat pada
% citra biner BW.
% Hasil:
% panjang = panjang objek
% lebar = lebar objek
% (x1,y1,x2,y2) = menyatakan posisi lebar objek
% (x3,y3,x4,y4) = menyatakan posisi panjang objek
U = get_contour(BW);
n = length(U);
jarak_maks = 0;
piksel1 = 0;
piksel2 = 0;
for p=1 : n-1
 for q=p+1 : n
 jarak = sqrt((U(p,1)-U(q,1)) ^ 2 + ...
 (U(p,2)-U(q,2)) ^ 2);
 if jarak > jarak_maks
 jarak_maks = jarak;
 piksel1 = p;
 piksel2 = q;
 end
 end
end
y1 = U(piksel1, 1);
x1 = U(piksel1, 2);
y2 = U(piksel2, 1);
x2 = U(piksel2, 2);
panjang = jarak_maks;
% Cari dua titik terpanjang yang tegak lurus dengan garis 
terpanjang
maks = 0;
posx3 = -1;
posx4 = -1;
posy3 = -1;
posy4 = -1;
if (x1 ~= x2) && (y1 ~= y2)
 % Kedua titik tidak pada kolom atau baris yang sama
 grad1 = (y1 - y2) / (x1 - x2);
 grad2 = -1/grad1;
 for p=1:n-1
 for q=p+1:n
 x3 = U(p, 2); y3 = U(p, 1);
 x4 = U(q, 2); y4 = U(q, 1);
 pembagi = (x4 - x3); 
 if pembagi == 0
 continue;
 end;
 
 grad3 = (y4-y3)/(x4-x3);
 if abs(grad3-grad2) < 0.1 * abs(grad2)
 jarak = sqrt((x3-x4)^2+(y3-y4)^2);
 if jarak > maks
 maks = jarak;
 
 posx3 = x3;
posx4 = x4;
posy3 = y3;
posy4 = y4;
 end 
 end 
 end 
 end
else
 if (y1 == y2) 
 % kalau kedua titik pada baris yang sama
 grad1 = 0;
 grad2 = inf;
 
 for p=1:n-1
 for q=p+1:n
 x3 = U(p,2); y3 = U(p, 1);
 x4 = U(q,2); y4 = U(q, 1);
 deltax = (x4 - x3); 
 if (deltax < 0.01) || (deltax > 0.01)
 continue;
 end;
 
 jarak = sqrt((x3-x4)^2+(y3-y4)^2);
 if jarak > maks
 maks = jarak;
 
 posx3 = x3;
posx4 = x4;
posy3 = y3;
posy4 = y4;
 end 
 end 
 end
 else
 % kalau kedua titik pada kolom yang berbeda
 grad1 = inf;
 grad2 = 0;
 
 for p=1:n-1
 for q=p+1:n
 x3 = U(p,2); y3 = U(p, 1);
 x4 = U(q,2); y4 = U(q, 1);
deltay = (y3 - y4); 
 if (deltay < 1.0) || (deltay > 1.0)
 continue;
 end
 
 jarak = sqrt((x4-x3)^2+(y4-y3)^2);
 if jarak > maks
 maks = jarak;
 
 posx3 = x3;
 posx4 = x4;
posy3 = y3;
posy4 = y4;
 end 
 end 
 end 
 end
end
x3 = posx3;
y3 = posy3;
x4 = posx4;
y4 = posy4;
lebar = maks;