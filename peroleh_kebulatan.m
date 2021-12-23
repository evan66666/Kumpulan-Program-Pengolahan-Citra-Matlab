function rasio = peroleh_kebulatan(BW)
% PEROLEH_KEBULATAN Untuk memperoleh rasio kebulatan milik objek
% yang terdapat pada citra biner BW
p = perim2(BW);
a = luas2(BW);
rasio = 4 * pi * a / (p^2);
