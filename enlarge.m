function [pic,V] = enlarge( img,eigvalues )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%im

img1 = img;
img1 = imresize(img1,[32,32]);
conv1 = cov(img1);
Sm = diag(eigvalues);
%[Vk,D] = eig(conv1);
[Uk,Sk,Vk] = svd(img1);
Sk(Sk<10e-10)=Sm(Sk<10e-10);
Q = orth((Vk));
%Sk = diag(eigvalues);
P = img1;
for i = 9:32
[U,S,V] = svd(P);
Z = U*Sk;
C = rand(1,32);
g = rand(1,32);
%size(C)
for j = 1:100
%size(C)
%size(Q)
vo = C*Q;
%size(conv1)
%size(vo)
%vo
%conv1
%vo

chain1 = (conv1*vo'-eigvalues(i)*vo');
%chain2 = (conv1*Q-eigvalues(i)*Q);
%size(chain1)
%size(chain2)
F = conv1*(C*Q)'-eigvalues(i)*(C*Q)';

losst(j) = norm(chain1,2);
for sp = 1:32
%chain2 = conv1*Q(sp,:)'-eigvalues(i)*Q(sp,:)';
%size(g(sp))
%size(2*chain1'*chain2)
w = Q(sp,:);
v = conv1*w'-eigvalues(i)*w';
g(sp) = v'*F+F'*v;%+2*C(sp);
%end
%g = conv1

end

C = C - 10e-2*g;
end
%size(C)
%size(Q)
new_v = C*Q;
%size(new_v)
%size(Vk(i,:))
V(:,i)=new_v;
P = Z*V';

end
%%
pic = P;





