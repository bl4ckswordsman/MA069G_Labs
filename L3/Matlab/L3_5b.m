%L3_5b
clc
clear

%LÖSNING FINNS GRAFISKT PÅ RAPPORTEN
states = {'0', '1', '2', '3', '4'};
G = digraph();
G = addnode(G, states);
G = addedge(G, '0', '0'); G = addedge(G, '0', '1');
G = addedge(G, '1', '0'); G = addedge(G, '1', '1'); G = addedge(G, '1', '2');
G = addedge(G, '2', '2'); G = addedge(G, '2', '3'); G = addedge(G, '2', '1');
G = addedge(G, '3', '2'); G = addedge(G, '3', '3');
G = addedge(G, '3', '4'); G = addedge(G, '4', '3');
G = addedge(G, '4', '4');
h = plot(G);

labLamb1 = {'\lambda'};
labeledge(h, [1 2 3 4], [2 3 4 5], labLamb1);
labelLambda = {'1-\lambda', '1-\mu-\lambda', '1-2\mu-\lambda', '1-2\mu-\lambda', '1-2\mu'};
labeledge(h, [1 2 3 4 5], [1 2 3 4 5], labelLambda);
labMu = {'\mu', '2\mu', '2\mu', '2\mu'};
labeledge(h, [2 3 4 5], [1 2 3 4], labMu);

