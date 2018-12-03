def avisa_campeao_atual
  conteudo = File.read("rank.txt")
  rank = conteudo.split "\n"
  nome = rank[0].to_s
  pontos = rank[1].to_i
  puts "O campeão atual é '#{nome}' com #{pontos} pontos."

end
def avisa_pontos_totais pontos_totais
  puts "Você possui #{pontos_totais} pontos."
end
def da_boas_vindas
  puts "/********************************/"
  puts "/**********JOGO DA FORCA*********/"
  puts "/********************************/"
  puts 'Meu querido(a) competidor qual é o seu nome? '
  nome = gets.strip
end

def cabecalho_chute(chutes, erros, mascara)
  puts "\n\n\n\n"
  puts "A palavra secreta é:  #{mascara}"
  puts "A quantidade de erros: #{erros}"
  puts "Os chutes são #{chutes}"
end

def pede_um_chute
  puts "Digite o seu chute."
  chute = gets.strip.downcase
  puts "Será que acertou? Você chutou #{chute}"
  chute
end

def avisa_chutou_uma_letra_repetida(chute)
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

def avisa_escolhendo_palavra
  puts 'Escolhendo palavra secreta...'
end

def avisa_palavra_escolhida(palavra_secreta)
  puts "Palavra secreta com #{palavra_secreta.size} letras... boa sorte!"
  palavra_secreta
end