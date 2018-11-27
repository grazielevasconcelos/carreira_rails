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

def avisa_chutou_uma_letra(chute)
  puts "Você chutou a letra '#{chute}' novamente."
end

def avisa_acerto_uma_letra quantidade_letra
  puts "Parabéns você acertou uma letra, esta letra aparece >>>> #{quantidade_letra} vezes"
end

def avisa_errou
  puts 'Você errou. Faça o seu chute para a palavra secreta'
end

def avisa_pontos_ganhos(nome, pontos_ate_agora)
puts "#{nome} ganhou #{pontos_ate_agora} pontos."
end

def avisar_jogar_novamente
  puts 'Você deseja jogar ? (S/N)'
end