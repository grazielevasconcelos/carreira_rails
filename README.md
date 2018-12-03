# carreira_rails

##Instalação

Antes de realizar a instalação da versão do Ruby é importante ter em mente que é possível (bem comum) cada projeto ter uma versão do Ruby diferente, para melhor gerenciarmos utilizamos utilizamos 'gestores de versão', como rbenv ou RVM para instalarmos a versão do Ruby na mesma estrutura do projeto que estamos trabalhando.

Conferimos as versões e o passo de instalação em:
* [rbenv](https://github.com/rbenv/rbenv)
* [RVM:](http://rvm.io/)
* [Ruby:](https://www.ruby-lang.org/en/downloads/)

Como mostrar no terminal uma mensagem
```ruby
puts 'Qual é o seu nome?'
```
Para interpolação é necessário o uso de aspas "" e não apóstrofe '' para que seja viável a chamada do .to_s da variável
```ruby
nome = 'Ana' 
puts "Começaremos o jogo para você, #{nome}"
```
Como capturar o que digitamos no terminal:
```ruby
nome = gets
```
.strip Retirando os espaços, quebra de linha e expressões de formatação como: \r\n
```ruby
nome = gets.strip
```

Criando um método
```ruby
def da_boas_vindas
  puts "Qual é o seu nome?"
  nome = gets.strip
  puts "\n\n\n\n\n\n"
  puts "Começaremos o jogo para você, #{nome}"
  nome
end
```

Chamando um método
```ruby
da_boas_vindas
```
