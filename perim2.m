function hasil = perim2(BW)
% PERIM2 Untuk menghitung perimeter suatu objek pada
% BW (citra biner) dengan menggunakan
% chain code
%
% hasil menyatakan hasil perhitungan perimeter
U = inbound_tracing(BW);
kode_rantai = chain_code(U);
jum_genap = 0;
jum_ganjil = 0;
for p=1: length(kode_rantai)
 kode = kode_rantai(p);
 if (kode == '0') || (kode == '2') || (kode == '4') || ...
 (kode == '6') || (kode == '8')
 jum_genap = jum_genap + 1;
 else
 jum_ganjil = jum_ganjil + 1;
 end
end
hasil = jum_genap + jum_ganjil * sqrt(2);
