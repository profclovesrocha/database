select a.data_atendimento,a.status_atendimento, p.nome nome_pet,p.raca, t.nome nome_tutor, t.telefone telefone_tutor,s.descricao_servico, s.valor 
from atendimento a
	inner join pet p
		on a.cod_pet = p.cod_pet
	inner join tutor t
		on p.cod_tutor = t.cod_tutor
	inner join servico s
		on s.cod_servico = a.cod_servico
order by a.data_atendimento, p.nome;