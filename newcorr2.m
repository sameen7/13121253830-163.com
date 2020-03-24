function corr = newcorr2(Ia, shift)

[X, Y] = size(Ia);
corr = corr2(Ia(1:X-shift, :), Ia(1+shift:X, :))