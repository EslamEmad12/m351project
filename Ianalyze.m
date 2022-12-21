## Copyright (C) 2022 Mohamed Khaled
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} Ianalyze (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mohamed Khaled <Mohamed Khaled@DESKTOP-RKS24HO>
## Created: 2022-12-21

function z = Ianalyze (f,a,b,exactsolution)
exactsol = 100;
array = [1,2,3,4,5,6,7,8,9,10];
for i = 1:10

tsol = Trap (a,b,f,array(i));
ssol =Simp (a,b,f,array(i));
msol = MPoint (a,b,f,array(i));

errtrap = abs(exactsolution - tsol);
errsimp = abs(exactsolution - ssol);
errmid = abs(exactsolution - msol);

error = [errtrap,errsimp,errmid]
z = min(min(error));
end
plot(array(:),exactsolution,array(:),tsol,array(:),ssol,array(:),msol);
legend('exactsolution','tsolution','ssolution','msolution');
if(z==min(error(:,1)))
display('trapezodial is accurate');
elseif(z==min(error(:,2)))
display('simpson is accurate');
else
display('midpoint is accurate');
end
endfunction

