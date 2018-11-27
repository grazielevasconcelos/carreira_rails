require_relative 'ui'

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
      next
    end
    avisa_errou
    pontos_ate_agora -= 30
    erros += 1
  end
  avisa_pontos_ganhos(nome, pontos_ate_agora)
end

def sorteia_palavra_secreta
  palavra_secreta = 'programador'
end

def nao_quer_jogar?
  avisar_jogar_novamente
  quer_jogar = gets.strip
  nao_quer_jogar = quer_jogar.upcase != 'S'
end

def jogo_da_forca
  nome = da_boas_vindas
  loop do
    joga nome
    break if nao_quer_jogar?
  end
end