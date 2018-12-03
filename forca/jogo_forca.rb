require_relative 'ui'
require_relative 'rank'

def palavra_forca(chutes, palavra_secreta)
  mascara = ""
  palavra_secreta.chars.each do |letra|
    if chutes.include? letra
      mascara << letra
    else
      mascara << '_'
    end
  end
  mascara
end

def pede_um_chute_valido(chutes, erros, mascara)
  cabecalho_chute chutes, erros, mascara
  loop do
    chute = pede_um_chute
    if chutes.include? chute
      avisa_chutou_uma_letra_repetida chute
    else
      return chute
    end
  end
end
def joga(nome)
  palavra_secreta= sorteia_palavra_secreta

  erros = 0
  chutes = []
  pontos_ate_agora = 0

  while erros < 5
    mascara = palavra_forca(chutes, palavra_secreta)
    chute = pede_um_chute_valido(chutes, erros, mascara)
    chutes << chute

    chutou_uma_letra = chute.size == 1
    chutou_uma_palavra = chute.size > 1

    if chutou_uma_palavra
      pontos_ate_agora += 100 if chute == palavra_secreta
      break
    end

    if chutou_uma_letra
      quantidade_letra = palavra_secreta.count(chute)
      avisa_acerto_uma_letra quantidade_letra
      pontos_ate_agora += 100
      avisa_pontos_ganhos(nome, pontos_ate_agora)
      next
    end
    avisa_errou
    pontos_ate_agora -= 30
    erros += 1
  end
  avisa_pontos_ganhos(nome, pontos_ate_agora)
  pontos_ate_agora
end

def sorteia_palavra_secreta
  avisa_escolhendo_palavra
  texto = File.read('dicionario.txt')
  todas_as_palavras= texto.split("\n")
  numero_escolhido = rand(todas_as_palavras.size)
  palavra_secreta = todas_as_palavras[numero_escolhido].downcase
  avisa_palavra_escolhida(palavra_secreta)
end

def sorteia_palavra_secreta_otimizada
  avisa_escolhendo_palavra
  arquivo = File.new("dicionario.txt")
  quantidade_de_palavras = arquivo.gets.to_i
  numero_escolhido = rand(quantidade_de_palavras)
  puts numero_escolhido
  for linha in 1..(numero_escolhido-1)
    arquivo.gets
  end
  palavra_secreta = arquivo.gets.to_s.split("\n").downcase
  arquivo.close
  avisa_palavra_escolhida(palavra_secreta)
end

def nao_quer_jogar?
  avisar_jogar_novamente
  quer_jogar = gets.strip
  nao_quer_jogar = quer_jogar.upcase != 'S'
end

def jogo_da_forca
  nome = da_boas_vindas
  pontos_totais = 0
  avisa_campeao_atual

  loop do
    pontos_totais += joga nome
    avisa_pontos_totais pontos_totais

    if le_rank[1].to_i < pontos_totais
      salva_rank nome, pontos_totais
    end
    break if nao_quer_jogar?
  end
end