class Sistema
  attr_accessor :trabalhadores, :folhas_ponto

  def initialize
    @trabalhadores = []
    @folhas_ponto = []
  end

  # Metodo para cadastrar um trabalhador
  def cadastrar_trabalhador(codigo, nome, funcao, horario_trabalho, ctps)
    trabalhador = Trabalhador.new(codigo, nome, funcao, horario_trabalho, ctps)
    @trabalhadores << trabalhador
    puts "Trabalhador #{nome} cadastrado com sucesso!"
  end

  # Metodo para listar todos os trabalhadores
  def listar_trabalhadores
    puts "\n=== Lista de Trabalhadores ==="
    @trabalhadores.each_with_index do |trabalhador, index|
      puts "#{index + 1}. Nome: #{trabalhador.nome}, Função: #{trabalhador.funcao}, Código: #{trabalhador.codigo}"
    end
  end

  # Metodo para criar uma folha de ponto para um trabalhador
  def criar_folha_ponto(codigo_trabalhador)
    trabalhador = @trabalhadores.find { |t| t.codigo == codigo_trabalhador }
    if trabalhador
      folha = Folhaponto.new(trabalhador)
      @folhas_ponto << folha
      puts "Folha de ponto criada para #{trabalhador.nome}."
    else
      puts "Trabalhador com código #{codigo_trabalhador} não encontrado."
    end
  end

  # Metodo para adicionar registro de ponto
  def adicionar_ponto(codigo_trabalhador, data, entrada, saida_almoco, volta_almoco, saida)
    folha = @folhas_ponto.find { |fp| fp.trabalhador.codigo == codigo_trabalhador }
    if folha
      folha.adicionar_ponto(data, entrada, saida_almoco, volta_almoco, saida)
    else
      puts "Folha de ponto não encontrada para o trabalhador com código #{codigo_trabalhador}."
    end
  end
end
