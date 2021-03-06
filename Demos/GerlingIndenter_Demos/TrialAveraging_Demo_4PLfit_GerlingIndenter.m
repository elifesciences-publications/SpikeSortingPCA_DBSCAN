%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Trial Averaging, Dose response Curves, and Non-Linear regression
% Ben Hoffman
% 08.24.16
%
% Modeled using 4PL
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% -------- Set figure title names and dock all figures
dataName_agg = '041917 B2ARflox 52 lleg'; %add general name
dataName1 = '110617 b2arflox trial1 analyzed'; % add Trial 1 file name!
dataName2 = '100617 ADRB2 flox 143 fiber1 trial2 analyzed'; % add Trial 2 file name! (If necessary)
dataName3 = '091417 ADRB2 flox 112 fiber2 trial3 analyzed'; % add Trial 3 file name! (If necessary)
dataName4 = '041916 B2ARflox 37 Rleg leg2 trial4 analyzed'; % add Trial 4 file name! (If necessary)
set(0,'DefaultFigureWindowStyle','docked')
%% -------- Step 1: Prepare Data from each trial for averaging
%  -------- Step 1: Number of Trials
Trials = 1; % ENTER NUMBER OF TRIALS
%%  -------- Step 1-1: Load Trial 1, Round Disp
[Dy_Trial1,St_Trial1] = import_data(dataName1);
Dynamic = Dy_Trial1; Static = St_Trial1; 
%%  -------- Step 1-2: Load Trial 2, Round Disp
[Dy_Trial2,St_Trial2] = import_data(dataName2);
Dynamic = [Dynamic; Dy_Trial2]; Static = [Static; St_Trial2];
%%  -------- Step 1-3: Load Trial 3, Round Disp
[Dy_Trial3,St_Trial3] = import_data(dataName3);
Dynamic = [Dynamic; Dy_Trial3]; Static = [Static; St_Trial3];
%%  -------- Step 1-4: Load Trial 4, Round Disp
[Dy_Trial4,St_Trial4] = import_data(dataName4);
Dynamic = [Dynamic; Dy_Trial4]; Static = [Static; St_Trial4];
%% -------- Step 2: Combine trials, perform stats
%  -------- Step 2-1: Generate IFF values
[Dynamic, Static] = generate_IFF(Dynamic, Static);
%  -------- Step 2-2: Generate aggregate means and standard deviations from rounded displacement grouping
[Dynamic_agg, Static_agg] = aggregate_trials(Dynamic, Static);
%% -------- Step 3: Perform Sigmoid fit
[Dynamic_IFF_fit, Dynamic_gof, Static_IFF_fit, Static_gof] = sig_fit(Dynamic_agg, Static_agg, dataName1); % dataName1 must have the word 'trial'
[Dynamic_IFF_fit_force, Dynamic_gof_force, Static_IFF_fit_force, Static_gof_force] = sig_fit_force(Dynamic_agg, Static_agg, dataName1);
%% -------- Step 4: Save data to .xlsx
% Choose Mac or PC script
% For Mac
save_boltz_data(Dynamic_IFF_fit, Dynamic_gof, Dynamic_agg, Static_IFF_fit, Static_gof, Static_agg, dataName_agg)
% For PC
%save_boltz_data_windows(Dynamic_IFF_fit, Dynamic_gof, Dynamic_agg, Static_IFF_fit, Static_gof, Static_agg, dataName_agg)
