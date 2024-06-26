[output_table,~,T] = call_dbnomics('OECD/QNA/GBR.B1_GE.CQRSA.Q','OECD/QNA/GBR.P31DC.CQRSA.Q','OECD/QNA/GBR.P51.CQRSA.Q','OECD/QNA/GBR.B1_GE.DNBSA.Q','OECD/MEI/GBR.LRUN64TT.STSA.Q','OECD/KEI/IR3TIB01.GBR.ST.Q');
% Output, Consumption, Investment, Deflator, Unemployment rate, Nominal Rate

% select non NaN ids
idx 			= find(~isnan(sum(output_table(:,2:end),2)));
%% Filtrage des NaN
output_table 	= output_table(idx,:);
T				= T(idx);


% we normalize to one prices and in population for 2015
id2015 = find(T==2015);
def = output_table(:,5)/output_table(id2015,5); % def for deflator


%% taking in real growth rates per capita
gy_obs  = diff(log(output_table(:,2)./(def)));
gc_obs  = diff(log(output_table(:,3)./(def)));
gi_obs  = diff(log(output_table(:,4)./(def)));

% unemployment rate
u_obs = output_table(2:end,6)/100;

% inflation rate
pi_obs  = diff(log(def));
% quarterly interest rate
r_obs	= output_table(2:end,7)/400;
    % division par 100 pour passer des pourcents à l'unité
    % division par 4 pour passer en trimestriel (i.e. le trimestre devient
    %   la période de référence pour ce taux)

T = T(2:end);

% save into myobsGBR.mat
save myobsGBR gy_obs gc_obs gi_obs u_obs T pi_obs r_obs;

%% Traces

figure;
subplot(2,2,1)
plot(T,gy_obs)
xlim([min(T) max(T)]);
title('output growth')
subplot(2,2,2)
plot(T,gc_obs)
xlim([min(T) max(T)]);
title('consumption growth')
subplot(2,2,3)
plot(T,gi_obs)
xlim([min(T) max(T)]);
title('investment growth')
subplot(2,2,4)
plot(T,u_obs)
xlim([min(T) max(T)]);
title('unemployment rate')


figure;
subplot(1,3,1)
plot(T,gy_obs)
xlim([min(T) max(T)]);
title('output growth')
subplot(1,3,2)
plot(T,pi_obs)
xlim([min(T) max(T)]);
title('inflation rate')
subplot(1,3,3)
plot(T,r_obs)
xlim([min(T) max(T)]);
title('nominal rate')
