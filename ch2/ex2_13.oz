% 13. 単一化
% ３つの単一化
X=[a Z]
Y=[W b]
X=Y

% どんな順序に単一化しても，変数X, Y, Z, Wが同じ値に束縛されることを示せ

Y = '|'(1:W '|'(1:Z 2:nil))
unity(X, '|'(1:W '|'(1:Z 2:nil)))
Wがaに束縛
Zがbに束縛

% http://d.hatena.ne.jp/mzp/20080102/ctmcp