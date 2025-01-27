require_relative '../lib/trabalhador'
require_relative '../lib/folhaponto'

trabalhador2 = Trabalhador.new(2, "Ageu Leandro", "Software Engineer", "09:00 - 12:00 e 13:00 - 18:00", "985456/0001")

folha2 = FolhaPonto.new(trabalhador2)

folha2.adicionar_ponto("27-01-2025", "09:00", "13:00", "14:00", "18:00")
folha2.adicionar_ponto("28-01-2025", "09:00", "13:00", "14:00", "18:00")
folha2.adicionar_ponto("29-01-2025", "09:00", "13:00", "14:00", "18:00")
folha2.adicionar_ponto("30-01-2025", "09:00", "13:00", "14:00", "18:00")
folha2.adicionar_ponto("31-01-2025", "09:00", "13:00", "14:00", "18:00")

#folha2.listar_pontos
folha2.relatorio_periodo("27-01-2025", "31-01-2025")
folha2.total_horas_periodo("27-01-2025", "31-01-2025")

