# ex09-leticiaoliv
ex09-leticiaoliv created by GitHub Classroom

Análise de erro.

Comparando as imagens geradas pelo código de comparação, podemos perceber que o método que melhor aproxima a solução é o Rungekutta4, 
enquanto o que pior aproxima é o método Euler.
Quanto maior é o valor de n, mais os métodos ficam eficientes, com excessão do médoto de Euler, que é o único a não aproximar tão 
bem a solução.

Analisando as imagens do erro, é possível confirmar, pela primeira imagem, que o método mais eficiente é o Rungekutta4 e o menos 
eficiente é o Euler, já os outros 3 métodos são muito semelhantes quanto aos erros.
Enquanto que, na segunda imagem, onde são comparados os erros de todos os métodos no ponto final, o Rungekutta4 continua sendo o mais
eficiente, e o Heun passa a ser o segundo melhor, com um erro consideravelmente menor que os métodos de Euler, Euler Aperfeiçoado e 
Ponto Médio, para n > 10.
