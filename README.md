# UK-BOE-energy-crisis-employment
Applied Macroeconometric Modelling -- Effects of the monetary policy lead by the Bank of England on employment in the context of the inflationary crisis of 2022


Data to use:

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





## Calibrations à rechercher pour UK, et notes sur certains choix de calibration et/ou de priors
- utilité
    - chi ($\chi$ désutilité du travail) : conformément aux recommandations de la slide 28 du cours 4, pour un paramètre de fonction d'utilité positif, on adopte une distribution gamma. Quant à la valeur moyenne $\mu$, on constate dans l'estimation du steady state que $C = 14.5$ ; donc pour que le travail puisse avoir un effet du même ordre de grandeur, on prendra $\mu = 10$

- labor
    - delta_N : separation rate
        - 3.6% (trimestriel) d'après kent2008job (cf biblio.bib)
    - eta : negotiation share --> à oublier : on postule 0.5
        - 0.104 d'après jager2020wages (cf biblio.bib)
        - la littérature semble tout de même relativement dispersée à ce sujet, et les résultats varient suivant l'approche (worker-level, firm-level, etc.) ; on pourrait peut-être envisager d'estimer ce paramètre, au-delà de la simple calibration ?
        - une loi Beta est adaptée, car $\eta$ représente une part (part du surplus attribuée aux travailleurs)
        - %% on prend pour paramètres 1.2 et 1.8, de sorte à obtenir un mode à 0.2 par la formule (P1-1) / (P1+P2-2)
        - %% apparemment, Dynare ne part pas des paramètres usuels de cette loi, mais plutôt du couple moyenne / écart-type : on met 0.2, 0.2
        - problème : cela donnait une densité non-bornée en 0 ; on prend 0.35 et 0.2, le mode de la distribution se situe à environ 0.2
    - phi : shape hiring cost function --> à oublier : c'est un paramètre complexe propre à cette forme fonctionnelle
    - u0 : taux de chômage structurel UK, pour remplacer la valeur 0.075 présente dans steady_state

- gov
    - gy
        - GDP 2022 : £m 2,505,981 -- source : UK Economic Accounts time series, Yearly National Accounts, Gross Domestic Product at market prices: Current price: Seasonally adjusted £m, https://www.ons.gov.uk/economy/grossdomesticproductgdp/timeseries/ybha/ukea
        - General Government Spending 2022 : £m 1,167,596 -- source : National Accounts, General government annual expenditure: ESA Table 11 ; https://www.ons.gov.uk/economy/governmentpublicsectorandtaxes/publicspending/datasets/esatable11annualexpenditureofgeneralgovernment
        - Je calcule donc : gy = 1,167,596 / 2,505,981 = 46.6%
    

- Monetary policy
    - rho --> à oublier éventuellement
    - phi_y
    - phi_pi

- economy
    - piss --> 0.005 correspondant aux 2% annuels cible de la BOE
    - sig --> la même que USA ??
    - y0 --> à comprendre ; SS-y à trouver pour UK


## Revoir certaines équations du modèle
- supprimer les normalisations par le steady state dans les équations définissant les variables observées
--> en fait ces normalisations pourraient être justifiées par le fait qu'on normalise la moyenne des séries à 0 dans l'estimation
