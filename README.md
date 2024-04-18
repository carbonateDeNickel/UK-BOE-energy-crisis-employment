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
