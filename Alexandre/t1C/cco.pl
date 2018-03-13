% predicado: "disciplina(arg1, arg2, arg3)"
%   arg1 - fase
%   arg2 - sigla
%   arg3 - nome

disciplina(1, eel5105, 'Circuitos e Técnicas Digitais').
disciplina(1, ine5401, 'Introdução a Computação').
disciplina(1, ine5402, 'Programação Orientada a Objetos I').
disciplina(1, ine5403, 'Fundamentos de Matemática Discreta para Computação').
disciplina(1, mtm5161, 'Cálculo A').

disciplina(2, ine5404, 'Programação Orientada a Objetos II').
disciplina(2, ine5405, 'Probabilidade e Estatística').
disciplina(2, ine5406, 'Sistemas Digitais').
disciplina(2, ine5407, 'Ciência, Tecnologia e Sociedade').
disciplina(2, mtm5512, 'Geometria Analítica').
disciplina(2, mtm7174, 'Cálculo B para Computação').

disciplina(3, ine5408, 'Estruturas de Dados').
disciplina(3, ine5409, 'Cálculo Numérico').
disciplina(3, ine5410, 'Programação Concorrente').
disciplina(3, ine5411, 'Organização de Computadores').
disciplina(3, mtm5245, 'Álgebra Linear').

disciplina(4, ine5412, 'Sistemas Operacionais I').
disciplina(4, ine5413, 'Grafos').
disciplina(4, ine5414, 'Redes de Computadores I').
disciplina(4, ine5415, 'Teoria da Computação').
disciplina(4, ine5416, 'Paradigmas de Programação').
disciplina(4, ine5417, 'Engenharia de Software I').

disciplina(5, ine5418, 'Computação Distribuida').
disciplina(5, ine5419, 'Engenharia de Software II').
disciplina(5, ine5420, 'Computação Gráfica').
disciplina(5, ine5421, 'Linguagens Formais').
disciplina(5, ine5422, 'Redes de Computadores II').
disciplina(5, ine5423, 'Banco de dados I').

disciplina(6, ine5424, 'Sistemas Operacionais II').
disciplina(6, ine5425, 'Modelagem e Simulação').
disciplina(6, ine5426, 'Construção de Compiladores').
disciplina(6, ine5427, 'Planejamento e Gestão de Projetos').
disciplina(6, ine5430, 'Inteligência Artificial').
disciplina(6, ine5453, 'Introdução ao Trabalho de Conclusão de Curso').

disciplina(7, ine5428, 'Informática e Sociedade').
disciplina(7, ine5429, 'Segurança de Computadores').
disciplina(7, ine5431, 'Sistemas Multimidia').
disciplina(7, ine5432, 'Bancos de Dados II').
disciplina(7, ine5433, 'Trabalho de Conclusão de Curso I').

disciplina(8, ine5434, 'Trabalho de Conclusão de Curso II').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% predicado: "prerequisito(arg1, arg2)"
%   arg1 - disciplina de fase anterior (prerequisito para cursar disciplina arg2)
%   arg2 - disciplina de fase posterior (pode ser cursada somente após a conclusão da disciplina arg1)

% segunda fase
prerequisito(ine5402, ine5404).
prerequisito(mtm5161, ine5405).
prerequisito(eel5105, ine5406).
prerequisito(mtm5161, mtm7174).

% terceira fase
prerequisito(ine5404, ine5408).
prerequisito(mtm5512, ine5409).
prerequisito(mtm7174, ine5409).
prerequisito(ine5404, ine5410).
prerequisito(ine5406, ine5411).
prerequisito(mtm5512, mtm5245).

% quarta fase
prerequisito(ine5410, ine5412).
prerequisito(ine5411, ine5412).
prerequisito(ine5403, ine5413).
prerequisito(ine5408, ine5413).
prerequisito(ine5404, ine5414).
prerequisito(ine5403, ine5415).
prerequisito(ine5408, ine5415).
prerequisito(ine5408, ine5416).
prerequisito(ine5408, ine5417).

% quinta fase
prerequisito(ine5412, ine5418).
prerequisito(ine5414, ine5418).
prerequisito(ine5417, ine5419).
prerequisito(ine5408, ine5420).
prerequisito(mtm5245, ine5420).
prerequisito(mtm5512, ine5420).
prerequisito(mtm7174, ine5420).
prerequisito(ine5408, ine5421).
prerequisito(ine5415, ine5421).
prerequisito(ine5414, ine5422).
prerequisito(ine5408, ine5423).

% sexta fase
prerequisito(ine5412, ine5424).
prerequisito(ine5405, ine5425).
prerequisito(ine5421, ine5426).
prerequisito(ine5419, ine5427).
prerequisito(ine5413, ine5453).
prerequisito(ine5415, ine5453).
prerequisito(ine5419, ine5453).
prerequisito(ine5416, ine5430).
prerequisito(ine5405, ine5430).

% sétima fase
prerequisito(ine5407, ine5428).
prerequisito(ine5403, ine5429).
prerequisito(ine5414, ine5429).
prerequisito(ine5415, ine5429).
prerequisito(ine5414, ine5431).
prerequisito(ine5423, ine5432).
prerequisito(ine5427, ine5433).
prerequisito(ine5453, ine5433).

% oitava fase
prerequisito(ine5433, ine5434).
