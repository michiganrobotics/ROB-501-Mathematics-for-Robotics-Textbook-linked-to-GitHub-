function latex = mat2LatexArrayMatrix(mat,f,tol,zerof)
%
%  This function converts a matrix to a string 
%  formatted for LaTeX table.
%
%  latex_array = mat2latex(mat,f,tol,zerof);
%
% [required]
%    mat = matlab matrix 
% [optional] 
%      f = format command string (e.g. '4.3f') (default '3.4f');
%    tol = tolerence for zero (default eps)
%  zerof = special format for zero (e.g. '1f') (default f)
%

if nargin < 2
  f = '%3.4f';
  tol=eps;
  zerof = f;
elseif nargin < 3
  if ~isstr(f)
    error('String Format must be a string')
  end
  f = ['%',f];
  tol=eps;
  zerof = f;
elseif nargin <4
  if ~isstr(f)
    error('String Format must be a string')
  end
  f = ['%',f];
  zerof = f;
else  
  if ~isstr(f) & ~isstr(zerof)
    error('String Format must be a string')
  end
  f = [',',f];
  zerof = [',',zerof];
end

[r,c]=size(mat);

latex=['\begin{array}{'];
for i=1:c
  latex=[latex,'r'];
end
latex=[latex,'}'];
for i=1:r-1
  for j=1:c-1
    if abs(mat(i,j))<tol
      latex=[latex,sprintf(zerof,0),'&'];
    else      
      latex=[latex,sprintf(f,mat(i,j)),'& '];
    end
  end
  if abs(mat(i,c))<tol
    latex=[latex,sprintf(zerof,0),'\\'];
  else
    latex=[latex,sprintf(f,mat(i,c)),'\\'];
  end
end

for j=1:c-1
  if abs(mat(r,j))<tol
    latex=[latex,sprintf(zerof,0),'& '];
  else
    latex=[latex,sprintf(f,mat(r,j)),'& '];
  end
end
if abs(mat(r,c))<tol
  latex=[latex,sprintf(zerof,0),'\end{array}'];
else
  latex=[latex,sprintf(f,mat(r,c)),'\end{array}'];
end
%end

latex=strrep(latex,'e+00',' ');

