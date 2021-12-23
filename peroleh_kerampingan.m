function rasio = peroleh_kerampingan(BW)
% PEROLEH_KERAMPINGAN Untuk memperoleh rasio kerampingan 
% milik objek yang terdapat pada citra biner BW
[panjang, lebar] = peroleh_lebar(BW);
rasio = lebar / panjang;
