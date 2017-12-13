%la(:,:,1)=la1;
%la(:,:,2)=la2;
%la(:,:,3)=la3;
for   j =1:1
    wbs = x(j,:,:,:);
    wbs = reshape(wbs,[8,8,3]);
for i = 1:3

    layer = wbs(:,:,i);
    layer = double(layer)/255-0.5;
   % eig1 = la(j,:,i);
   eig1 = rand(32,1);
    [re(:,:,i),opd(:,:,i)] = enlarge(layer,eig1);

end
re = re +0.5;
%re = ((re)*255);
%imwrite(re,['E:\desk\pixel-recursive-super-resolution-master\pixel-recursive-super-resolution-master\data\ALL\' num2str(j) '.jpg']); 
end
    %%
    %s = double(wps);
    %s11 = s(:,:,1)/255;
    %cubic(:,:,1) = imresize(s11,[32,32]);
    %s11 = s(:,:,2)/255;
    %cubic(:,:,2) = imresize(s11,[32,32]);
    %s11 = s(:,:,3)/255;
    %cubic(:,:,3) = imresize(s11,[32,32]);