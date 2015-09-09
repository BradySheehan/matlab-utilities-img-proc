%
%Written by Brady Sheehan
%
function result = padString(string, numOfCharsToPad)

string2 = blanks(numOfCharsToPad);

result = horzcat(string, string2);
end