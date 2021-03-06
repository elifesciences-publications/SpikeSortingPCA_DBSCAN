%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Skin Nerve Data Analysis Software
% Ben Hoffman
% 08.24.16
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% IFF plot
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ ] = IFF_plot( IFF_out, spacing )
For_Plot_IFF = Convert_for_plot(IFF_out, spacing);
figure;
plot(For_Plot_IFF);
ax = gca;
ax.XTick = [0 20000 40000 60000 80000 100000 120000 140000 160000 180000 200000];
ax.XTickLabel = {'0','1','2','3','4','5','6','7','8','9','10'};
end

