d = dir;

fprintf('Running...\n')
j = 1;
for i = 1:1:size(d,1)
    isfile = contains(d(i).name,'.mlx')';
    if isfile == 1
        b = d(i).name(1:end-4);
        b = [b,'.html'];
        c = d(i).name;
        matlab.internal.liveeditor.openAndConvert(c,b);
        fnames(j,1) = {d(i).name};
        j = j+1;
    end
end
fprintf('Converted %d .mlx files to .html.\n',j-1)
clear b c d fnames i isfile j
