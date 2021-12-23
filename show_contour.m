function show_contour(x, y, rantai_kode)
% SHOW_CONTOUR Contoh untuk menggambar kontur 
% melalui rantai kode
% Masukan fungsi ini adalah hasil
% fungsi chain_code
% 0 1 2 3 4 5 6 7 
Dx = [ +1, +1, 0, -1, -1, -1, 0, +1];
Dy = [ 0, -1, -1, -1, 0, +1, +1, +1];
U = zeros(1,2);
U(1,1) = y;
U(1,2) = x;
for p=2: length(rantai_kode)
 bilangan = rantai_kode(p) - 48;
 posx = U(p-1, 2) + Dx(bilangan + 1);
 posy = U(p-1, 1) + Dy(bilangan + 1);
 U(p, 1) = posy;
 U(p, 2) = posx;
end
% Membentuk gambar kontur
maks_x = max(U(p,2));
maks_y = max(U(p,1));
D = zeros(maks_y, maks_x);
for p=1: length(U)
 D(U(p,1), U(p,2)) = 1;
end
imshow(D);