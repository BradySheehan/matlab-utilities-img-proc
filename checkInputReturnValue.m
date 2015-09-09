function varargout=checkInputReturnValue(in,keyword,numArgs,defaultValue)
% Function will parse a varargin arguement list and return numArgs values
% that appear after the varargin keyword.  If the keyword does not exist,
% the value defaultValue will be assigned in its place.
if nargin < 4
    defaultValue = repmat([],1,numArgs);
end

if ~iscell(defaultValue) || iscellstr(defaultValue)
    defaultValue = {defaultValue};
end

ind = find(strcmpi(in,keyword));
if ~isempty(ind)
    for i=1:numArgs
        val = in{ind+i};
        if all(isnumeric(val)) || ischar(val) || iscellstr(val) || isstruct(val)
            defaultValue{i} = val;
        end
    end
end

varargout(1:numArgs) = defaultValue(1:numArgs);
end

%
%example use
%create a function like this
function result = temp_function(input1, varargin)
if nargin < 1
    error('Not enough input arguments')
end
num = 1;
%num is the number of variables to grab in varargin after it finds the
%'nameofvar' string.
%the next input is the default input value

var1 = checkInputReturnValue(varargin, 'nameofvar1', num, 'default1');
var2 = checkInputReturnValue(varargin, 'nameofvar2', num, 'default2');
var3 = checkInputReturnValue(varargin, 'nameofvar3', num, 'default3');
var4 = checkInputReturnValue(varargin, 'nameofvar4', num, default4);
%
end

