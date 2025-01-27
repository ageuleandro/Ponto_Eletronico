class Trabalhador
  attr_accessor :codigo, :nome, :funcao, :horario_trabalho, :ctps, :descanso_semanal

  def initialize(codigo, nome, funcao, horario_trabalho, ctps, descanso_semanal = 'Sábado e Domingo')
    @codigo = codigo
    @nome = nome
    @funcao = funcao
    @horario_trabalho = horario_trabalho
    @ctps = ctps
    @descanso_semanal = descanso_semanal
  end

  def exibir_detalhes
    puts "Código: #{@codigo}"
    puts "Nome: #{@nome}"
    puts "Função: #{@funcao}"
    puts "Horário de Trabalho: #{@horario_trabalho}"
    puts "CTPS: #{@ctps}"
    puts "Descanso Semanal: #{@descanso_semanal}"
  end

  def atualizar_informacoes(nome: nil, funcao: nil, horario_trabalho: nil, ctps: nil, descanso_semanal: nil)
    @nome = nome if nome
    @funcao = funcao if funcao
    @horario_trabalho = horario_trabalho if horario_trabalho
    @ctps = ctps if ctps
    @descanso_semanal = descanso_semanal if descanso_semanal
    puts "Informações atualizadas com sucesso!"
  end
end

