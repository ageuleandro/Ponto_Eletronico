require 'date'

class Folhaponto
  attr_accessor :trabalhador, :registros

  def initialize(trabalhador)
    @trabalhador = trabalhador
    @registros = []
  end

  def adicionar_ponto(data, entrada, saida_almoco, volta_almoco, saida)
    ponto = {
      data: data,
      entrada: entrada,
      saida_almoco: saida_almoco,
      volta_almoco: volta_almoco,
      saida: saida,
      total_horas: calcular_total_horas(entrada, saida_almoco, volta_almoco, saida),
      horas_extras: calcular_horas_extras(entrada, saida_almoco, volta_almoco, saida)
    }
    @registros << ponto
    puts "Ponto adicionado com sucesso para #{@trabalhador.nome} na data #{data}."
  end

  def listar_pontos
    puts "\n=== Registros de Ponto para #{@trabalhador.nome} ==="
    @registros.each_with_index do |ponto, index|
      puts "#{index + 1}. Data: #{ponto[:data]}, Entrada: #{ponto[:entrada]}, Saída para Almoço: #{ponto[:saida_almoco]}, Volta do Almoço: #{ponto[:volta_almoco]}, Saída: #{ponto[:saida]}"
    end
  end

  def relatorio_periodo(data_inicio, data_fim)
    puts "\n=== Relatório de Pontos: #{data_inicio} a #{data_fim} ==="
    registros_filtrados = @registros.select do |ponto|
      Date.parse(ponto[:data]) >= Date.parse(data_inicio) && Date.parse(ponto[:data]) <= Date.parse(data_fim)
    end

    registros_filtrados.each_with_index do |ponto, index|
      puts "#{index + 1}. Data: #{ponto[:data]}, Entrada: #{ponto[:entrada]}, Saída para Almoço: #{ponto[:saida_almoco]}, Volta do Almoço: #{ponto[:volta_almoco]}, Saída: #{ponto[:saida]}, Total de Horas: #{ponto[:total_horas].round(2)}, Horas Extras: #{ponto[:horas_extras].round(2)}"
    end
  end

  # Total de horas trabalhadas e horas extras em um período
  def total_horas_periodo(data_inicio, data_fim)
    registros_filtrados = @registros.select do |ponto|
      Date.parse(ponto[:data]) >= Date.parse(data_inicio) && Date.parse(ponto[:data]) <= Date.parse(data_fim)
    end

    total_horas = registros_filtrados.sum { |ponto| ponto[:total_horas] }
    total_extras = registros_filtrados.sum { |ponto| ponto[:horas_extras] }

    puts "\n=== Total de Horas no Período: #{data_inicio} a #{data_fim} ==="
    puts "Total de Horas Trabalhadas: #{total_horas.round(2)} horas"
    puts "Total de Horas Extras: #{total_extras.round(2)} horas"
  end

  private

  def calcular_total_horas(entrada, saida_almoco, volta_almoco, saida)
    horas_manha = (hora_em_minutos(saida_almoco) - hora_em_minutos(entrada)) / 60.0
    horas_tarde = (hora_em_minutos(saida) - hora_em_minutos(volta_almoco)) / 60.0
    horas_manha + horas_tarde
  end

  def calcular_horas_extras(entrada, saida_almoco, volta_almoco, saida)
    total_horas = calcular_total_horas(entrada, saida_almoco, volta_almoco, saida)
    total_horas > 8 ? total_horas - 8 : 0
  end

  def hora_em_minutos(hora)
    partes = hora.split(":").map(&:to_i) # Exemplo: "08:00" -> [8, 0]
    partes[0] * 60 + partes[1] # Converte para minutos
  end

end