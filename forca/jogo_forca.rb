def da_boas_vindas
  puts 'Bem-vindo ao jogo da forca'
  puts 'Meu querido(a) competidor qual é o seu nome? '
  nome = gets.strip
end

def pede_um_chute(chutes, erros)
  puts "\n\n\n\n"
  puts "A quantidade de erros: #{erros}"
  puts "Os chutes são #{chutes}"
  puts "Digite o seu chute."
  chute = gets.strip
  puts "Será que acertou? Você chutou #{chute}"
  chute
end

def joga(nome)
  palavra_secreta= sorteia_palavra_secreta

  erros = 0
  chutes = []
  pontos_ate_agora = 0

  while erros < 5
    chute = pede_um_chute(chutes, erros)
    if chutes.include? chute
      puts "Você chutou a letra '#{chute}' novamente."
      next
    end
    chutes << chute

    chutou_uma_letra = chute.size == 1
    chutou_uma_palavra = chute.size > 1

    if chutou_uma_palavra
      pontos_ate_agora += 100 if chute == palavra_secreta
      break
    end

    if chutou_uma_letra
      quantidade_letra = palavra_secreta.count(chute)
      puts "Parabéns você acertou uma letra, esta letra aparece >>>> #{quantidade_letra} vezes"
      pontos_ate_agora += 100
      next
    end
    puts 'Faça o seu chute para a palavra secreta'
    pontos_ate_agora -= 30
    erros += 1
  end
  puts "#{nome} ganhou #{pontos_ate_agora} pontos."

end

def sorteia_palavra_secreta
  palavra_secreta = 'programador'
end

def nao_quer_jogar?
  puts 'Você deseja jogar ? (S/N)'
  quer_jogar = gets.strip
  nao_quer_jogar = quer_jogar.upcase != 'S'
end

nome = da_boas_vindas

loop do
  joga nome
  break if nao_quer_jogar?
end
