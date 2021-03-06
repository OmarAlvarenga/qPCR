function dat = readSOPdata(filename)

fid = fopen(filename);
ts = textscan(fid,'%s\t');
ind = strfind(ts{1},'Threshold');
ind = find(~cellfun(@isempty,ind));
ts{1}(1:ind(1))=[];

nreaction = length(ts{1})/5;

for ii=1:nreaction
    tmp = str2num( ts{1}{(ii-1)*5+4});
    if isempty(tmp)
        dat(ii)=NaN;
    else
        dat(ii) = tmp;
    end
end
