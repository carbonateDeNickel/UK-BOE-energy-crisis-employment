# UK-BOE-energy-crisis-employment
Applied Macroeconometric Modelling -- Effects of the monetary policy lead by the Bank of England on employment in the context of the inflationary crisis of 2022


Authors : Côme Pollet (\[cpltensae\]), Nicolas Prat (carbonateDeNickel), Gabriel Sklénard (Gabriel Sklénard)



## Calibrations pour UK, et notes sur certains choix de calibration et/ou de priors
- utilité
    - chi ($\chi$ désutilité du travail) : conformément aux recommandations de la slide 28 du cours 4, pour un paramètre de fonction d'utilité positif, on adopte une distribution gamma. Quant à la valeur moyenne $\mu$, on constate dans l'estimation du steady state que $C = 14.5$ ; donc pour que le travail puisse avoir un effet du même ordre de grandeur, on prendra $\mu = 10$

- labor
    - delta_N : separation rate
        - 3.6% (trimestriel) d'après kent2008job (cf biblio.bib)
    - u0 : taux de chômage structurel UK, pour remplacer la valeur 0.075 présente dans steady_state
        - la valeur moyenne de notre série u_obs est 5.8567 %
        - prendre la valeur moyenne de la série est intrinsèquement cohérent avec l'équation liant u et u_obs dans le modèle, sachant que l'estimation considère u_obs diminué de sa moyenne : u_obs = u - steady_state(u)
    - gamma : taux de remplacement de l'assurance chômage UK
        - 61 %
        - Source : https://www.unedic.org/storage/uploads/2023/07/27/Comparatif-assurance-chomage-15-pays-europeens-v05072019_uid_64c231a092b75.pdf

- gov
    - gy
        - GDP 2022 : £m 2,505,981 -- source : UK Economic Accounts time series, Yearly National Accounts, Gross Domestic Product at market prices: Current price: Seasonally adjusted £m, https://www.ons.gov.uk/economy/grossdomesticproductgdp/timeseries/ybha/ukea
        - General Government Spending 2022 : £m 1,167,596 -- source : National Accounts, General government annual expenditure: ESA Table 11 ; https://www.ons.gov.uk/economy/governmentpublicsectorandtaxes/publicspending/datasets/esatable11annualexpenditureofgeneralgovernment
        - On calcule donc : gy = 1,167,596 / 2,505,981 = 46.6%
    

- Monetary policy
    - rho --> à oublier éventuellement
    - phi_y
    - phi_pi

- economy
    - piss
        - 0.005 correspondant aux 2% annuels cible de la BOE
    - y0
        - le toy model utilise le PIB US 2022 (dollars actuels) : 25 Trillions (échelle courte)
        - on prendra donc le PIB UK 2022 (livres actuelles) : 2,506.17 Billion (échelle courte)
        - source : https://data.worldbank.org/indicator/NY.GDP.MKTP.CN

- carbon and sustainability
    - sig
        - 2022 UK carbon intensity : 190 tonnes CO2 / M£ de valeur ajoutée, i.e. 0.190 Gt / P£ i.e. 0.190 Gt / Trillion £
        - source : https://www.ons.gov.uk/economy/environmentalaccounts/bulletins/greenhousegasintensityprovisionalestimatesuk/provisionalestimates2022
    - tau0
        - 87.52 € / tonne CO2e en moyenne en 2021, en Net Effective Carbon Rate, qui comprend le prix ETS et les droits d'accises moins les subventions aux énergies fossiles
        - source : https://www.oecd.org/tax/tax-policy/carbon-pricing-united-kingdom.pdf
        - on prend un taux de change 1 EUR = 0.87 GBP tenant lieu de moyenne du taux de change entre 2021 et 2023
        - d'où 87.52 * 0.87 = 76.14 £ / tonne CO2e



## Alternative data to use

- about labor -- we focus on Great Britain, which allows us to evade the potential issues of Northern Ireland facing a slightly different situation due to its border with the Republic of Ireland and the fact of not being part of the same island
    - ONS/LMS/LF43.M : LFS: Employment rate: Great Britain: Aged 16-64: All: %: SA – Monthly
    - ONS/LMS/LF4G.M : LFS: Employment rate: Great Britain: Aged 16-64: Female: %: SA – Monthly
    - ONS/LMS/YCLO.M : LFS: Employment rate: Great Britain: Aged 16-64: Male: %: SA – Monthly

- about monetary policy -- the following time series only cover end of 2008 to present days. There are empty lines, which can be interpreted as prolonging the previous rate
    - BOE/42705/YWMB82C : Monthly rate of Central Bank sterling operational lending facility for monetary policy not seasonally adjusted (in percent) : 11-2008 to 08-2022
    - BOE/42705/YWMB83C : Monthly rate of Central Bank sterling operational deposit facility for monetary policy not seasonally adjusted (in percent) : 10-2008 to 08-2022

- about GDP
    - OECD/QNA/GBR.B1_GS1.LNBQRSA.Q : United Kingdom – Gross domestic product – National currency, chained volume estimates, national reference year, quarterly levels, seasonally adjusted – Quarterly

- about consumption
    - OECD/QNA/GBR.P3S1.CQRSA.Q : United Kingdom – Final consumption expenditure (P3S1) – National currency, current prices, quarterly levels, seasonally adjusted – Quarterly

- about investment
    - OECD/QNA/GBR.P51.CQRSA.Q : United Kingdom – Gross fixed capital formation – National currency, current prices, quarterly levels, seasonally adjusted – Quarterly

- about inflation
    - energy
        - ONS/MM23/CSL7.M : CPIH 1Mth: Energy (G) 2015=100 – Monthly -- this seems to be actually inflation, not CPI
        - ONS/MM23/DK9T.M : CPI INDEX: Energy (G) 2015=100 – Monthly
    - non-energy
        - ONS/MM23/DKC5.M : CPI INDEX: Excluding energy (SP) 2015=100 – Monthly