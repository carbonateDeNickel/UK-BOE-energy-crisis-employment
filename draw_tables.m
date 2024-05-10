function [] = draw_tables(var_names,M_,T,xlimval,varargin)
%DRAW_TABLES Summary of this function goes here
%   Les vraies données sont dans varargin, qui est un tenseur
%   tridimensionnel : la 1ere dimension (plan horizontal) correspond à
%   une variante, un scénario ; cela correspond à la variable themat dans
%   la boucle de niveau inférieur. La 2e dimension (donc une ligne
%   nous faisant face comme un seul élément, dans une visualisation 3D)
%   correspond à la variable à étudier dans ce scénario ; ces variables
%   sont parcourues par ix (pour var_names) et idy (pour les données
%   d'origine, i.e. varargin et M_ qui donne la correspondance entre tous
%   les noms dans leur version texte et leur version LaTeX). La 3e
%   dimension parcourt la série temporelle.
n = size(var_names,2);
nv = length(varargin);

ny = ceil(sqrt(n));
nx = ceil(n/ny);
figure;
for ix = 1:n
    subplot(nx,ny,ix)
    hold on;
    idy = strmatch(var_names{ix},M_.endo_names,'exact');
    if isempty(idy); error(['Variable ' var_names{ix} ' does not exist.']); end;
    for iy = 1:nv
       themat = varargin{iy};
       plot(T,themat(idy,:),'linewidth',1)
    end
    title(M_.endo_names_tex{idy})
    grid on;
    hold off;
    if ~isempty(xlimval)
        xlim(xlimval)
    end
end
end

