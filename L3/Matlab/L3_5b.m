%L3_5b
clc
clear

states = {'0', '1', '2', '3', '4'};
G = digraph();
G = addnode(G, states);
G = addedge(G, '0', '1'); % Add other transitions with appropriate probabilities
G = addedge(G, '1', '2');
G = addedge(G, '2', '3');
G = addedge(G, '3', '4');
G = addedge(G, '4', '4');
plot(G);