
%Making the Matlab Images.
close all



for i = 1:60        
figure(i)
set(i,'units','inches','position',[0 0 15 15],'color','white')

%Column 1
    %Image stuff
    subplot(2,3,[1])
        imagesc(two_wafer_signal{i+66}/two_wafer_signal_max)
        axis image
        title(sprintf('Delay time: %.4f',Delay_times(401-30+i)))
        set(gca,'fontweight','bold','Linewidth',2,'Clim',[-.35 .6])
    %Line stuff
    subplot(2,3,4)
        hold on
        box on
        grid on
        plot(Delay_times(401-96:401-96+139),Final_wavefrm_two_wafer/two_wafer_signal_max,'b')
        Line_min = min(Final_wavefrm_two_wafer/two_wafer_signal_max);
        Line_max = max(Final_wavefrm_two_wafer/two_wafer_signal_max);
        line([Delay_times(401-30+i) Delay_times(401-30+i)],[Line_min Line_max],'Color','red')
        xlabel('Delay time (ps)')
        ylabel('E-field (norm.)')
        set(gca,'Linewidth',3,'fontweight','bold')
        axis tight
        title('2 Wafer THz Attenuation')
        hold off      

%Column 2
    %Image stuff
    subplot(2,3,[2])
        imagesc(one_wafer_signal{i+57}/one_wafer_signal_max)
        axis image
        title(sprintf('Delay time: %.4f',Delay_times(401-30+i)))
        set(gca,'fontweight','bold','Linewidth',2,'Clim',[-.35 .6])
    %Line stuff
    subplot(2,3,5)
        hold on
        box on
        grid on
        plot(Delay_times(401-87:401-87+139),Final_wavefrm_one_wafer/one_wafer_signal_max,'b')
        Line_min = min(Final_wavefrm_one_wafer/one_wafer_signal_max);
        Line_max = max(Final_wavefrm_one_wafer/one_wafer_signal_max);
        line([Delay_times(401-30+i) Delay_times(401-30+i)],[Line_min Line_max],'Color','red')
        xlabel('Delay time (ps)')
        ylabel('E-field (norm.)')
        set(gca,'Linewidth',3,'fontweight','bold')
        axis tight
        title('1 Wafer THz Attenuation')
        hold off      



%Column 3
    %Image stuff
    subplot(2,3,[3])
        imagesc(no_wafer_signal{i+43}/no_wafer_signal_max)
        axis image
        title(sprintf('Delay time: %.4f',Delay_times(401-30+i)))
        set(gca,'fontweight','bold','Linewidth',2,'Clim',[-.35 .6])
    %Line stuff
    subplot(2,3,6)
        hold on
        box on
        grid on
        plot(Delay_times(401-73:401-73+137),Final_wavefrm_no_wafer/no_wafer_signal_max,'b')
        Line_min = min(Final_wavefrm_no_wafer/no_wafer_signal_max);
        Line_max = max(Final_wavefrm_no_wafer/no_wafer_signal_max);
        line([Delay_times(401-30+i) Delay_times(401-30+i)],[Line_min Line_max],'Color','red')
        xlabel('Delay time (ps)')
        ylabel('E-field (norm.)')
        set(gca,'Linewidth',3,'fontweight','bold')
        axis tight
        title('no THz Attenuation')
        hold off      
end

    
%Making the GIF   

filename = sprintf('%s\\THz_Gif_slow.gif',pwd);                                 %Making the name of the file.
for n = 1:60                                                              %Looping over all images
    drawnow                                                                %Start making the gif
frame = getframe(n);                                                       %steal the frame number 
im = frame2im(frame);                                                      %turn that frame into an image
[A,map] = rgb2ind(im,256); 
	if n == 1;
		imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',.75);      %the first image in the .GIF has to create the .GIF file
	else
		imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',.75); %Adding images to the .GIF file
    end
end

close all
